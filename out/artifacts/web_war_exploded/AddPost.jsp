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
</head>
<body>
<h1>Add Post</h1>
<form method="post" action="/posts">
    Title:<input type="text" name="title"> </br>
    </br>
    Text:<input type="text" name="text"></br>
    </br>
    <input type="submit" value="Add">
    <input type="hidden" name="action" value="addpost" />
</form>

</body>
</html>
