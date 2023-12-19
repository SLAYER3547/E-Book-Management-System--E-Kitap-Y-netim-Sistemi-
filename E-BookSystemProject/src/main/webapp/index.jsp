<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ebook: Index</title>
    <%@include file="all_component/allCss.jsp"%>

    <style type="text/css">
        .back-img{
            background: url("Images/book_background.jpg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;

        }
        .crd-ho:hover{
            background-color: #fcf7f7;

        }
    </style>
</head>
<body style="background-color: #f7f7f7;">
<%
User u=(User)session.getAttribute("userobj");

%>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid back-img">
    <h2 class="text-center"  style="color: white">E-Kitap Yönetim Sistemi</h2>
</div>


<%@ page import="java.sql.*" %>
<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %>
<%@ page import="com.example.ebooksystemproject.entity.User" %>



<!--Son eklenen Kitaplar-->
<div class="container">
    <h3 class="text-center">Aktif Kitaplar</h3>
    <div class="row">
        <%
            BookDAOImpl dao2=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list2 =dao2.getRecentBooks();
            for(BookDtls b:list2)
            {%>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="<%=b.getBookname()%>" src="Books/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumbnail">
                    <p><%=b.getBookname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>
                        <%
                            if(b.getBookCategory().equals("Old"))
                            {%>
                        Kategori:İkinci El</p>
                              <div class="btn-group" role="group" aria-label="Basic example">


                              <a href="view_books.jsp?id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">İncele</a>
                              <a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                              </div>
                            <%}else
                            {%>
                             Kategori:Sıfır Kitap</p>
                             <div class="btn-group" role="group" aria-label="Basic example">

                                 <%if(u==null) {%>
                                 <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>
                                     Sepete Ekle
                                 </a>
                                 <%}else {%>
                                 <a href="cart?bookId=<%=b.getBookId()%>&&userId=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>
                                     Sepete Ekle
                                 </a>
                                 <%}%>
                            <a href="view_books.jsp?id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">İncele</a>
                            <a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                           </div>

                            <%}
                        %>


                </div>
            </div>

        </div>
        <%}
        %>
        </div>


        <div class="text-center mt-1">
            <a href="all_recent_book.jsp" class="btn btn-danger btn-sm">Hepsini Görüntüle</a>

        </div>

    </div>
</div>

<!--Son eklenen Kitaplar-->

<hr>

<!--Yeni Kitaplar-->

<div class="container">
    <h3 class="text-center">Sıfır Kitaplar</h3>
    <div class="row">


            <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list =dao.getNewBook();
            for(BookDtls b:list)
            {%>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="<%=b.getBookname()%>" src="Books/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumbnail">
                    <p><%=b.getBookname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Kategori:Sıfır Kitap</p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <%if(u==null) {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>
                            Sepete Ekle
                        </a>
                        <%}else {%>
                        <a href="cart?bookId=<%=b.getBookId()%>&&userId=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>
                            Sepete Ekle
                        </a>
                        <%}%>
                        <a href="view_books.jsp?id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">İncele</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                    </div>
                </div>
            </div>

        </div>
            <%}
            %>





        <div class="text-center mt-1">
            <a href="all_new_book.jsp" class="btn btn-danger btn-sm">Hepsini Görüntüle</a>

        </div>

    </div>
</div>

<!--Yeni eklenen Kitaplar-->

<hr>

<!--Eski Kitaplar-->

<div class="container">
    <h3 class="text-center">İkinci El Kitaplar</h3>
    <div class="row">
        <%
            BookDAOImpl dao3=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list3 =dao.getOldBooks();
            for(BookDtls b:list3)
            {%>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="<%=b.getBookname()%>" src="Books/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumbnail">
                    <p><%=b.getBookname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Kategori:İkinci El</p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="view_books.jsp?id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">İncele</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <%}
        %>

        <div class="text-center mt-1">
            <a href="all_old_book.jsp" class="btn btn-danger btn-sm">Hepsini Görüntüle</a>

        </div>

    </div>
</div>

<!--Eski Kitaplar-->

<%@include file="all_component/Footer.jsp" %>
</body>
</html>