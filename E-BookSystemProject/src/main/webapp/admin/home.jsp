<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 5.12.2023
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin:Home</title>
    <%@include file="allCss.jsp" %>

    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color:black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
<c:redirect url="/login.jsp"/>

</c:if>


<div class="container">
    <div class="row p-5">

        <div class="col-md-3">
            <a href="add_books.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-plus-square fa-3x text-primary"></i> <br>
                    <h4>Yeni Kitap Ekle</h4>
                    -----------------------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="all_books.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-book-open fa-3x text-danger"></i> <br>
                    <h4>Tüm Kitaplar</h4>
                    -----------------------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="orders.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-box-open fa-3x text-warning"></i> <br>
                    <h4>Siparişler</h4>
                    -----------------------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
            <a data-bs-toggle="modal" data-bs-target="#exampleModal">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-sign-out-alt fa-3x text-primary"></i> <br>
                    <h4>Çıkış Yap</h4>
                    -----------------------
                </div>
            </div>
            </a>
        </div>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Çıkış Yap</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="text-center">
                    <h4>Çıkış Yapmak İstiyor Musunuz?</h4>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
                    <a href="../logout" type="button" class="btn btn-primary">Çıkış Yap</a>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>




<!--Logout-->


<div><%@include file="Footer.jsp"%></div>
</body>
</html>
