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
            <div class="content">
                <div class="containerpost">
                    <div class="contentpost">
                        <div class="cardpost">
                            <h3 class="title"><%=postdetails.getTitle()%></h3>
                            <jsp:include page="Parts/PostsInfoPanel.jsp">
                                <jsp:param name="categoryId" value="<%=postdetails.getCategoryId()%>" />
                                <jsp:param name="categoryName" value="<%=postdetails.getCategoryName()%>" />
                                <jsp:param name="userId" value="<%=postdetails.getUserId()%>" />
                                <jsp:param name="userShortName" value="<%=postdetails.getUserShortName()%>" />
                                <jsp:param name="timeFormatted" value="<%=postdetails.getTimeFormatted()%>" />
                                <jsp:param name="commentsCount" value="<%=postdetails.getCommentsCount()%>" />
                            </jsp:include>
                            <p><%=postdetails.getIntroduction()%></p>
                            <p><%=postdetails.getText()%></p>
                            <hr class="mb-4">
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
                            <hr class="mb-4">
                            <%}%>
                            <div class="add-comment">
                                <h4 class="mb-3">Add comment</h4>
                                <form class="needs-validation" action="/post?id=<%=postdetails.getId()%>" method="post">
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
                                    <button class="btn btn-primary " type="submit">Post comment</button>
                                    <input type="hidden" name="action" value="newcomment" />
                                    <input type="hidden" name="postId" value="<%=postdetails.getId()%>" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3 side mt-4" >
            <jsp:include page="Parts/BloggersVidjet.jsp" />
        </div>
    </div>
</div>
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
