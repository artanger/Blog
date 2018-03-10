<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<% Post post = (Post)request.getAttribute("post");%>
<div class="container">
    <h2>Edit Post</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="/posts" class="form" role="form" >
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Title</label>
                    <input class="form-control col-12"  type="text" name="title" id="title" value="<%=post.getTitle()%>">
                    </br>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Text</label>
                    <textarea rows="4" name="text" id="text" class="form-control col-12"><%=post.getText()%></textarea>
                    </br>
                    <input type="submit" value="Save" class="btn btn-outline-primary">
                    <input type="hidden" name="action" value="savepost" />
                    <input type="hidden" name="postid" value="<%=post.getId()%>" />
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="AdminFooterMce.jsp" />
</body>
</html>
