package com.example.ebooksystemproject.DAO;

import com.example.ebooksystemproject.entity.BookDtls;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

public interface BookDAO {

    public boolean addBooks(BookDtls b);

    public List<BookDtls> getAllBooks();

    public  BookDtls getBookById(int id);

    public boolean updateEditBooks(BookDtls b);

    public boolean deleteBooks(int id);

    public List<BookDtls> getNewBook();

    public List<BookDtls> getRecentBooks();

    public List<BookDtls> getOldBooks();

    public List<BookDtls> getAllRecentBook();

    public List<BookDtls> getAllNewBook();

    public List<BookDtls> getAllOldBook();

    public List<BookDtls> getBookByOld(String email,String category);

    public boolean oldBookDelete(String email,String category,int bookId);

    public List<BookDtls> getBookBySearch(String ch);


}
