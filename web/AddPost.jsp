<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 09.01.2018
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<body>
<h1>Add Post</h1>
<form method="post" action="/posts">
    Title:<input type="text" name="title"> </br>
    </br>
    Text:<input type="text" name="text"></br>
    </br>
    <textarea>Next, start a free trial!</textarea>
    <input type="submit" value="Add">
    <input type="hidden" name="action" value="addpost" />
</form>



<script src="jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
