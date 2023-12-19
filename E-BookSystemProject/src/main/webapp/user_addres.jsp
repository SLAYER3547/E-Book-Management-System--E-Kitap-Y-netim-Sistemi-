<%--
  Created by IntelliJ IDEA.
  User: fatihPC
  Date: 11.12.2023
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>User Address</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-warning">Adres Ekle</h3>
                    <form action="" method="post">
                        <div class="row">
                            <div class="col">
                                <label for="Adress">Teslimat Adresi:</label>
                                <input type="text" class="form-control" id="Adress" value="">
                            </div>
                            <div class="col">
                                <label for="Landmark">Referans Noktası</label>
                                <input type="text" class="form-control" id="Landmark" value="">
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <label for="City">Şehir</label>
                                <input type="text" class="form-control" id="City" value="">
                            </div>
                            <div class="col">
                                <label for="State">İlçe</label>
                                <input type="text" class="form-control" id="State" value="">
                            </div>
                            <div class="col">
                                <label for="ZipCode">Posta Kodu</label>
                                <input type="text" class="form-control" id="ZipCode" value="">
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <a href="" class="btn btn-warning text-white">Adres Ekle</a>
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
