<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 6.12.2023
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin: Add Books</title>
    <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
    <c:redirect url="/login.jsp"/>

</c:if>

<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
             <div class="card">
                 <div class="card-body">
                     <h4 class="text-center">Kitap Ekleme Formu</h4>

                     <c:if test="${not empty succMsg}">
                         <p class="text-center text-success">${succMsg}</p>
                         <c:remove var="succMsg" scope="session"></c:remove>
                     </c:if>

                     <c:if test="${not empty failedMsg}">
                         <p class="text-center text-danger">${failedMsg}</p>
                         <c:remove var="failedMsg" scope="session"></c:remove>
                     </c:if>

                     <form action="../add_books" method="post" enctype="multipart/form-data">

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
                             <label for="inputState">Kategori:</label>
                             <select name="categories"  class="form-control"
                                    id="inputState" >
                                 <option selected>--select---</option>
                                 <option value="New">New Book</option>
                             </select>
                         </div>

                         <div class="form-group">
                             <label for="inputState">Durum:</label>
                             <select name="status"  class="form-control"
                                     id="inputState" >
                                 <option selected>--select---</option>
                                 <option value="Active">Aktif</option>
                                 <option value="Inactive">İnaktif</option>
                             </select>
                         </div>

                         <div class="form-group">
                             <label for="exampleFormControlFile1">Fotoğraf Yükle</label>
                             <input name="bimg" id="exampleFormControlFile1" type="file"
                                    class="form-control-file">
                         </div>

                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Ekle</button>
                     </form>
                 </div>
             </div>
        </div>

    </div>

</div>
<div><%@include file="Footer.jsp"%></div>
</body>
</html>
