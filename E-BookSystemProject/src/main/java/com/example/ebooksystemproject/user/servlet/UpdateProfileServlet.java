package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.UserDAOlmpl;
import com.example.ebooksystemproject.DB.DBconnect;
import com.example.ebooksystemproject.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id=Integer.parseInt(req.getParameter("id"));
            String name=req.getParameter("fname");
            String email=req.getParameter("email");
            String phno=req.getParameter("phno");
            String password=req.getParameter("password");

            UserDAOlmpl dao=new UserDAOlmpl(DBconnect.getConn());
            User us=new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            boolean f = dao.checkPassword(id,password);
            HttpSession session= req.getSession();

            if(f)
            {

                boolean f2=dao.updateProfile(us);
                if (f2)
                {
                    session.setAttribute("succMsg","Bilgileriniz başarıyla güncellendi");
                    resp.sendRedirect("edit_profile.jsp");

                }
                else
                {
                    session.setAttribute("failedMsg","Bir şeyler ters gitti");
                    resp.sendRedirect("edit_profile.jsp");
                }
            }
            else
            {
                session.setAttribute("failedMsg2","Şifreniz yanlış");
                resp.sendRedirect("edit_profile.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
