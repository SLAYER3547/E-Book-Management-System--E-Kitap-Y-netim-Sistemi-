<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ebook:Login</title>
    <%@include file="all_component/allCss.jsp" %>


</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_component/navbar.jsp"%>

<div class="container mt-5 p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="text-center">Giriş Sayfası</h5>

                    <c:if test="${not empty failedMsg}">
                        <h5 class="text-center text-danger">${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty succMsg}">
                        <h5 class="text-center text-success">${succMsg}</h5>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>



                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                   required="required"
                                   name="email"
                            >
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Şifre:</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   required="required"
                                   name="password"
                            >
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Giriş Yap</button> <br>
                            <a href="register.jsp" style="text-decoration: none">Hesap Oluştur</a>
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