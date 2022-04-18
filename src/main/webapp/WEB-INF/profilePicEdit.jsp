<%--
  Created by IntelliJ IDEA.
  User: manuel.dominguez
  Date: 4/17/22
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Jawa Ad Lister" />
    </jsp:include>
    <link rel="icon" type="image/png" href="../asset/jawa.png">
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar2.jsp" />


<div class="container-large m-auto text-center row">
        <h1 class="col-11">Choose a picture</h1>
    <div class="w-100"></div>
    <form class="form-group" method="post">
        <input type="hidden" name="userId" value="${sessionScope.user.id}"/>
    <c:forEach var="pic" items="${pictures}">
        <div class="col-3 form-check form-check-inline"><button class="img" type="submit" name="picId" value="${pic.getId()}"><img src="../asset/${pic.getUrl()}" alt="${pic.getUrl()}"  height="175" width="175"></button></div>
    </c:forEach>
    </form>
</div>

<script src="../js/script.js"></script>
</body>
</html>

<%----%>
