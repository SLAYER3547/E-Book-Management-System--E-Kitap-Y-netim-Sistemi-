package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOlmpl implements  UserDAO{
    private Connection conn;

    public UserDAOlmpl(Connection conn) {
        this.conn=conn;
    }

    /*public void UserDA0lmpl(Connection conn) {


        this.conn = conn;
    }*/

    @Override
    public boolean checkUser(String email) {
        boolean f=true;

        try {

            String sql="select  * from Users where email=?";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,email);

            ResultSet rs=ps.executeQuery();

            while (rs.next()){
                f=false;
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean userRegister(User us) {
        boolean f=false;
        try {

            String sql="INSERT INTO Users(fullname,email,phno,userpassword)  values(?,?,?,?)";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,us.getName());
            ps.setString(2,us.getEmail());
            ps.setString(3,us.getPhno());
            ps.setString(4,us.getPassword());


            int i=ps.executeUpdate();

            if(i==1)
            {
                f=true;
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f=false;
        try {

            String sql="update Users set fullname=?,email=?,phno=? where id=?";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhno());
            ps.setInt(4,user.getId());

            int i=ps.executeUpdate();

            if(i==1)
            {
                f=true;
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkPassword(int id,String ps) {
        boolean f=false;

        try {
            String sql="Select * from Users where id=? and userpassword=?";
            PreparedStatement pss=conn.prepareStatement(sql);

            pss.setInt(1,id);
            pss.setString(2,ps);

            ResultSet rs=pss.executeQuery();

            while (rs.next())
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
    public User login(String email, String password) {
        User us=null;

        try
        {

            String sql="select *from Users where email=? and userpassword=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            while (rs.next())
            {
                us=new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setAddress(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return us;
    }
}
