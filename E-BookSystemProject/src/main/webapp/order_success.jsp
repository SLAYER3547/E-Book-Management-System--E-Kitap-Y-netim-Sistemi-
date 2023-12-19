<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 13.12.2023
  Time: 09:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>You successfuly Ordered</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<div class="container text-center mt-3">
    <i class="fas fa-check-circle fa-5x text-success"></i>
    <h1>Bizi tercih ettiğiniz için teşekkürler</h1>
    <h2>Siparişiniz başarıyla alındı</h2>
    <h5>7 gün içerisinde siparişiniz adresinize teslim edilecektir</h5>
    <a href="index.jsp" class="btn btn-primary mt-3">Ana Sayfa</a>
    <a href="user_orders.jsp" class="btn btn-danger mt-3">Siparişi Görüntüle</a>

</div>

<%@include file="all_component/Footer.jsp" %>

</body>
</html>
