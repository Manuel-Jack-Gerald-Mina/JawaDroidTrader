<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Jawa Ad Lister" />
    </jsp:include>
    <link rel="icon" type="image/png" href="asset/jawa.png">
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container-large m-auto text-center">
        <h1>Jawa Droids Trading</h1>
    </div>
<div class="container-large mt-5 text-center">
    <a href="login">Login</a><br>
    <a href="register">Sign up</a><br>
    <a href="ads">Trading Ads</a><br>
    <a href="ads/create"> Create a Trade Offer</a><br>
    <a href="profile">View Profile</a>
</div>

</body>
</html>
