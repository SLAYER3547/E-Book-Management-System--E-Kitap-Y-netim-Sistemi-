<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 10.12.2023
  Time: 00:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Book Details</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>

<%
int id=Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
BookDtls b = dao.getBookById(id);
%>

<div class="container p-3">
    <div class="row ">
        <div class="col-md-6 text-center p-5 border bg-white">

            <img src="Books/<%=b.getPhotoName()%>" style="height: 150px;width: 150px">
            <h4 class="mt-3">Kitap Adı: <span class="text-success"><%=b.getBookname()%></span></h4>
            <h4>Yazar Adı: <span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Kategori:
                <%if("Old".equals(b.getBookCategory())) {%>
                <span class="text-success">İkinci El</span>
            <%}else{%>
                <span class="text-success">Sıfır Kitap</span>
            <%}%>
            </h4>
        </div>
        <div class="col-md-6 text-center p-5 border bg-white">

            <h2 class="text-success"><%=b.getBookname()%></h2>

            <%
            if("Old".equals(b.getBookCategory())) {%>
                <h5 class="text-primary">Satıcıyla İletişime Geç</h5>
                <h5 class="text-primary"><i class="fa-solid fa-envelope">

                </i> E-Mail: <%=b.getEmail()%></h5>

            <%}
            %>


            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-money-bill-wave fa-2x"></i>
                    <p>Kapıda Ödeme</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p>İade İmkanı</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <p>Bedava Kargo</p>
                </div>

            </div>
            <%if("Old".equals(b.getBookCategory())) {%>
            <div class="text-center p-3">
                <a class="btn btn-sm btn-success text-center" href="index.jsp"><i class="fa-solid fa-cart-plus"></i>
                    Alışverişe Devam Et
                </a>
                <a class="btn btn-sm btn-danger text-center" href="#"><%=b.getPrice()%><i class="fa-solid fa-turkish-lira-sign"></i></a>
            </div>
            <%}else{%>
            <div class="text-center p-3">
                <a class="btn btn-sm btn-primary text-center" href="#"><i class="fa-solid fa-cart-plus"></i> Sepete Ekle</a>
                <a class="btn btn-sm btn-danger text-center" href="#"><%=b.getPrice()%><i class="fa-solid fa-turkish-lira-sign"></i></a>
            </div>

            <%}%>

        </div>
    </div>
</div>

<%@include file="all_component/Footer.jsp" %>

</body>
</html>
