package com.example.ebooksystemproject.admin.servlet;

import com.example.ebooksystemproject.DAO.BookDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int id=Integer.parseInt(req.getParameter("id"));

            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            boolean f=dao.deleteBooks(id);

            HttpSession session=req.getSession();

            if(f)
            {
                session.setAttribute("succMsg","Kitap Başarıyla Silindi");
                resp.sendRedirect("admin/all_books.jsp");
            }
            else
            {
                session.setAttribute("failedMsg","Bir şeyler ters gitti");
                resp.sendRedirect("admin/all_books.jsp");
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
