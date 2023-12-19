<%@ page import="com.example.ebooksystemproject.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 11.12.2023
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Settings</title>
    <%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">
<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>




<div class="container">
    <h3 class="text-center">Hoşgeldiniz ${userobj.name}</h3>

    <div class="row p-5">

        <div class="col-md-4">
            <a href="sell_book.jsp" style="text-decoration: none">
                <div class="card text-primary">
                    <div class="card-body text-center">
                        <i class="fas fa-book-open fa-3x"></i>
                        <h4>Eski Kitaplarını Sat</h4>
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md-4">
            <a href="old_book.jsp" style="text-decoration: none">
                <div class="card text-primary">
                    <div class="card-body text-center">
                        <i class="fas fa-book-open fa-3x"></i>
                        <h4>İlanlarım</h4>
                    </div>
                </div>
            </a>

        </div>


        <div class="col-md-4">
            <a href="edit_profile.jsp" style="text-decoration: none">
                <div class="card text-success">
                    <div class="card-body text-center">
                        <i class="fas fa-edit fa-3x"></i>
                        <h4>Profilini Düzenle</h4>
                    </div>
                </div>
            </a>

        </div>





        <div class="col-md-6 mt-3">
            <a href="user_orders.jsp" style="text-decoration: none">
                <div class="card text-danger">
                    <div class="card-body text-center">
                        <i class="fas fa-box-open fa-3x"></i>
                        <h3>Siparişleriniz</h3>
                        <p>Siparişlerini Takip Et</p>
                    </div>
                </div>
            </a>

        </div>

        <!--
                <div class="col-md-4 mt-3">
            <a href="user_addres.jsp" style="text-decoration: none">
                <div class="card text-warning">
                    <div class="card-body text-center">
                        <i class="fas fa-map-marker-alt fa-3x"></i>
                        <h3>Adres Bilgileriniz</h3>
                        <p>Adresini Düzenle</p>
                    </div>
                </div>
            </a>

        </div>


        -->

        <div class="col-md-6 mt-3">
            <a href="helpline.jsp" style="text-decoration: none">
                <div class="card text-primary">
                    <div class="card-body text-center">
                        <i class="fas fa-user-circle fa-3x"></i>
                        <h3>Yardım Merkezi</h3>
                        <p>7/24 Hizmet</p>
                    </div>
                </div>
            </a>

        </div>


    </div>

</div>









<%@include file="all_component/Footer.jsp" %>



</body>
</html>
