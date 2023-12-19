package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.UserDAOlmpl;
import com.example.ebooksystemproject.DB.DBconnect;
import com.example.ebooksystemproject.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
 protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException{

     try {

         String name=req.getParameter("fname");
         String email=req.getParameter("email");
         String phno=req.getParameter("phno");
         String password=req.getParameter("password");
         String check=req.getParameter("check");

         //System.out.println(name+" "+email+" "+phno+" "+password+" "+check);


         User us = new User();
         us.setName(name);
         us.setEmail(email);
         us.setPhno(phno);
         us.setPassword(password);

         HttpSession session= req.getSession();
         if(check!=null) {
             UserDAOlmpl dao = new UserDAOlmpl(DBconnect.getConn());
             boolean f2=dao.checkUser(email);
             if(f2){

                 boolean f = dao.userRegister(us);

                 if (f = true) {
                     //System.out.println("User register success...");

                     session.setAttribute("succMsg","Başarıyla Kayıt Olundu");
                     resp.sendRedirect("index.jsp");
                 } else {
                     //System.out.println("Something went wrong on server...");
                     session.setAttribute("failedMsg","Bir şeyler ters gitti");
                     resp.sendRedirect("register.jsp");
                 }
             }
             else{
                 session.setAttribute("failedMsg2","Bu mail adrsiyle kayıtlı kullanıcı bulundu. Lütfen başka mail adresi deneyiniz");
                 resp.sendRedirect("register.jsp");
             }
         }
         else {
             //System.out.println("Lütfen kvkk metnini onaylayınız!!!");

             session.setAttribute("failedMsg","Lütfen kvkk metnini onaylayınız!!!");
             resp.sendRedirect("register.jsp");
         }
     }
     catch (Exception exception){
         exception.printStackTrace();
     }
 }



}
