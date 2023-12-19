package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.BookOrderViewAdmin;
import com.example.ebooksystemproject.entity.Book_Order;

import java.util.List;

public interface BookOrderDAO {

    public boolean saveOrder(List<Book_Order> blist);

    public List<Book_Order> getOrders(int id);

    public List<BookOrderViewAdmin> getAllOrdersForAdmin();
}
