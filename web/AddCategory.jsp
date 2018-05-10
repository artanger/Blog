
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Post</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/admin-side.css">
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<div class="container">
    <h2>Add Category</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="/categories" class="form" role="form">
                <div class="form-group ">
                    <label  class="col-sm-2 col-form-label">Name</label>
                    <input type="text" name="name" id="name" class="form-control col-12" > </br>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 col-form-label">Description</label>
                    <textarea rows="4" name="description" id="description" class="form-control col-12"></textarea>
                </div>

                <input type="submit" value="Add Category" class="btn btn-outline-primary">
                <input type="hidden" name="action" value="newcategory" />
            </form>
        </div>
    </div>
</div>
<jsp:include page="AdminFooter.jsp" />
</body>
</html>