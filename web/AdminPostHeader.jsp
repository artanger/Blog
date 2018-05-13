<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="posts-header navbar navbar sticky-top navbar-toggleable-md navbar-inverse bg-inverse fixed">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><i class="fab fa-blogger"></i><span>The Blog</span></a>
    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/adminpage" class="nav-link"><i class="fas fa-home mr-1"></i>Admin Home</a></li>
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
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/categories">Categories List</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/categories?action=addcategory">Add Category</a>
                </div>
            </li>

        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Current User">
                    <i class="fas fa-user-circle mr-1"></i><%=request.getAttribute("shortname")%>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkProfile">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/currentprofile">Edit Profile</a>
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="dropdown-item mb-0">
                        <button type="submit" value="Logout" class="btn btn-link p-0 nounderline" title="Sign out from the admin part">
                            <i class="fas fa-power-off mr-1"></i>Log Out
                        </button>
                    </form>
                </div>

            </li>
        </ul>



    </div>
</nav>