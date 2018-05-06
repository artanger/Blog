<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

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

<div class="container-fluid">
    <div class="row">

        <div class="col-lg-3 " >
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

        <div class="col-lg-6 ">
            <div class="content" >
                <% for(Post p:posts){%>
                <div class="containerpost">
                    <div class="contentpost">
                        <div class="cardpost "  >
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
                                <a href="/post?id=<%=p.getId()%>" class="btn btn-warning float-right">Read more ...</a>
                            </div>



                        </div>
                    </div>
                </div>
                <%}%>
            </div>

        </div>


        <div class="col-lg-2 " >
            <h3 style=" color: #b94a48;">Our Bloggers</h3>
            <ul class="list-group ">
                <% for(Profile pr:users){
                String imgsrc = !StringUtils.isNullOrWhitespace(pr.getImageSrc())?"img/"+pr.getImageSrc(): "//via.placeholder.com/50x50";%>
                <li class="list-group-item ">
                    <img src="<%=imgsrc%>" alt="" style="width: 50px; height: 50px;" class="rounded-circle">
                    <div class="align-items-center">

                        <h6><%=pr.getFirstName()%></h6>
                        <h6 ><%=pr.getLastName()%></h6>


                    </div>

                </li>
                <%}%>
            </ul>
        </div>
    </div>



</div>


    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-3.1.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
