package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.BookDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete_old_book")
public class Delete_Old_Book  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String email=req.getParameter("mail");
            int id=Integer.parseInt(req.getParameter("id"));
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            boolean f=dao.oldBookDelete(email,"Old",id);
            HttpSession session=req.getSession();

            if(f)
            {
                session.setAttribute("succMsg","İlanınız başarıyla kaldırıldı");
                resp.sendRedirect("old_book.jsp");
            }
            else
            {
                session.setAttribute("failedMsg","Bir şeyler ters gitti");
                resp.sendRedirect("old_book.jsp");
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
