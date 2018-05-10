<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="posts-header navbar navbar sticky-top navbar-toggleable-md navbar-inverse bg-inverse">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
<!--<img src="img/blog.jpg">-->
        <i class="fab fa-blogger"></i><span>The Blog</span></a>

    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/posts" class="nav-link">Admin Home</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkPosts" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Posts</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkPosts">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/posts">Posts List</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/posts?action=addpost">Add Post</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkCategories" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkCategories">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/categories" >Categories List</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/categories?action=addcategory">Add Category</a>
                </div>
            </li>
        </ul>
        <form class="form-inline mb-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
            <a class="nav-link" href="${pageContext.request.contextPath}/currentprofile">Welcome <%=request.getAttribute("shortname")%></a>
        </form>
    </div>
</nav>