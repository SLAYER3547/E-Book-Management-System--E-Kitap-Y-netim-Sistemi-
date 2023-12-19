<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 8.12.2023
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>All Old Books</title>
    <%@include file="all_component/allCss.jsp"%>
    <style type="text/css">

        .crd-ho:hover{
            background-color: #fcf7f7;

        }
    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">
    <div class="row p-3">
        <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list =dao.getAllOldBook();
            for(BookDtls b:list)
            {%>
        <div class="col-md-3">

            <div class="card crd-ho mt-2">
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
                    Kategori:Yeni</p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="#" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>
                            Sepete Ekle</a>
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


</div>

<%@include file="all_component/Footer.jsp" %>
</body>
</html>
