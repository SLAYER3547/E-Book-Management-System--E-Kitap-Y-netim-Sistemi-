<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 6.12.2023
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin: All Books</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>


<h3 class="text-center">Hoşgeldiniz</h3>
<c:if test="${empty userobj }">
    <c:redirect url="/login.jsp"/>

</c:if>

<c:if test="${not empty succMsg}">
    <h5 class="text-center text-success">${succMsg}</h5>
    <c:remove var="succMsg" scope="session"></c:remove>
</c:if>

<c:if test="${not empty failedMsg}">
    <h5 class="text-center text-danger">${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"></c:remove>
</c:if>

<table class="table  table-striped">
    <thead class="table-dark">
    <tr>
        <th scope="col"  style="color: white !important;">ID</th>
        <th scope="col"  style="color: white !important;">Resim</th>
        <th scope="col"  style="color: white !important;">Kitap Adı</th>
        <th scope="col"  style="color: white !important;">Yazar Adı</th>
        <th scope="col"  style="color: white !important;">Fiyat</th>
        <th scope="col"  style="color: white !important;">Kategori</th>
        <th scope="col"  style="color: white !important;">Durum</th>
        <th scope="col"  style="color: white !important;">İşlem</th>
    </tr>
    </thead>
    <tbody>
    <%
        BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());
        List<BookDtls> list = dao.getAllBooks();
        for (BookDtls b : list) {
            String bookCategory = b.getBookCategory();
            String statusText = "";
            String editDeleteButtons = "";

            if ("Old".equals(bookCategory)) {
                statusText = "İkinci El";
            } else if ("New".equals(bookCategory)) {
                statusText = "Sıfır Kitap";
                editDeleteButtons =
                        "<a href='edit_books.jsp?id=" + b.getBookId() + "' class='btn btn-sm btn-primary'>" +
                                "<i class='fas fa-edit'></i> Düzenle</a>" +
                                "<a href='../delete?id=" + b.getBookId() + "' class='btn btn-sm btn-danger'>" +
                                "<i class='fas fa-trash-alt'></i> Sil</a>";
            }
    %>

    <tr>
        <td><%= b.getBookId() %></td>
        <td><img src="../Books/<%= b.getPhotoName() %>" style="width: 50px" height="50px"></td>
        <td><%= b.getBookname() %></td>
        <td><%= b.getAuthor() %></td>
        <td><%= b.getPrice() %></td>
        <td><%= statusText%></td>
        <td>Aktif</td>
        <td>
            <%= editDeleteButtons %>
        </td>
    </tr>

    <%
        }
    %>




    </tbody>
</table>

<div><%@include file="Footer.jsp"%></div>
</body>
</html>
