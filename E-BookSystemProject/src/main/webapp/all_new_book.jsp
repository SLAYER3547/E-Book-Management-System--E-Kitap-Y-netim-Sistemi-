<%@ page import="com.example.ebooksystemproject.DAO.BookDAOImpl" %>
<%@ page import="com.example.ebooksystemproject.DB.DBconnect" %>
<%@ page import="com.example.ebooksystemproject.entity.BookDtls" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ebooksystemproject.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 8.12.2023
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>All New Books </title>
    <%@include file="all_component/allCss.jsp"%>

    <style type="text/css">

        .crd-ho:hover{
            background-color: #fcf7f7;

        }
        #snackbar {
            visibility: hidden; /* Hidden by default. Visible on click */
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #333; /* Black background color */
            color: #fff; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 50%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

        #snackbar.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @-webkit-keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }

        @keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }
    </style>
</head>
<body>

<c:if test="${not empty addCart}">
    <div id="snackbar">${addCart}</div>
    <script type="text/javascript">
        myFunction();
        function myFunction() {
            var x = document.getElementById("snackbar");
            x.className = "show";
            setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
        }

    </script>
    <c:remove var="addCart" scope="session"/>
</c:if>
<%
    User u=(User)session.getAttribute("userobj");

%>
<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">
    <div class="row p-3">
        <%
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
            List<BookDtls> list =dao.getAllNewBook();
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


</div>


<%@include file="all_component/Footer.jsp" %>
</body>
</html>
