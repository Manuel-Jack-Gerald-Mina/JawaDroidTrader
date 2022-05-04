<%--
  Created by IntelliJ IDEA.
  User: ranchayasambath
  Date: 4/12/22
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Password Change!" />
    </jsp:include>
    <link href="asset/jawa.png" rel="icon" type="image/x-icon" />
    <%--    bootstrap --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<%--<<<<<<< HEAD--%>
    <link rel="stylesheet" href="../CSS/style.css">

<%--=======--%>
    <%--font google--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Codystar&family=Indie+Flower&family=Orbitron:wght@500&family=Rajdhani&display=swap" rel="stylesheet">
<%-->>>>>>> cddc8e79f130828b316ad077206bc694da8354b7--%>
</head>
<body>
<jsp:include page="partials/navbar2.jsp" />
<div class="container">

    <h2>Enter your new password.</h2>

    <form action="/changePassword" method="post">
        <c:choose>
            <c:when test="${failed == '1'}">
                <div>New password cannot match old password.</div>
            </c:when>
            <c:when test="${failed == '2'}">
               <div>Confirm Password does not match.</div>
            </c:when>
            <c:when test="${failed == '3'}">
                <div>Current Password field is blank.</div>
            </c:when>
            <c:when test="${failed == '4'}">
                <div>New Password field is blank.</div>
            </c:when>
            <c:when test="${failed == '5'}">
                <div>Cant use old password.</div>
            </c:when>
            <c:when test="${failed == '6'}">
                <div>Username is empty.</div>
            </c:when>
        </c:choose>

        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input id="currentPassword" name="currentPassword" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input id="newPassword" name="newPassword" class="form-control" type="newPassword">
        </div>
        <div class="form-group">
            <label for="confirmNewPassword">Confirm Password</label>
            <input id="confirmNewPassword" name="confirmNewPassword" class="form-control" type="confirmNewPassword">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>
