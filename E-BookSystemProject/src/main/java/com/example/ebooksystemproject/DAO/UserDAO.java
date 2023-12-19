package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.User;

public interface UserDAO {

    public boolean userRegister (User user);

    public User login(String email,String password);

    public boolean checkPassword(int id,String ps);

    public  boolean updateProfile(User user);

    public boolean checkUser(String email);
}
