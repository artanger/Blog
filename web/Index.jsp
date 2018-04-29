<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Principal" %>
<%@ page import="model.Profile" %><%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 11.01.2018
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="css/style.css">
    <%--<script src="http://cloud.tinymce.com/stable/tinymce.min.js"></script>--%>
    <%--<script>tinymce.init({ selector:'textarea' });</script>--%>
</head>
<body>

<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>
<div class="header">
    <h2>Blog Name</h2>
</div>




<div class="row">
    <div class="leftcolumn">
        <% for(Post p:posts){%>
        <div class="card">

            <h2> <%=p.getTitle()%></h2>
            <h5> <%=p.getTime()%></h5>
            <p><%=p.getShortText()%></p>


        </div>
        <%}%>
    </div>



    <div class="rightcolumn">
        <div class="card">
            <h2>About Me</h2>
            <div class="fakeimg" style="height:100px;">Image</div>
            <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
        </div>
        <h3>Our Blogers</h3>

        <% for(Profile p:users){%>
            <div class="card">
                <p><%=p.getFirstName()%></p>
                <p><%=p.getLastName()%></p>
                <p><%=p.getImageSrc()%></p>
                <p><%=p.getHighlight()%></p>
            </div>
        <%}%>

        <div class="card">
            <h3>Follow Me</h3>
            <p>Some text..</p>
        </div>
    </div>
</div>

<footer class="container-fluid">
    <p>Footer Text</p>
</footer>



    <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
    <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
