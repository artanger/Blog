<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="posts-header navbar navbar sticky-top navbar-toggleable-md navbar-inverse bg-inverse">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">The Blog</a>

    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/posts" class="nav-link">Admin Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#">About</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/posts?action=addpost" class="nav-link">Add Post</a></li>
        </ul>
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
            <a class="nav-link" href="${pageContext.request.contextPath}/currentprofile">Welcome <%=request.getAttribute("shortname")%></a>
        </form>
    </div>
</nav>