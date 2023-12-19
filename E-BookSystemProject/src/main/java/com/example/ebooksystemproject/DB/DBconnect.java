package com.example.ebooksystemproject.DB;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
    private static Connection conn;
    public static Connection getConn()
    {

        try{



            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            conn=(Connection) DriverManager.getConnection("jdbc:sqlserver://localhost:1433;database=ebook;trustServerCertificate=true;","myuser2","Fatih47.");

        }
        catch (Exception exception)
        {

            exception.printStackTrace();
        }

         return conn;
    }
}
