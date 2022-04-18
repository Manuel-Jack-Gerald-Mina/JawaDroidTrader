<%--
  Created by IntelliJ IDEA.
  User: ranchayasambath
  Date: 4/11/22
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    css --%>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing ${selectedAd.title}'s Details"/>
    </jsp:include>
    <%--font google--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Codystar&family=Indie+Flower&family=Orbitron:wght@500&family=Rajdhani&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../CSS/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar2.jsp"/>

<%--<div class="container min-vh-100 d-flex justify-content-center align-items-center">--%>
<%--    <div class="row">--%>
<%--        <div id="card-id" class="card justify-content-center align-items-center">--%>
<%--            <div class="card-img-top">--%>
<%--                <img src="../../asset/Adsimg/droid.jpeg" class="  rounded mx-auto d-block" width="75%" height="auto">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <ul>--%>
<%--                    <li><h5> Galactic Credits ${selectedAd.price}</h5></li>--%>
<%--                    <li><a href="adlisterProfile?user=${selectedAd.userId}">--%>
<%--                        <button class="btn-warning">View Trader</button>--%>
<%--                    </a></li>--%>
<%--                    <li><p class="card-text">Description : ${selectedAd.description}</p></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
<div class="container min-vh-100 d-flex justify-content-center align-items-center">

    <div class="row">
        <div id="card-id" class="card justify-content-center align-items-center">
          <div id="card" data-tilt data-tilt-reverse="true" data-tilt-glare data-tilt-max-glare="0.4">  
            <div class="card-img-top">
                <img src="../../asset/${pictures.findByAdId(selectedAd.id)}" alt="${pictures.findByAdId(selectedAd.id)}" data-tilt data-tilt-reverse="true" data-tilt-glare data-tilt-max-glare="0.4" class="rounded mx-auto d-block" width="75%" height="auto">
            </div>
            <div>
                <h1 class="text-center">${selectedAd.title}</h1>
                <ul>

                    <li><h5> Price in Galactic Credits:      ${selectedAd.price}</h5></li>
                    <li><a href="adlisterProfile?user=${selectedAd.userId}">
                        <button class="btn-warning">View ${user.getUsername()}'s profile</button>
                    </a></li>
                    <li><p class="card-text">Description : ${selectedAd.description}</p></li>
                </ul>
            </div>
            <c:if test="${sessionScope.user.id == selectedAd.userId}">
                <form method="post">
                    <input type="hidden" name="delete" value="${selectedAd.id}">
                    <input class="btn btn-danger btn-sm" type="submit" value="Delete">
                </form>

                <form action="/ads/edit" method="get">
                    <input type="hidden" name="EditAdId" value="${selectedAd.id}">
                    <input class="btn btn-warning btn-sm" type="submit" value="Edit">
                </form>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/vanilla-tilt.js"></script>

</body>
</html>
