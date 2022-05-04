<%--
  Created by IntelliJ IDEA.
  User: ranchayasambath
  Date: 4/14/22
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="edit page"/>
    </jsp:include>
    <%--<<<<<<< HEAD--%>
    <link rel ="stylesheet" href="../../CSS/style.css" >
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar2.jsp" />
<%--=======--%>
<%--font google--%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Codystar&family=Indie+Flower&family=Orbitron:wght@500&family=Rajdhani&display=swap" rel="stylesheet">
</head>
<body>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp"/>--%>
<%-->>>>>>> cddc8e79f130828b316ad077206bc694da8354b7--%>
<div class="container">
    <h1>Ad Editing Page</h1>
    <form action="/ads/edit" method="post">

        <c:set var="ad" value="${AdsDao.findByAdId(adId)}"/>
        <div class="form-group">

            <input type="hidden" name="userId" value="${sessionScope.user.id}">
            <input type="hidden" name="adId" value="${adId}">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="${ad.getTitle()}">
        </div>
        <div class="form-group">
            <label for="price">Price(in galactic credits)</label>
            <input type="number" id="price" name="price" class="form-control" step="0.01"
                   placeholder="${ad.getPrice()}"/>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control"
                      placeholder="${ad.getDescription()}"></textarea>
        </div>
        <div class="form-group row">
            <h3 class="col-11">chose your categories(Optional)</h3>
            <div class="w-100"></div>
            <c:forEach items="${AdsDao.AllCats()}" var="eachCat">
                <div class="col-3">
                    <input type="checkbox" name="categories" value="${eachCat.getCategory()}"> ${eachCat.getCategory()}
                </div>
            </c:forEach>
        </div>
        <div class="container-large m-auto text-center row">
            <h3 class="col-11">chose an ad picture</h3>
            <div class="w-100"></div>
            <c:forEach var="adPic" items="${adPictures}">

            <div class="col form-check form-check-inline justify-content-center"><label><img
                    src="../asset/${adPic.getUrl()}" alt="${adPic.getUrl()}" height="300" width="400"><br>
                <input type="radio" name="picId" value="${adPic.getId()}" required/>
            </label></div>
            </c:forEach>

            <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>




<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link href="../asset/jawa_facial.png" rel="icon" type="image/x-icon" />--%>
<%--    <jsp:include page="/WEB-INF/partials/head.jsp">--%>
<%--        <jsp:param name="title" value="${user_id.getUsername()}'s Profile" />--%>
<%--    </jsp:include>--%>

<%--    &lt;%&ndash;    bootstrap &ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>--%>
<%--    &lt;%&ndash;font google&ndash;%&gt;--%>
<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Codystar&family=Indie+Flower&family=Orbitron:wght@500&family=Rajdhani&display=swap" rel="stylesheet">--%>
<%--    &lt;%&ndash;    CSS&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="../CSS/style.css">--%>

<%--    <title>viewer-profile</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<<<<<<< HEAD--%>
<%--<jsp:include page="/WEB-INF/partials/navbar2.jsp" />--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<div class="container min-vh-100 d-flex justify-content-center align-items-center">--%>
<%--    <div class="row">--%>
<%--        <div class="card profile-card  justify-content-center align-items-center" id="card3">--%>
<%--            <img id = "profilePic" src="../asset/jawa.png" class="card-img-top" alt="...">--%>
<%--&lt;%&ndash;=======&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="/WEB-INF/partials/navbar.jsp" />&ndash;%&gt;--%>



<%--&lt;%&ndash;<div class="container min-vh-100 d-flex justify-content-center align-items-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="row ">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="card profile-card  justify-content-center align-items-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <img id="profilePic" src="../../asset/${pictures.findByUserId(user_id.getId()).getUrl()}" class="card-img-top" alt="${pictures.findByUserId(user_id.getId()).getUrl()}" width="350" height="600">&ndash;%&gt;--%>
<%--&lt;%&ndash;>>>>>>> cddc8e79f130828b316ad077206bc694da8354b7&ndash;%&gt;--%>
<%--            <div class="card-body justify-content-center align-items-center">--%>
<%--              --%>
<%--                <h5 class="card-title text-center">${user_id.getUsername()}</h5>--%>
<%--                <p class="card-text">Hi ! I'm ${user_id.getUsername()}, and I'm from <span id="origin"></span> , SandCrawler-Mos Eisley, Tatooine.</p>--%>

<%--            </div>--%>
<%--            <div class="card-body justify-content-center align-items-center" id="userADList">--%>
<%--                <h5 class="card-title">My Ads:</h5>--%>
<%--                <ul class="listOfAd">--%>

<%--                <c:forEach var="ad" items="${ads}">--%>
<%--                    <li><a href="/adsInfo?adId=${ad.id}">${ad.title}</a></li>--%>
<%--                </c:forEach>--%>
<%--                </ul>--%>
<%--            </div>--%>

<%--            <div class="card-body">--%>
<%--                &lt;%&ndash;<a href="ads/create" class="card-link">Create Ad</a>&ndash;%&gt;--%>
<%--                <a href="ads" class="card-link">Go to Ads Page</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>




<%--<script src="../js/script.js"></script>--%>
<%--</body>--%>
<%--</html>--%>
