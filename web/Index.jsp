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
    <%--<script src="http://cloud.tinymce.com/stable/tinymce.min.js"></script>--%>
    <%--<script>tinymce.init({ selector:'textarea' });</script>--%>
</head>
<body>

<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>

<div class="bghead">
    <h1 id="namepage">Our Bloggers</h1>



        <%--<h1 id="bordertxt">Posts</h1>--%>
        <%--<% for(Post p:posts){%>--%>
        <%--<ul id="cardwrap">--%>
            <%--<li><h3><%=p.getTitle()%></h3></li>--%>
            <%--<li><p><%=p.getShortText()%></p></li>--%>
            <%--<li><%=p.getTime()%></li>--%>

        <%--</ul>--%>
        <%--<%}%>--%>
         <div class="container">
             <div class="content">
                 <% for(Profile p:users){
                     String imgsrc = !StringUtils.isNullOrWhitespace(p.getImageSrc())?"img/"+p.getImageSrc(): "//via.placeholder.com/50x50";%>
                 <a href="/bloger?id=<%=p.getProfileId()%>">
                     <div class="card">
                         <img src="<%=imgsrc%>" alt="">
                         <div class="txt"><%=p.getFirstName()%> <%=p.getLastName()%>
                             <p ><%=p.getHighlight()%></p>
                         </div>
                     </div>
                 </a>
                 <%}%>
             </div>
        </div>



        <%--<div id="cardwrap">--%>

                <%--<img src="" style="width: 100px" />--%>
                <%--<h3><span></span></h3>--%>


            <%--</a>--%>

        <%--</div>--%>






</div>






    <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
    <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
