<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="icon" type="image/png" href="/asset/jawa.png">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/login_navbar.jsp" />
    <div class="container">
        <h1>JAWAs Droids Trading</h1>
    </div>
</body>
</html>
