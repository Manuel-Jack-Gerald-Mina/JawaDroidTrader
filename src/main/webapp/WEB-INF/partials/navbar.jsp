<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <img src="../../asset/jawa_facial.png" width="50px" height="50px" alt="Jawa.jpg">
            <a class="navbar-brand" href="../../index.jsp">Jawa Droids Trading co.</a>
        </div>

        <form action="" method="post">
            <div class="form-group">
                <label for="search">Search by</label>
                <select class="form-control" id="search">
                    <option>Ad Id</option>
                    <option>Title</option>
                    <option>User</option>
                    <option>Categories</option>
                </select>
                <div class="form-group">
                    <label for="Searchbox"></label>
                    <textarea class="form-control mr-sm-2" placeholder="search" id="Searchbox" rows="3"></textarea>
                </div>
            <%--<label for="Search"></label>
            <select id="Search" name="search">
                <option value="Ad Id">Ad Id</option>
                <option value="Title">Title</option>
                <option value="User">User</option>
                <option value="Categories">Categories</option>
            </select>--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
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
            <li> <a href="profile"><c:out value="${sessionScope.user.username}" /></a></li>
            <li> <a href="logout">Logout</a></li>
        </ul>
        </c:when>
<c:otherwise>
        <ul class="nav navbar-nav navbar-right">
            <li> <a href="login">Login</a></li>
            <li> <a href="register">Sign up</a></li>
        </ul>
</c:otherwise>
    </c:choose>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
