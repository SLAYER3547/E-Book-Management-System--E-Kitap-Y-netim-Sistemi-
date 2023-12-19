<%@ page pageEncoding="UTF-8" %>
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

        <div class="col-md-3">
            <c:if test="${not empty userobj}">
                <a class="btn btn-success"><i class="fas fa-user"></i>
                    ${userobj.name}</a>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal"
                   class="btn btn-primary text-white"><i class="fas fa-sign-in-alt"></i>
                    Çıkış Yap</a>
            </c:if>
            <c:if test="${empty userobj}">

                <a href="login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>
                        Giriş Yap</a>
                <a href="register.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i>
                    Kayıt Ol</a>
            </c:if>

        </div>
    </div>
</div>

<!--Logout-->

<!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Çıkış Yap</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="text-center">
                        <h4>Çıkış Yapmak İstiyor Musunuz?</h4>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
                        <a href="../logout" type="button" class="btn btn-primary">Çıkış Yap</a>
                    </div>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>




<!--Logout-->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i>  <span class="sr-only">(current)</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="home.jsp">Ana Sayfa
                        <span class="sr-only">(current)</span> </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" >

            </form>
        </div>
    </div>
</nav>



</body>

</html>

