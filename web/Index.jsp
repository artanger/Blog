<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/btnstyle.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/animhead.css">
    <link rel="stylesheet" href="css/fontawesome-all.min.css" />
</head>
<body>
<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
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
        <div class="col-3 side mt-4">
            <jsp:include page="Parts/CategoriesVidjet.jsp" />
        </div>
        <div class="col-6 mt-4">
            <div class="content" >
                <% for(Post p:posts){%>
                <div class="containerpost">
                    <div class="contentpost">
                        <div class="cardpost">
                            <h3 class="title"><%=p.getTitle()%></h3>
                            <jsp:include page="Parts/PostsInfoPanel.jsp">
                                <jsp:param name="categoryId" value="<%=p.getCategoryId()%>" />
                                <jsp:param name="categoryName" value="<%=p.getCategoryName()%>" />
                                <jsp:param name="userId" value="<%=p.getUserId()%>" />
                                <jsp:param name="userShortName" value="<%=p.getUserShortName()%>" />
                                <jsp:param name="timeFormatted" value="<%=p.getTimeFormatted()%>" />
                                <jsp:param name="commentsCount" value="<%=p.getCommentsCount()%>" />
                            </jsp:include>
                            <div class="txtpost">
                                <p ><%=p.getIntroduction()%></p>
                            </div>
                            <div class="row read-more">
                                <div class="col">
                                    <a href="/post?id=<%=p.getId()%>" class="btn btn-sm btn-warning float-right">Read more ...</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div class="col-3 side mt-4" >
            <jsp:include page="Parts/BloggersVidjet.jsp" />
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
