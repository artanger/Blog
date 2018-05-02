<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %><%--
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
<div class="row">
    <div class="column" style="background-color:#aaa;">

        <div class="card">
            <h3>Popular Post</h3>
            <% for(Post p:posts){%>
                <div class="fakeimg"><p><%=p.getTitle()%></p></div>
                <div class="fakeimg"><p><%=p.getShortText()%></p></div>

            <%}%>
        </div>
        <div class="blockposts">
            <h1>Recent Post</h1>
            <% for(Post p:posts){%>
            <div id="cardwrap">
                <h2><span><%=p.getTitle()%></span></h2>
                <p><span><%=p.getTime()%></span></p>
                <p><span><%=p.getShortText()%></span></p>
            </div>
            <%}%>

        </div>

    </div>

    <div class="column" style="background-color:#bbb;">

        <h3>Our Blogers</h3>

        <% for(Profile p:users){
            String imgsrc = !StringUtils.isNullOrWhitespace(p.getImageSrc())?"img/"+p.getImageSrc(): "//via.placeholder.com/50x50";%>
        <div id="cardwrap">
            <img src="<%=imgsrc%>" style="width: 90px" />

            <a href="/bloger?id=<%=p.getProfileId()%>">
                <p><span><%=p.getFirstName()%> <%=p.getLastName()%></span></p>
                <p><%=p.getBirthDateFormatted()%></p>

            </a>

        </div>
        <%}%>
    </div>
</div>




    <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
    <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
