<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
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
        <div class="col-6 mt-4" >
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
                            <div>
                                <a href="/post?id=<%=p.getId()%>" class="btn btn-warning float-right">Read more ...</a>
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
</body>
</html>
