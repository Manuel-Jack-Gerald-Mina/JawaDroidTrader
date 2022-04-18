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
    <jsp:include page="/WEB-INF/partials/navbar2.jsp" />
    <div class="container-large m-auto text-center">
        <h1>Jawa Droids Trading</h1>
    </div>
<div class="container-large mt-5 text-center">
    <c:choose>
        <c:when test="${sessionScope.user != null}">

<%--                <a href="profile"><c:out value="${sessionScope.user.username}" /></a><br>--%>
<%--                <a href="logout">Logout</a><br>--%>

        </c:when>
        <c:otherwise>

                <a href="login">Login</a><br>
<%--                <a href="register">Sign up</a><br>--%>

        </c:otherwise>
    </c:choose>

    <a href="ads">Trading Ads</a><br>
    <a href="ads/create"> Create a Trade Offer</a><br>
    <a href="profile">View Profile</a>

</body>
</html>
