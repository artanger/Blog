<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page import="model.Category" %>
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

<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>


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

                            <div>
                                <a href="/post?id=<%=p.getId()%>" class="btn btn-warning">Read more ...</a>
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

    <script src="//code.jquery.com/jquery-3.1.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
