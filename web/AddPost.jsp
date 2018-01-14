<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 09.01.2018
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script type="text/javascript" src="tiny_mce/tiny_mce.js"></script>
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
</head>
<body>
<h1>Add Post</h1>
<form method="post" action="/posts"  >
    Title:<input type="text" name="title"> </br>
    </br>
    Text:<input type="text" name="text"></br>
    </br>
    <input type="submit" value="Add">
    <input type="hidden" name="action" value="addpost" />


</form>

<%--<form method="post" action="/posts">--%>
    <%--<div>--%>
      <%--<textarea cols="80" rows="10" id="articleContent" name="articleContent">--%>
        <%--&lt;h1&gt;Article Title&lt;/h1&gt;--%>
        <%--&lt;p&gt;Here's some sample text&lt;/p&gt;--%>
      <%--</textarea>--%>
        <%--<script type="text/javascript">--%>
            <%--tinyMCE.init({--%>
                <%--theme : "advanced",--%>
                <%--theme_advanced_toolbar_location : "top",--%>
                <%--theme_advanced_toolbar_align : "left",--%>
                <%--mode : "exact",--%>
                <%--elements : "articleContent"--%>
            <%--});--%>
        <%--</script>--%>
       <%----%>
    <%--</div>--%>
<%--</form>--%>


<script type="text/javascript" src="plugin/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="plugin/tinymce/init-tinymce.js"></script>

<script src="jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
