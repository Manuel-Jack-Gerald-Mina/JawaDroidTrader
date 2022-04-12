<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel ="stylesheet" href="../../CSS/style.css" >
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login_navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="user" items="${users}">
        <h2>${user.username}</h2>
        <h2>${user.email}</h2>
        <c:forEach var="ad" items="${ads}">
<%--            <div class="col-md-6">--%>
<%--                <h2>${ad.title}</h2>--%>
<%--                <p>${ad.description}</p>--%>
<%--            </div>--%>
            <div class="row" >
            <div class="col-md">
            <div class=" card   align-content-center" id ="card2"  style="width: 18rem; ">

            <img class=" card-img-top" src="../../asset/droid.jpeg" alt="Card image cap">
            <div class="card-body align-content-center">
            <h5 class="card-title  ">${ad.title}</h5>
            <p class="card-text ">${ad.description}</p>
            <a href="#" class="btn btn-dark text-warning rounded"> View this droid</a>
            </div>
            </div>
            </div>




        </c:forEach>
                </c:forEach>


</div>

</body>
</html>
