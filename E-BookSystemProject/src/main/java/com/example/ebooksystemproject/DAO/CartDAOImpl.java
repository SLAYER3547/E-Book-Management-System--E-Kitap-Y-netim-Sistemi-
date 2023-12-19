package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.BookDtls;
import com.example.ebooksystemproject.entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO{

    private Connection conn;

    public  CartDAOImpl(Connection conn)
    {
        this.conn=conn;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list=new ArrayList<Cart>();
        Cart c=null;
        double totalPrice=0;
        try {
            String sql="Select * from cart where userId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,userId);

            ResultSet rs=ps.executeQuery();

            while (rs.next())
            {
                c=new Cart();
                c.setCartId(rs.getInt(1));
                c.setBookId(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthorName(rs.getString(5));
                c.setPrice(rs.getString(6));;
                totalPrice=totalPrice+Double.parseDouble(rs.getString(7));
                c.setTotalPrice(String.valueOf( totalPrice));
                list.add(c);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Cart getCartById(int id) {
        Cart c=new Cart();
        try {
            String sql="Select * from cart where cartId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,id);

            ResultSet rs=ps.executeQuery();

            while (rs.next())
            {
                c=new Cart();
                c.setCartId(rs.getInt(1));
                c.setBookId(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthorName(rs.getString(5));
                c.setPrice(rs.getString(6));
                c.setTotalPrice(rs.getString(7));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public Boolean deleteBook(int id,int userid,int cartId) {
        boolean f=false;
        try {
            String sql="delete from cart where bookId=? and userId=? and cartId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setInt(2,userid);
            ps.setInt(3,cartId);
            int i=ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f=false;
        try {

            String sql="insert into cart(bookId,userId,bookName,authorName,price,totalPrice) values(?,?,?,?,?,?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,c.getBookId());
            ps.setInt(2,c.getUserId());
            ps.setString(3,c.getBookName());
            ps.setString(4,c.getAuthorName());
            ps.setString(5,c.getPrice());
            ps.setString(6,c.getTotalPrice());

            int i=ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
