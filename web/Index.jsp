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
    <link rel="stylesheet" href="css/fontawesome-all.min.css" />
    <%--<script src="http://cloud.tinymce.com/stable/tinymce.min.js"></script>--%>
    <%--<script>tinymce.init({ selector:'textarea' });</script>--%>
</head>
<body>

<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>

<div class="bghead">
    <h1 id="namepage">All posts</h1>



         <div class="containerpost">
             <div class="contentpost">
                 <% for(Post p:posts){%>
                     <div class="cardpost"  >
                         <h3><%=p.getTitle()%></h3>
                         <ul id="postinfo">
                             <li><i class="far fa-clipboard fa-pull-left" ></i> </li>
                             <li><i class="far fa-clipboard fa-pull-left" ></i><%=p.getTime()%></li>
                             <li><i class="far fa-clipboard fa-pull-left" ></i></li>
                         </ul>
                         <div class="txtpost">
                             <p ><%=p.getShortText()%></p>
                         </div>
                     </div>
                 <%}%>
             </div>
        </div>


        <div class="containerside">
            <div class="contentside">



            </div>
        </div>

</div>






    <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
    <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
