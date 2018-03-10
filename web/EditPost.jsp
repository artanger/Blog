<%@ page import="model.Post" %><%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 10.01.2018
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
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

<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="tinymce_4.7.4/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        height: 500,
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste imagetools wordcount"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });
</script>
</body>
</html>
