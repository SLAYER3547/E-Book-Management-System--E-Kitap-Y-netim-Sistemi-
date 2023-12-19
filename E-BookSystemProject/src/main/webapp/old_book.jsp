<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 13.12.2023
  Time: 03:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Old Books</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<c:if test="${not empty succMsg}">
    <p class="text-center text-success">${succMsg}</p>
    <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
    <p class="text-center text-danger">${failedMsg}</p>
    <c:remove var="failedMsg" scope="session"/>

</c:if>

<div class="container">
    <table class="table  table-striped mt-3">
        <thead class="table-primary">
        <tr>
            <th scope="col">Kitap Adı</th>
            <th scope="col">Yazar Adı</th>
            <th scope="col">Fiyat</th>
            <th scope="col">Kategori</th>
            <th scope="col">İşlem</th>
        </tr>
        </thead>
        <tbody>

        <%
            User u= (User)session.getAttribute("userobj");
            String email=u.getEmail();
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list =dao.getBookByOld(email,"Old");
            for(BookDtls b:list)
            {%>
               <tr>
                   <td><%=b.getBookname()%></td>
                   <td><%=b.getAuthor()%></td>
                   <td><%=b.getPrice()%></td>
                   <td>İkinci El</td>
                   <td><a href="delete_old_book?mail=<%=b.getEmail()%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Sil</a></td>
               </tr>

            <%}%>


        </tbody>
    </table>
</div>






<%@include file="all_component/Footer.jsp" %>

</body>
</html>
