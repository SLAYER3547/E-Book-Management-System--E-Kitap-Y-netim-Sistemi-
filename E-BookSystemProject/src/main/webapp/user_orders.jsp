<%@ page import="com.example.ebooksystemproject.entity.User" %>
<%@ page import="com.example.ebooksystemproject.DAO.BookOrderImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.Book_Order" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 11.12.2023
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>User Orders</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp">

    </c:redirect>
</c:if>

<div class="container mt-5">
    <h3 class="text-center text-success">Siparişleriniz</h3>
    <table class="table  table-striped">
        <thead class="table-primary">
        <tr>
            <th scope="col">Sipariş Kodu</th>
            <th scope="col">Ad-Soyad</th>
            <th scope="col">Kitap Adı</th>
            <th scope="col">Yazar Adı</th>
            <th scope="col">Fiyat</th>
            <th scope="col">Ödeme Yöntemi</th>
        </tr>
        </thead>
        <tbody>

        <%
        User u=(User) session.getAttribute("userobj");
        BookOrderImpl dao=new BookOrderImpl(DBconnect.getConn());
        List<Book_Order> blist =dao.getOrders(u.getId());
        for(Book_Order b:blist) {%>
        <tr>
            <td><%=b.getOrderId()%></td>
            <td>${userobj.name}</td>
            <td><%=b.getBookName()%></td>
            <td><%=b.getAuthorName()%></td>
            <td><%=b.getPrice()%></td>
            <td>Kapıda Ödeme</td>
        </tr>
        <%}
        %>




        </tbody>
    </table>

</div>

<%@include file="all_component/Footer.jsp" %>

</body>
</html>
