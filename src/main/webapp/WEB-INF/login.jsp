<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
<%--    bootstrap --%>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel ="stylesheet" href="../CSS/style.css" >
    <link href="../asset/jawa_facial.png" rel="icon" type="image/x-icon" />

<%--<<<<<<< HEAD--%>
<%--=======--%>
    <%--font google--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Codystar&family=Indie+Flower&family=Orbitron:wght@500&family=Rajdhani&display=swap" rel="stylesheet">

<%-->>>>>>> cddc8e79f130828b316ad077206bc694da8354b7--%>

</head>
<body id="logIn">
    <jsp:include page="/WEB-INF/partials/navbar2.jsp" />
<%--    <jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
    <div class="container">
        <h1 style="font-family: 'Orbitron', sans-serif">Please Log In</h1>

            <c:if test="${failed == '1'}">
<%--<<<<<<< HEAD--%>
                <div> <p>incorrect username or password</p></div>
<%--=======--%>
        <div style="font-family:'Codystar',cursive; color: red;font-size: 25px"> Incorrect username or password. Please try again.</div>
<%-->>>>>>> cddc8e79f130828b316ad077206bc694da8354b7--%>
            </c:if>
        <form id= "loginForm" action="login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>

            <input type="submit" class="btn btn-warning btn-block" value="Log In">

        </form>
    </div>
<%--    bootstrap--%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>
