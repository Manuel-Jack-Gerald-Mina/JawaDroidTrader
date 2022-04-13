<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel ="stylesheet" href="../../CSS/style.css" >
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link href="../../asset/jawa_facial.png" rel="icon" type="image/x-icon" />
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

 
        <c:forEach var="ad" items="${ads}">

            <div class="row" >
            <div class="col-md">
            <div class=" card   align-content-center" id ="card2"  style="width: 18rem; ">

            <img class=" card-img-top" src="../../asset/droid.jpeg" alt="Card image cap">
            <div class="card-body align-content-center">
            <h4 class="card-title  ">${ad.title}</h4><br>
                <c:param name="userid" value="${ad.userid}"/>
                <h5>user: ${param.user_name}</h5>
<%--<c:param name="userid" value="${ad.userId}" />--%>
                    <%--<h5 class="card-title">${param.userbyid}</h5>--%>


            <p class="card-text ">${ad.description}</p>
            <a href="#" class="btn btn-dark text-warning rounded"> View this droid</a>
            </div>
            </div>
            </div>
            </div>



        </c:forEach>
                



</body>
</html>
