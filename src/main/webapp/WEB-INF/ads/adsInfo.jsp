<%--
  Created by IntelliJ IDEA.
  User: ranchayasambath
  Date: 4/11/22
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    css --%>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing ${selectedAd.title}'s Details"/>
    </jsp:include>
    <link rel="stylesheet" href="../../CSS/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row">
        <div id="card-id" class="card justify-content-center align-items-center">
            <div class="card-img-top">
                <img src="../../asset/droid.jpeg" class="  rounded mx-auto d-block" width="75%" height="auto">
            </div>
            <ul>
                <li><h5> Galactic Credits ${selectedAd.price}</h5></li>
                <li> <p id="ad_user"><a href="adlisterProfile?user=${Users.findByUserId(user_Id).getUsername()}">${Users.findByUserId(user_Id).getUsername()}</a></p></li>
                <li> <p class="card-text">Description : ${selectedAd.description}</p></li>
            </ul>
        </div>

    </div>
</div>



</body>
</html>
