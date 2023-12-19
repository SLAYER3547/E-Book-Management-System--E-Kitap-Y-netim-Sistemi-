package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.BookDtls;
import com.example.ebooksystemproject.entity.Cart;

import java.util.List;

public interface CartDAO {

    public boolean addCart(Cart c);

    public List<Cart> getBookByUser(int userId);

    public Boolean deleteBook(int id,int userid,int cartId);

    public Cart getCartById(int id);

}
