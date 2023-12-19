<%@ page import="com.example.ebooksystemproject.DAO.CartDAO" %>
<%@ page import="com.example.ebooksystemproject.DAO.CartDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.User" %>
<%@ page import="com.example.ebooksystemproject.entity.Cart" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 10.12.2023
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>My Cart</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp">

</c:redirect>
</c:if>



<c:if test="${not empty failedMsg}">
    <div class="alert alert-danger" role="alert">

        ${failedMsg}
    </div>
    <c:remove var="failedMsg" scope="session"></c:remove>
</c:if>

<c:if test="${not empty failedMsg2}">
    <div class="alert alert-danger" role="alert">

            ${failedMsg2}
    </div>
    <c:remove var="failedMsg2" scope="session"></c:remove>
</c:if>


<c:if test="${not empty msg}">
    <div class="alert alert-danger text-center" role="alert">

            ${msg}
    </div>
    <c:remove var="msg" scope="session"></c:remove>
</c:if>

<div class="container">
    <div class="row p-2">
        <div class="col-md-6">
            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Eklenen Ürünler</h3>
                    <table class="table  table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Kitap Adı</th>
                            <th scope="col">Yazar Adı</th>
                            <th scope="col">Fiyat</th>
                            <th scope="col">İşlem</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            User u=(User) session.getAttribute("userobj");
                            CartDAO dao=new CartDAOImpl(DBconnect.getConn());
                            List<Cart> cart=dao.getBookByUser(u.getId());
                            Double totalPrice=0.0;
                            for(Cart c:cart) {
                                totalPrice=Double.parseDouble(c.getTotalPrice());
                        %>
                                <tr>
                                   <td><%=c.getBookName()%></td>
                                   <td><%=c.getAuthorName()%></td>
                                   <td><%=c.getPrice()%></td>
                                   <td>
                                       <a href="remove_book?bookId=<%=c.getBookId()%>&&userId=<%=c.getUserId()%>&&cartId=<%=c.getCartId()%>" class="btn btn-sm btn-danger">
                                           Sepetten Kaldır
                                       </a>
                                   </td>
                                </tr>
                            <%}
                        %>

                        <tr>
                            <td>Toplam Sepet Tutarı</td>
                            <td></td>
                            <td></td>
                            <td><%=totalPrice%> <i class="fa-solid fa-turkish-lira-sign"></i></td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">İletişim Bilgileriniz</h3>
                    <form action="order" method="post">

                        <input type="hidden" value="${userobj.id}" name="userId">
                        <div class="row">
                            <div class="col">
                                <label for="Name">İsim:</label>
                                <input type="text" class="form-control" id="Name"
                                      name="fname" value="${userobj.name}" required>
                            </div>
                            <div class="col">
                                <label for="email">E-Mail</label>
                                <input type="email" class="form-control"
                                       name="email" id="email" value="${userobj.email}" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label for="phoneNumber">Telefon Numarası:</label>
                                <input type="number" class="form-control"
                                       name="phno" id="phoneNumber" value="${userobj.phno}" required>
                            </div>
                            <div class="col">
                                <label for="Adress">Teslimat Adresi:</label>
                                <input type="text" class="form-control" id="Adress" name="address" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label for="Landmark">Referans Noktası</label>
                                <input type="text" class="form-control" id="Landmark" name="landmark" required>
                            </div>
                            <div class="col">
                                <label for="City">Şehir</label>
                                <input type="text" class="form-control" id="City" name="city" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label for="State">İlçe</label>
                                <input type="text" class="form-control" id="State" name="state" required>
                            </div>
                            <div class="col">
                                <label for="ZipCode">Posta Kodu</label>
                                <input type="text" class="form-control" id="ZipCode" name="zipcode" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Ödeme Yöntemi</label>
                                <select class="form-control" name="payment">
                                    <option value="secilmedi">--Seç--</option>
                                    <option value="Kapıda Ödeme">Kapida Odeme</option>
                                </select>

                            </div>
                        </div>

                        <div class="row mt-5 text-center">
                            <div class="col">
                                <button class="btn btn-warning" type="submit">Sipariş Ver</button>
                                <a href="index.jsp" class="btn btn-success">Alışverişe Devam Et</a>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/Footer.jsp" %>

</body>
</html>
