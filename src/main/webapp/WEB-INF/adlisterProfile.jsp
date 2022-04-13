<%--
  Created by IntelliJ IDEA.
  User: mina.mcgonigal
  Date: 4/12/22
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../asset/jawa_facial.png" rel="icon" type="image/x-icon" />
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>

    <%--    bootstrap --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <%--    CSS--%>
    <link rel="stylesheet" href="../CSS/style.css">

    <title>viewer-profile</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row position-absolute ">
        <div class="card profile-card  justify-content-center align-items-center">
            <img src="../asset/jawa.png" class="card-img-top" alt="...">
            <div class="card-body justify-content-center align-items-center">
                <h5 class="card-title">${param.profileId}</h5>
                <p class="card-text">Hi ! I'm ${param.profileId}, and from <span id="origin"></span> , SandCrawler-Mos Eisley, Tatooine.</p>
            </div>
            <div class="card-body justify-content-center align-items-center" id="userADList">
                <h5 class="card-title">My Ads.</h5>
                <ul class="listOfAd">
                <c:forEach var="ad" items="${ads}">
                    <li></li>
                </c:forEach>
                </ul>
            </div>

            <div class="card-body">
                <a href="ads/create.jsp" class="card-link">Create Ad</a>
                <a href="ads/index.jsp" class="card-link">Go to Ads Page</a>
            </div>
        </div>
    </div>
</div>




<script src="../js/script.js"></script>
</body>
</html>
