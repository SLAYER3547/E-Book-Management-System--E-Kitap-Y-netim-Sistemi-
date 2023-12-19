package com.example.ebooksystemproject.admin.servlet;

import com.example.ebooksystemproject.DAO.BookDAOImpl;
import com.example.ebooksystemproject.DB.DBconnect;
import com.example.ebooksystemproject.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try
        {
            String bookName=req.getParameter("bname");
            String author=req.getParameter("author");
            String price=req.getParameter("price");
            String categories=req.getParameter("categories");
            String status=req.getParameter("status");
            Part part=req.getPart("bimg");
            String fileName=part.getSubmittedFileName();

            BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,"admin@gmail.com");

            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());



            boolean f=dao.addBooks(b);

            HttpSession session=req.getSession();

            if(f)
            {
                String path="C://Users//fatihPC//Desktop//E-BookSystemProject//src//main//webapp//Books";
                //File f=new File(path);

                String dosyaAdi = fileName.toString();
                Path hedefKlasor  = Paths.get(path);
                if (!Files.exists(hedefKlasor )) {
                    try {
                        Files.createDirectories(hedefKlasor );
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                Path hedefDosya = hedefKlasor.resolve(dosyaAdi);
                try (InputStream inputStream = part.getInputStream()) {
                    Files.copy(inputStream, hedefDosya);
                    System.out.println("Dosya başarıyla kopyalandı.");
                } catch (IOException e) {
                    e.printStackTrace();
                }

                //part.write(path+File.separator+fileName);
                session.setAttribute("succMsg","Kitap Başarıyla Eklendi");
                resp.sendRedirect("admin/add_books.jsp");
            }
            else
            {
                session.setAttribute("failedMsg","Kitap Eklenemedi!!!");
                resp.sendRedirect("admin/add_books.jsp");
            }


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
