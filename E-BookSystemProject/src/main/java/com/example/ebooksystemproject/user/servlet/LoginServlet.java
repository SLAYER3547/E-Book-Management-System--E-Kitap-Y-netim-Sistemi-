package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.UserDAOlmpl;
import com.example.ebooksystemproject.DB.DBconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.ebooksystemproject.entity.User;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try
        {
            UserDAOlmpl dao=new UserDAOlmpl(DBconnect.getConn());

            HttpSession session=req.getSession();

            String email=req.getParameter("email");
            String password=req.getParameter("password");
            if("admin@gmail.com".equals(email) && "admin".equals(password))
            {
                User us=new User();
                us.setName("Admin");
                session.setAttribute("userobj",us);
                resp.sendRedirect("admin/home.jsp");
            }
            else
            {
                User us=dao.login(email,password);
                if(us!=null)
                {
                    session.setAttribute("userobj",us);
                    resp.sendRedirect("index.jsp");
                }
                else
                {
                    session.setAttribute("failedMsg","Yanlış E mail adresi veya Şifre");
                    resp.sendRedirect("login.jsp");
                }

                resp.sendRedirect("home.jsp");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
