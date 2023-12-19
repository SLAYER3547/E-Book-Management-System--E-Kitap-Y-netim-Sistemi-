package com.example.ebooksystemproject.user.servlet;

import com.example.ebooksystemproject.DAO.BookOrderImpl;
import com.example.ebooksystemproject.DAO.CartDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import com.example.ebooksystemproject.entity.BookDtls;
import com.example.ebooksystemproject.entity.Book_Order;
import com.example.ebooksystemproject.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int id=Integer.parseInt(req.getParameter("userId"));
            String name=req.getParameter("fname");
            String email=req.getParameter("email");
            String phno=req.getParameter("phno");
            String payment=req.getParameter("payment");
            String address=req.getParameter("address");
            String landmark=req.getParameter("landmark");
            String city=req.getParameter("city");
            String state=req.getParameter("state");
            String pincode=req.getParameter("zipcode");
            String fullAddress=address+","+landmark+","+city+","+state+","+pincode;

            CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
            HttpSession session=req.getSession();

            List<Cart> blist=dao.getBookByUser(id);
            if(blist.isEmpty()){
                session.setAttribute("failedMsg2","Sepetinizde hiç ürün yok lütfen ürün ekleyip bir daha deneyiniz!!!");
                resp.sendRedirect("checkout.jsp");

            }
            else{
                BookOrderImpl dao2=new BookOrderImpl(DBconnect.getConn());
                Book_Order o = null;
                ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
                for(Cart c:blist)
                {
                    o=new Book_Order();
                    o.setUserId(id);
                    o.setBookId(c.getBookId());
                    o.setEmail(email);
                    o.setFullAddress(fullAddress);
                    o.setPhno(phno);
                    o.setBookName(c.getBookName());
                    o.setAuthorName(c.getAuthorName());
                    o.setPrice(c.getPrice()+"");
                    o.setPaymentType("COD");
                    orderList.add(o);
                }
                if("secilmedi".equals(payment))
                {
                    session.setAttribute("msg","Lütfen ödeme yöntemini seçiniz!!!");
                    resp.sendRedirect("checkout.jsp");
                }
                else
                {

                    boolean f=dao2.saveOrder(orderList);

                    if (f)
                    {
                        resp.sendRedirect("order_success.jsp");

                    }
                    else{
                        session.setAttribute("failedMsg","Bilinmeyen bir sebepten dolayı siparişinizi alamadık");
                        resp.sendRedirect("checkout.jsp");

                    }
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();

        }
    }
}
