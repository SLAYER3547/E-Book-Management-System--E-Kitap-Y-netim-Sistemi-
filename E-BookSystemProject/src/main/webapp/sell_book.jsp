<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 11.12.2023
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sell Books</title>
    <%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-primary">Kitap Satma Formu</h4>

                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"></c:remove>
                    </c:if>

                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"></c:remove>
                    </c:if>

                    <form action="add_old_book" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="${userobj.email}" name="usermail">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Kitap Adı(*):</label>
                            <input name="bname" type="text" class="form-control"
                                   id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Yazar Adı(*):</label>
                            <input name="author" type="text" class="form-control"
                                   id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Fiyat(*):</label>
                            <input name="price" type="number" class="form-control"
                                   id="exampleInputPassword1">
                        </div>


                        <div class="form-group">
                            <label for="exampleFormControlFile1">Fotoğraf Yükle</label>
                            <input name="bimg" id="exampleFormControlFile1" type="file"
                                   class="form-control-file">
                        </div>

                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Sat</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>




<%@include file="all_component/Footer.jsp" %>


</body>
</html>
