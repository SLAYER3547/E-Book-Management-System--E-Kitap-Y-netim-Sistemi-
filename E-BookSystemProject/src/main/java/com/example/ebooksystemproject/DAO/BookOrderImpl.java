package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.BookOrderViewAdmin;
import com.example.ebooksystemproject.entity.Book_Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderImpl implements BookOrderDAO{
    private Connection conn;

    @Override
    public List<BookOrderViewAdmin> getAllOrdersForAdmin() {
        List<BookOrderViewAdmin> list=new ArrayList<BookOrderViewAdmin>();
        BookOrderViewAdmin orders=null;
        try {

            String sql="Select order_id,Users.fullname as 'Müşteri Adı',book_order.e_mail,book_order.order_address,book_order.phone_number,book_order.book_name,book_order.author_name,book_order.price,book_order.payment_type from book_order inner join Users on book_order.users_id=Users.id ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                orders=new BookOrderViewAdmin();
                orders.setOrderId(rs.getInt(1));
                orders.setCustomerName(rs.getString(2));
                orders.setCustomerEmail(rs.getString(3));
                orders.setOrderAddress(rs.getString(4));
                orders.setPhoneNumber(rs.getString(5));
                orders.setBookName(rs.getString(6));
                orders.setAuthorName(rs.getString(7));
                orders.setPrice(rs.getString(8));
                orders.setPaymentType(rs.getString(9));
                list.add(orders);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Book_Order> getOrders(int id) {
        List<Book_Order> list=new ArrayList<Book_Order>();
        Book_Order o=null;
        try {

            String sql="Select * from book_order where users_id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                o=new Book_Order();
                o.setOrderId(rs.getInt(1));
                o.setUserId(rs.getInt(2));
                o.setBookId(rs.getInt(3));
                o.setEmail(rs.getString(4));
                o.setFullAddress(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthorName(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean saveOrder(List<Book_Order> blist) {
        boolean f=false;
        try {
            String sql="insert into book_order(users_id,book_id,e_mail,order_address,phone_number,book_name,author_name,price,payment_type) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps=conn.prepareStatement(sql);
            for(Book_Order b:blist)
            {
                ps.setInt(1,b.getUserId());
                ps.setInt(2,b.getBookId());
                ps.setString(3,b.getEmail());
                ps.setString(4,b.getFullAddress());
                ps.setString(5,b.getPhno());
                ps.setString(6,b.getBookName());
                ps.setString(7,b.getAuthorName());
                ps.setString(8,b.getPrice());
                ps.setString(9,b.getPaymentType());
                ps.addBatch();
            }
            int[] count=ps.executeBatch();
            conn.commit();
            f=true;
            conn.setAutoCommit(true);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return f;
    }

    public BookOrderImpl(Connection conn) {
        this.conn = conn;
    }
}
