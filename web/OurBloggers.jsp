<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Profile" %>
<%@ page import="datasource.src.StringUtils" %><%--
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <h1 class="display-4">Our Bloggers</h1>
                        <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="d-flex flex-wrap justify-content-center">

                            <% for(Profile p:users){
                                String imgsrc = !StringUtils.isNullOrWhitespace(p.getImageSrc())?"img/"+p.getImageSrc(): "//via.placeholder.com/70x70";%>

                            <div class="card text-white bg-dark mb-3 text-center" style="width: 18rem;">
                                <div class="card-header bg-secondary mb-3">
                                     <img src="<%=imgsrc%>" alt="" style="width: 70px; height: 70px; " class="img-fluid rounded-circle ">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getFirstName()%> <%=p.getLastName()%></h5>
                                    <p class="card-text"><%=p.getHighlight()%></p>
                                </div>
                                <a  href="/bloger?id=<%=p.getProfileId()%>" class=" mybtn ">Go to the profile</a>

                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>














<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.1.1.slim.min.js" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>


<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
