<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %><%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">--%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animhead.css">
<link rel="stylesheet" href="css/fontawesome-all.min.css" />
<%--<script src="http://cloud.tinymce.com/stable/tinymce.min.js"></script>--%>
<%--<script>tinymce.init({ selector:'textarea' });</script>--%>
</head>
<body>

<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>


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
        <h3 style=" color: #b94a48; ">Categories</h3>
        <div class="categories">

            <div class="categorieslist">
                <ul >
                    <li>Other</li>
                    <li>IT technologies</li>
                    <li>Heroes</li>
                    <li>Cycling</li>

                </ul>
            </div>

        </div>


    </div>
    <div class="column middle" >
        <div class="content" >
            <% for(Post p:posts){%>
            <div class="containerpost">
                <div class="contentpost">
                    <div class="cardpost" >
                        <h3 style="color: #b94a48;" ><%=p.getTitle()%></h3>
                        <ul id="postinfo">
                            <li>
                                <i class="fas fa-clipboard-list"></i><%=p.getCategoryName()%>
                            </li>

                            <li>
                                <a href="/bloger?id=<%=p.getUserId()%>">
                                    <i class="fas fa-user-circle"></i><%=p.getUserShortName()%>
                                </a>
                            </li>
                            <li>
                                <i class="far fa-clock"></i><%=p.getTime()%>
                            </li>

                        </ul>

                        <div class="txtpost">
                            <p ><%=p.getIntroduction()%></p>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
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
