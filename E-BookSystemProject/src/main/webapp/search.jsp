<%@ page import="com.example.ebooksystemproject.entity.User" %>
<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 14.12.2023
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Search Results</title>
    <%@include file="all_component/allCss.jsp"%>
    <style type="text/css">

        .crd-ho:hover{
            background-color: #fcf7f7;

        }


    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<%
    User u=(User)session.getAttribute("userobj");

%>

<div class="container-fluid">
    <div class="row p-3">
        <%
            String ch = request.getParameter("ch");
            BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list = dao.getBookBySearch(ch);

            // Check if the list is empty
            if (list.isEmpty()) {
        %>
        <div class="container">
            <div class="col-md-6" style="position: relative;top: 50%;left: 50%;transform: translate(-50%, -50%);padding: 10px;">
                <div class="card" style="border: 0px;width: 75%;margin: auto;">
                    <div class="card-body">
                        <i class="fa-solid fa-xmark fa-10x" style="position: relative;top: 50%;left: 38%;color: red;"></i>
                        <p style="position: relative;left: 10%;">Arama Kriterlerine Uygun Sonuç Bulunamadı</p>
                        <a href="index.jsp" class="btn btn-primary" style="position: relative;left: 38%;">Tekrar Ara</a>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else {
            // Iterate through the list and display books
            for (BookDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="<%= b.getBookname() %>" src="Books/<%= b.getPhotoName() %>" style="width: 150px;height: 200px" class="img-thumbnail">
                    <p><%= b.getBookname() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p>
                        <% if (b.getBookCategory().equals("Old")) { %>
                        Kategori:Eski
                        <% } else { %>
                        Kategori:Yeni
                        <% } %>
                    </p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <% if (u == null) { %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Sepete Ekle</a>
                        <% } else { %>
                        <a href="cart?bookId=<%= b.getBookId() %>&&userId=<%= u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Sepete Ekle</a>
                        <% } %>
                        <a href="view_books.jsp?id=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-1">İncele</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>



<%@include file="all_component/Footer.jsp"%>
</body>
</html>
