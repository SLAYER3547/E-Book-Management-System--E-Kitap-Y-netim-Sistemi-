package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.BookDAOImpl;
import com.example.ebooksystemproject.DAO.CartDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import com.example.ebooksystemproject.entity.BookDtls;
import com.example.ebooksystemproject.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int bookId=Integer.parseInt(req.getParameter("bookId"));
            int userId=Integer.parseInt(req.getParameter("userId"));

            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            BookDtls b = dao.getBookById(bookId);

            String bookName=b.getBookname();

            String authorName=b.getAuthor();
            Cart c=new Cart();

            c.setBookId(bookId);
            c.setUserId(userId);
            c.setBookName(bookName);
            c.setAuthorName(authorName);
            c.setPrice(b.getPrice());
            c.setTotalPrice(b.getPrice());

            CartDAOImpl dao2=new CartDAOImpl(DBconnect.getConn());

            boolean f=dao2.addCart(c);

            HttpSession session=req.getSession();

            if(f)
            {
                session.setAttribute("addCart","Kitap Sepete Eklendi");
                resp.sendRedirect("all_new_book.jsp");
            }
            else
            {
                session.setAttribute("failed","Bir şeyler ters gitti");
                resp.sendRedirect("all_new_book.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
