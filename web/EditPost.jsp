<%@ page import="model.Post" %><%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 10.01.2018
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Post</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script type="text/javascript" src="tiny_mce/tiny_mce.js"></script>

</head>
<body>
<% Post post = (Post)request.getAttribute("post");%>

<div class="container">
    <h2>Edit Post</h2>
    <div class="card ">
        <div class="card-body">
            <form method="post" action="/posts" class="form" role="form" >
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Title</label>
                    <input class="form-control col-12"  type="text" name="title" id="title" value="<%=post.getTitle()%>">
                    </br>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Text</label>
                    <textarea rows="4" name="text" id="text" class="form-control col-12"><%=post.getText()%></textarea>
                    </br>
                    <input type="submit" value="Save" class="btn btn-outline-primary">
                    <input type="hidden" name="action" value="savepost" />
                    <input type="hidden" name="postid" value="<%=post.getId()%>" />
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="plugin/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="plugin/tinymce/init-tinymce.js"></script>

<script src="jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
