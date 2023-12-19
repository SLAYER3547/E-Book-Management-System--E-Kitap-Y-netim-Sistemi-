<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
<div class="container-fluid" style="height: 10px; background-color: #303f9f">

</div>



<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3><i class="fa-solid fa-book"></i> Elektronik Kitaplar</h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex" role="search" action="search.jsp" method="post">
                <input class="form-control me-2" type="search"
                       placeholder="Ara" aria-label="Search" name="ch">
                <button class="btn btn-primary" type="submit">Ara</button>
            </form>
        </div>
        <c:if test="${not empty userobj}">
            <div class="col-md-3">
                <a href="checkout.jsp" class="btn btn-primary"><i class="fas fa-cart-plus "></i></a>
                <a  class="btn btn-success"><i class="fas fa-user-plus"></i>
                   ${userobj.name}
                </a>
                <a href="logout" class="btn btn-primary text-white"><i class="fas fa-sign-in-alt"></i>
                    Çıkış Yap</a>
            </div>

        </c:if>

        <c:if test="${empty userobj}">

            <div class="col-md-3">
                <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i>
                    Giriş Yap</a>
                <a href="register.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i>
                    Kayıt Ol</a>
            </div>
        </c:if>


    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i> Ana Sayfa <span class="sr-only">(current)</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
                        Aktif Kitaplar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
                        Sıfır Kitaplar</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="all_old_book.jsp" ><i class="fa-solid fa-book-open"></i>
                        İkinci El Kitaplar</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" >
                <a href="settings.jsp" class="btn btn-light my-2 my-sm-0 " type="submit"><i class="fa-solid fa-gears"></i> Ayarlar</a>
                <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-phone-volume"></i> Bizimle İletişime Geç</a>
            </form>
        </div>
    </div>
</nav>

</body>

</html>

