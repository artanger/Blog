<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/admin-side.css">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
<% Profile profileModel = (Profile)request.getAttribute("ProfileModel");%>
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% String allCommentsCount = (String)request.getAttribute("allCommentsCount");%>
<jsp:include page="AdminPostHeader.jsp" />
<div class="container dashboard">
    <div class="row">
        <div class="col">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">Dashboard</h1>
                    <div class="row">
                        <div class="col-4">

                                <div class="bg-success text-white m-2 w-100 rounded">
                                    <div class="row">
                                    <div class="col-5 mt-3 text-center"><h1><i class="fas fa-clipboard-list"></i></h1></div>
                                    <div class="col-7">
                                        <div class="row">
                                            <div class="col-12"><h1 class="m-0"><%=categories.size()%></h1></div>
                                            <div class="col-12">Categories</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">

                                <div class="bg-warning text-white m-2 w-100 rounded">
                                    <div class="row">
                                    <div class="col-5 mt-3 text-center"><h1><i class="far fa-sticky-note"></i></h1></div>
                                    <div class="col-7">
                                        <div class="row">
                                            <div class="col-12"><h1 class="m-0"><%=posts.size()%></h1></div>
                                            <div class="col-12">Posts</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">

                                <div class="bg-primary text-white m-2 w-100 rounded">
                                    <div class="row">
                                    <div class="col-5 mt-3 text-center"><h1><i class="far fa-comments"></i></h1></div>
                                    <div class="col-7">
                                        <div class="row">
                                            <div class="col-12"><h1 class="m-0"><%=allCommentsCount%></h1></div>
                                            <div class="col-12">Comments</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-4">
            <div class="jumbotron pt-4 pb-2">
                <% String imgsrc = !StringUtils.isNullOrWhitespace(profileModel.getImageSrc())?"img/"+profileModel.getImageSrc(): "//via.placeholder.com/70x70";%>
                <div class="card text-white bg-primary mb-3 text-center  border-0 shcard">
                    <div class="card-header bg-light  border-bottom border-primary ">
                        <img src="<%=imgsrc%>" alt=""  class="img-fluid rounded-circle avatar">
                    </div>
                    <div class="card-bo dy m-3">
                        <h5 class="card-title"><%=profileModel.getFirstName()%> <%=profileModel.getLastName()%></h5>
                        <p class="card-text"><%=profileModel.getHighlight()%></p>
                    </div>
                    <a  href="/currentprofile" class="mybtn">Go to the profile</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="jumbotron pt-4 pb-2">
                <h2>Categories</h2>
                <table class="table table-hover">
                    <thead class="bg-inverse text-white">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Posts</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Category cat:categories){%>
                    <tr>
                        <td><%=cat.getName()%></td>
                        <td><%=cat.getDescription()%></td>
                        <td><span class="badge badge-primary badge-pill"><%=cat.getPostsCount()%></span></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <p class="lead">
                    <a class="btn btn-primary" href="/categories" role="button">Go to Categories</a>
                </p>
            </div>
        </div>

        <div class="col-12">
            <div class="jumbotron pt-4 pb-2">
                <h2>Posts</h2>
                <table class="table table-hover">
                    <thead class="bg-inverse text-white">
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Date</th>
                        <th scope="col">Category</th>
                        <th scope="col">Comments</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Post p:posts){%>
                    <tr >
                        <td><%=p.getTitle()%></td>
                        <td><%=p.getTimeFormatted()%></td>
                        <td><%=p.getCategoryName()%></td>
                        <td><span class="badge badge-primary badge-pill"><%=p.getCommentsCount()%></span></td>
                        </tr>
                    <%}%>
                    </tbody>
                </table>
                <p class="lead">
                    <a class="btn btn-primary" href="/posts" role="button">Go to Posts</a>
                </p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="AdminFooter.jsp" />
</body>
</html>