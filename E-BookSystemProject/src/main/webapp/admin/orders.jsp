<%@ page import="com.example.ebooksystemproject.DAO.BookOrderImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.Book_Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.User" %>
<%@ page import="com.example.ebooksystemproject.entity.BookOrderViewAdmin" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 6.12.2023
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: All Orders</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
    <c:redirect url="/login.jsp"/>

</c:if>




<h3 class="text-center">Hoşgeldiniz</h3>

<table class="table  table-striped">
    <thead class="table-dark">
    <tr>
        <th scope="col"  style="color: white !important;">Sipariş Numarası</th>
        <th scope="col"  style="color: white !important;">Müşteri Adı</th>
        <th scope="col"  style="color: white !important;">E-Mail Adresi</th>
        <th scope="col"  style="color: white !important;">Adres</th>
        <th scope="col"  style="color: white !important;">Telefon Numarası</th>
        <th scope="col"  style="color: white !important;">Kitap Adı</th>
        <th scope="col"  style="color: white !important;">Yazar</th>
        <th scope="col"  style="color: white !important;">Fiyat</th>
        <th scope="col"  style="color: white !important;">Ödeme Yöntemi</th>
    </tr>
    </thead>
    <tbody>

    <%
        BookOrderImpl dao=new BookOrderImpl(DBconnect.getConn());
        List<BookOrderViewAdmin> blist =dao.getAllOrdersForAdmin();
        for(BookOrderViewAdmin b:blist) {%>
    <tr>
        <td><%=b.getOrderId()%></td>
        <td><%=b.getCustomerName()%></td>
        <td><%=b.getCustomerEmail()%></td>
        <td><%=b.getOrderAddress()%></td>
        <td><%=b.getPhoneNumber()%></td>
        <td><%=b.getBookName()%></td>
        <td><%=b.getAuthorName()%></td>
        <td><%=b.getPrice()%></td>
        <td>Kapıda Ödeme</td>
    </tr>
    <%}
    %>

    </tbody>
</table>

<div><%@include file="Footer.jsp"%></div>
</body>
</html>
