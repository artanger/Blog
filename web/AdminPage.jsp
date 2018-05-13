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


<jsp:include page="AdminPostHeader.jsp" />


<div class="container">
    <div class="row">
        <div class="col">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">Dashboard</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-4">
            <div class="jumbotron">
                <% String imgsrc = !StringUtils.isNullOrWhitespace(profileModel.getImageSrc())?"img/"+profileModel.getImageSrc(): "//via.placeholder.com/70x70";%>
                <div class="card text-white bg-primary mb-3 text-center  border-0 shcard" style="width: 18rem;">
                    <div class="card-header bg-light  border-bottom border-primary ">
                        <img src="<%=imgsrc%>" alt="" style="width: 70px; height: 70px; " class="img-fluid rounded-circle avatar">
                    </div>
                    <div class="card-bo dy">
                        <h5 class="card-title"><%=profileModel.getFirstName()%> <%=profileModel.getLastName()%></h5>
                        <p class="card-text"><%=profileModel.getHighlight()%></p>
                    </div>
                    <a  href="/bloger?id=<%=profileModel.getProfileId()%>" class=" mybtn ">Go to the profile</a>

                </div>

            </div>
        </div>
        <div class="col">
            <div class="jumbotron">
                <h2>Categories</h2>
                <table class="table table-hover">
                    <thead class="bg-inverse text-white">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>

                    </tr>
                    </thead>
                    <tbody>
                    <% for(Category cat:categories){

                    %>
                    <tr>
                       <td><%=cat.getCategoryId()%></td>
                        <td><%=cat.getName()%></td>
                        <td><%=cat.getDescription()%></td>
                    </tr>
                    <%}%>

                    </tbody>
                </table>

            </div>
        </div>




        <%--<div class="col-12">--%>
            <%--<div class="jumbotron">--%>
                <%--<h2>Posts</h2>--%>
                <%--<table class="table table-hover">--%>
                    <%--<thead class="bg-inverse text-white">--%>
                    <%--<tr>--%>
                        <%--<th scope="col">#</th>--%>
                        <%--<th scope="col">Title</th>--%>
                        <%--<th scope="col">Date</th>--%>
                        <%--<th scope="col">Category</th>--%>
                        <%--<th scope="col">User</th>--%>
                        <%--<th scope="col">Edit</th>--%>
                        <%--<th scope="col">Delete</th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--<% for(Post p:posts){%>--%>
                    <%--<tr >--%>
                        <%--<td><%=p.getId()%></td>--%>
                        <%--<td><%=p.getTitle()%></td>--%>
                        <%--<td><%=p.getTimeFormatted()%></td>--%>
                        <%--<td><%=p.getCategoryName()%></td>--%>
                        <%--<td><%=p.getUserShortName()%></td>--%>
                        <%--<td><a href="?action=editpost&postid=<%=p.getId()%>" class="btn btn-link" title="Edit Post"><i class="fas fa-edit"></i></a></td>--%>
                        <%--<td>--%>
                            <%--<form method="post" class="mb-0">--%>
                                <%--<button type="submit" class="btn btn-link" title="Delete Post"><i class="fas fa-trash-alt"></i></button>--%>
                                <%--<input type="hidden" name="action" value="deletepost" />--%>
                                <%--<input type="hidden" name="postid" value="<%=p.getId()%>" />--%>
                            <%--</form>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<%}%>--%>
                    <%--</tbody>--%>
                <%--</table>--%>

            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>


<jsp:include page="AdminFooter.jsp" />


</body>
</html>
