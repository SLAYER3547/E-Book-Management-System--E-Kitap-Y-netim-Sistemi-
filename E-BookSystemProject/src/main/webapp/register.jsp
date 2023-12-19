<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 5.12.2023
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>E-book:Register</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp" %>

<div class="container  mt-5 p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4" >
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Kayıt Sayfasi</h4>

                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>

                    </c:if>

                    <c:if test="${not empty failedMsg2}">
                        <p class="text-center text-danger">${failedMsg2}</p>
                        <c:remove var="failedMsg2" scope="session"/>

                    </c:if>

                    <form action="register" method="post">

                        <div class="form-group">
                            <label for="fullname" class="form-label">AD SOYAD:</label>
                            <input type="text" class="form-control" id="fullname" required="required" name="fname">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                   required="required" name="email">
                        </div>

                        <div class="form-group">
                            <label for="phonenumber" class="form-label">Telefon Numarası:</label>
                            <input type="number" class="form-control" id="phonenumber" required="required" name="phno">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1" class="form-label">Şifre</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                        </div>
                        <div class="form-group form-check">
                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Kabul et</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Gönder</button>
                    </form>
                </div>

            </div>

        </div>
    </div>

</div>
<%@include file="all_component/Footer.jsp" %>
</body>
</html>
