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
</head>
<body>
<% Post post = (Post)request.getAttribute("post");%>
<h1>Edit Post</h1>
<form method="post" action="/posts" >
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" value="<%=post.getTitle()%>">
    </br>
    <label for="text">Text:</label>
    <textarea rows="4" name="text" id="text"><%=post.getText()%></textarea>
    </br>
    <input type="submit" value="Save">
    <input type="hidden" name="action" value="savepost" />
    <input type="hidden" name="postid" value="<%=post.getId()%>" />
</form>

</body>
</html>
