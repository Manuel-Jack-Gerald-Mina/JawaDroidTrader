<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <img src="../../asset/jawa_facial.png" width="50px" height="50px" alt="Jawa.jpg">
            <a class="navbar-brand" href="../../index.jsp">Jawa Droids Trading co.</a>
        </div>

        <form action="<c:url value="http://localhost:8080/ads"/>" method="get">
            <div class="searchbar justify-content-center align-items-center">
                <select class="search_input" name="searchType" id="search">
                    <option value="AdTitle"  class="search_input">Title</option>
                    <option value="Username" class="search_input">User</option>
                    <option value="Category" class="search_input">Categories</option>
                </select>
                <input type="text" class="search_input" placeholder="Search">
                <button type="submit" class="btn btn-outline-warning">Search</button>
            </div>

        </form>

        <%--<form class="form-inline ">
            <div class="dropdown ">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                    Search by...
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li class="dropdown-item" value="searchById">Search By ID</li>
                    <li class="dropdown-item" value="searchByTitle">Search By Title</li>
                </div>
            </div>
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>--%>
<c:choose>
        <c:when test="${sessionScope.user != null}">
        <ul class="nav navbar-nav navbar-right">
            <li> <a href="<c:url value="http://localhost:8080/profile"/>"><c:out value="${sessionScope.user.username}" /></a></li>
            <li> <a href="<c:url value="http://localhost:8080/logout"/>">Logout</a></li>
        </ul>
        </c:when>
<c:otherwise>
        <ul class="nav navbar-nav navbar-right">
<%--            <li> <a href="<c:url value="http://localhost:8080/login"/>">Login</a></li>--%>
            <li> <a href="<c:url value="http://localhost:8080/register"/>">Sign up</a></li>
        </ul>
</c:otherwise>
    </c:choose>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
