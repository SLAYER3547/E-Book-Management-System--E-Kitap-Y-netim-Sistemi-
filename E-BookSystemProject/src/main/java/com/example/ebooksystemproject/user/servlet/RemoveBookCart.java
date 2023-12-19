package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.CartDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bookId=Integer.parseInt(req.getParameter("bookId"));
        int userId=Integer.parseInt(req.getParameter("userId"));
        int cartId=Integer.parseInt(req.getParameter("cartId"));
        CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
        boolean f=dao.deleteBook(bookId,userId,cartId);
        HttpSession session=req.getSession();

        if(f)
        {
            session.setAttribute("succMsg","Kitap sepetten silindi");
            resp.sendRedirect("checkout.jsp");
        }
        else
        {
            session.setAttribute("failedMsg","Bir şeyler ters gitti");
            resp.sendRedirect("checkout.jsp");
        }
    }
}
