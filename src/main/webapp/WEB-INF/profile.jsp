
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link href="../asset/jawa_facial.png" rel="icon" type="image/x-icon" />
    <%--    bootstrap --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<%--    CSS--%>
    <link rel="stylesheet" href="../CSS/style.css">

</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container float-left mt-5" >
        <h1 id = "welcome_id" >Welcome, ${sessionScope.user.username}!</h1>
    </div>


<%--    profile card --%>
<div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row position-absolute ">
        <div class="card profile-card  justify-content-center align-items-center">
            <img src="../asset/${pic.findByUserId(sessionScope.user.id).getUrl()}" width="350" height="600" class="card-img-top" alt="...">
            <div class="card-body justify-content-center align-items-center">
                <h5 id ="currentUSer" class="card-title">${sessionScope.user.username}</h5>
                <p class="card-text">Hi ! I'm <span>${sessionScope.user.username}</span>, and from <span id="origin"></span> , SandCrawler-Mos Eisley, Tatooine.</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">${sessionScope.user.email}</li>
                <li class="list-group-item text-center"><a href="/changePassword" class="card-link">change password</a></li>
                <li class="list-group-item text-center"><a href="/profile/editpic" class="card-link">edit profile picture</a></li>
            </ul>
            <div class="card-body">
                <a href="ads/create" class="card-link">Create Ad</a>
                <a href="/ads" class="card-link">Go to Ads Page</a>
            </div>
        </div>
    </div>
</div>

    <script src="../js/script.js"></script>

</body>
</html>
