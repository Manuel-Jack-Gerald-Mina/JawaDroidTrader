<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>

    <link rel ="stylesheet" href="../../CSS/style.css" >
    <link href="../../asset/jawa_facial.png" rel="icon" type="image/x-icon" />
</head>
<body id="adPage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <div class="row" >

        <c:forEach var="ad" items="${ads}">

            <div class="col-3 m-2">
            <div class=" card   align-content-center" id ="card2"  style="width: 18rem; ">

            <img class=" card-img-top" src="../../asset/droid.jpeg" alt="Card image cap">
            <div class="card-body align-content-center">
            <h4 class="card-title  ">${ad.title}</h4><br>

            <h5><a href="adlisterProfile?user=${ad.userId}" >Trader: ${usersDao.findByUserId(ad.userId).getUsername()}</a></h5>

              <%--<c:param name="userid" value="${ad.userId}" />--%>
                    <%--<h5 class="card-title">${param.userbyid}</h5>--%>


            <p class="card-text ">Galactic Credits ${ad.price}</p>
            <a href="/adsInfo?adId=${ad.id}" class="btn btn-dark text-warning rounded"> View this Listing</a>
             <c:if test="${sessionScope.user.id == ad.userId}">
                 <form method="post">
                     <input type="hidden" name="delete" value="${ad.id}">
                     <input class="btn btn-danger btn-sm" type="submit" value="Delete">
                 </form>

                 <form action="/ads/edit" method="get">
                     <input type="hidden" name="EditAdId" value="${ad.id}">
                     <input class="btn btn-warning btn-sm" type="submit" value="Edit">
<%--                     <a href="/ads/edit">edit</a>--%>
                 </form>
<%--                 <form>--%>
<%--                 <button  name="edit">Edit</button>--%>
<%--                 </form>--%>
             </c:if>
            </div>
            </div>
            </div>




        </c:forEach>
    </div>


</div>
</body>
</html>
