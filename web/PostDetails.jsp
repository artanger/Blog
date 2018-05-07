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
<div class="container-fluid">
    <div class="row">
        <div class="col-3 side mt-4">
            <jsp:include page="Parts/CategoriesVidjet.jsp" />
        </div>
        <div class="col-6 mt-4" >
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
                        <img class="avatar" src="img/avatar_incognito.png" alt="avatar for comment" />
                        <div class="content">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="author"><%=cm.getAuthor()%>:</h6>
                                <small><%=cm.getCreationTime()%></small>
                            </div>
                            <p class="comment-text"><%=cm.getText()%></p>
                        </div>
                    </li>
                    <%}%>
                    </ul>
                </div>
                <%}%>

                <div class="add-comment">
                    <h4 class="mb-3">Add comment</h4>
                    <form class="needs-validation" novalidate="" action="/post?id=<%=postdetails.getId()%>" method="post">
                        <div class="row">
                            <div class="col mb-3">
                                <label for="author">Your Name</label>
                                <input type="text" class="form-control" id="author" name="author" placeholder="Enter Your Name" maxlength="250" required>
                                <div class="invalid-feedback">Name is required.</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <label for="text">Comment</label>
                                <textarea class="form-control" id="text" name="text" placeholder="Write a Response" rows="4" maxlength="1000" required></textarea>
                                <div class="invalid-feedback">Text for comment is required.</div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary " type="submit">Post comment</button>
                        <input type="hidden" name="action" value="newcomment" />
                        <input type="hidden" name="postId" value="<%=postdetails.getId()%>" />
                    </form>
                </div>
            </div>
        </div>

        <div class="col-3 side mt-4" >
            <div class="bloggers">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span >Our Bloggers</span>
                    <span class="badge badge-secondary badge-pill"><%=users.size()%></span>
                </h4>
                <ul class="list-group mb-3">
                    <% for(Profile pr:users){
                        String imgsrc = !StringUtils.isNullOrWhitespace(pr.getImageSrc())?"img/"+pr.getImageSrc(): "//via.placeholder.com/50x50";%>
                    <li class="list-group-item ">
                        <a class="" href="/bloger?id=<%=pr.getProfileId()%>">
                            <img class="avatar" src="<%=imgsrc%>" alt="<%=pr.getFirstName()%> <%=pr.getLastName()%>" >
                            <div>
                                <h5 class="my-0"><%=pr.getFirstName()%> <%=pr.getLastName()%></h5>
                                <small class="text-muted"><%=pr.getHighlight()%></small>
                            </div>

                        </a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
</div>
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
