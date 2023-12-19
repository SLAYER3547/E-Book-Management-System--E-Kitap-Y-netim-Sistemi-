<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %><%--
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

<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Kitap Düzenleme Formu</h4>



                    <%
                    int id=Integer.parseInt( request.getParameter("id"));
                    BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
                    BookDtls b =dao.getBookById(id);

                    %>

                    <form action="../editbooks" method="post">

                        <input type="hidden" name="id" value="<%=b.getBookId()%>">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Kitap Adı(*):</label>
                            <input name="bname" type="text" class="form-control"
                                   id="exampleInputEmail1" aria-describedby="emailHelp"
                            value="<%=b.getBookname()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Yazar Adı(*):</label>
                            <input name="author" type="text" class="form-control"
                                   id="exampleInputEmail1" aria-describedby="emailHelp"
                                   value="<%=b.getAuthor()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Fiyat(*):</label>
                            <input name="price" type="number" class="form-control"
                                   id="exampleInputPassword1" value="<%=b.getPrice()%>">
                        </div>



                        <div class="form-group">
                            <label for="inputState">Durum:</label>
                            <select name="status"  class="form-control"
                                    id="inputState" >

                                <%if("Active".equals(b.getStatus())){%>

                                <option value="Active">Aktif</option>
                                <option value="Inactive">İnaktif</option>
                                <%}else{%>
                                <option value="Inactive">İnaktif</option>
                                <option value="Active">Aktif</option>
                                <%}%>


                            </select>
                        </div>


                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Güncelle</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>
<div><%@include file="Footer.jsp"%></div>
</body>
</html>
