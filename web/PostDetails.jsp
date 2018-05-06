<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page import="model.Category" %>
<%@ page import="model.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animhead.css">
<link rel="stylesheet" href="css/fontawesome-all.min.css" />
<%--<script src="http://cloud.tinymce.com/stable/tinymce.min.js"></script>--%>
<%--<script>tinymce.init({ selector:'textarea' });</script>--%>
</head>
<body>
<% Post postdetails = (Post)request.getAttribute("postdetails");%>
<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<% LinkedList<Comment> comments = (LinkedList<Comment>)request.getAttribute("comments");%>



<div class="header">
    <div class="contentwrap">
        <ul class="fly-in-text">
            <li>W</li>
            <li>E</li>
            <li>L</li>
            <li>C</li>
            <li>O</li>
            <li>M</li>
            <li>E</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="column side" >
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span >Categories</span>
            <span class="badge badge-secondary badge-pill"><%=categories.size()%></span>
        </h4>
        <ul class="list-group mb-3">
            <% for(Category c:categories){%>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                    <h6 class="my-0"><%=c.getName()%></h6>
                    <small class="text-muted"><%=c.getDescription()%></small>
                </div>
                <span class="text-muted">0</span>
            </li>
            <%}%>
        </ul>
    </div>
    <div class="column middle" >
        <div class="content" >
            <h1><%=postdetails.getTitle()%></h1>
            <p><%=postdetails.getIntroduction()%></p>
            <p><%=postdetails.getText()%></p>
            <p><%=postdetails.getUserShortName()%></p>
            <p><%=postdetails.getTime()%></p>
            <p><%=postdetails.getCategoryName()%></p>
            <p><%=postdetails.getCategoryId()%></p>

            <% if (comments.size() > 0) {%>
            <div class="comments">
                <h4>Comments</h4>
                <ul class="ist-group" >
                <% for(Comment cm:comments){%>
                <li class="list-group-item">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%=cm.getAuthor()%></h5>
                        <small><%=cm.getCreationTime()%></small>
                    </div>
                    <p class="text-left"><%=cm.getText()%></p>

                </li>
                <%}%>
                </ul>
            <%}%>
            </div>

            <div class="add-comment">
                <h4 class="mb-3">Add comment</h4>
                <form class="needs-validation" novalidate="">
                    <div class="row">
                        <div class="col mb-3">
                            <label for="author">Your Name</label>
                            <input type="text" class="form-control" id="author" name="author" placeholder="Enter Your Name" value="" required="true">
                            <div class="invalid-feedback">Name is required.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col mb-3">
                            <label for="text">Comment</label>
                            <input type="text" class="form-control" id="text" name="text" placeholder="Write a Response" value="" required="true">
                            <div class="invalid-feedback">Text for comment is required.</div>
                        </div>
                    </div>

                    <hr class="mb-4">
                    <button class="btn btn-primary " type="submit">Post comment</button>
                </form>
            </div>



        </div>

    </div>


    <div class="column right" >
        <h3 style=" color: #b94a48;">Our Bloggers</h3>
        <div class="bloggers">
            <ul>
                <li>
                    <img src="img/img_avatar.png" alt="Avatar" class="avatar">
                </li>
                <li>
                    <img src="img/img_avatar2.png" alt="Avatar" class="avatar">
                </li>

            </ul>

        </div>



    </div>
</div>









<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
