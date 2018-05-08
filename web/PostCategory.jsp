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
                        <div class="cardpost "  >
                            <h3 style="color: #b94a48;" ><%=p.getTitle()%></h3>
                            <ul id="postinfo">
                                <li>
                                    <a href="/category?id=<%=p.getCategoryId()%>">
                                        <i class="fas fa-clipboard-list"></i><%=p.getCategoryName()%>
                                    </a>
                                </li>
                                <li>
                                    <a href="/bloger?id=<%=p.getUserId()%>">
                                        <i class="fas fa-user-circle"></i><%=p.getUserShortName()%>
                                    </a>
                                </li>
                                <li>
                                    <i class="far fa-clock"></i><%=p.getTimeFormatted()%>
                                </li>
                                <li>
                                    <i class="far fa-clock"></i><%=p.getCommentsCount()%>
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

        <div class="col-3 side mt-4" >
            <jsp:include page="Parts/BloggersVidjet.jsp" />
        </div>
    </div>
</div>
</body>
</html>
