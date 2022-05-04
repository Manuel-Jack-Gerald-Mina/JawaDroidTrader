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
                <input type="text" class="search_input" name="search" placeholder="search" id="Search_box" rows="1"></input>
<%--                <input type="text" class="search_input" placeholder="Search">--%>
                <button type="submit" class="btn btn-outline-warning">Search</button>
            </div>

        </form>
<c:choose>
        <c:when test="${sessionScope.user != null}">
        <ul class="nav navbar-nav navbar-right">
            <li> <a href="<c:url value="http://localhost:8080/profile"/>"><c:out value="${sessionScope.user.username}" /></a></li>
            <li> <a href="<c:url value="http://localhost:8080/logout"/>">Logout</a></li>
        </ul>
        </c:when>
<c:otherwise>
        <ul class="nav navbar-nav navbar-right">
            <li> <a href="<c:url value="http://localhost:8080/login"/>">Login</a></li>
            <li> <a href="<c:url value="http://localhost:8080/register"/>">Sign up</a></li>
        </ul>
</c:otherwise>
    </c:choose>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
