<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Category</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<% Category cat = (Category)request.getAttribute("category");%>
<div class="container">
    <h2>Edit Post</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="/categories" class="form" role="form" >
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Name</label>
                    <input class="form-control col-12"  type="text" name="name" id="name" value="<%=cat.getName()%>">
                    </br>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Description</label>
                    <textarea rows="4" name="description" id="description" class="form-control col-12"><%=cat.getDescription()%></textarea>
                    </br>
                    <input type="submit" value="Save" class="btn btn-outline-primary">
                    <input type="hidden" name="action" value="savecategory" />
                    <input type="hidden" name="id" value="<%=cat.getCategoryId()%>" />
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="AdminFooter.jsp" />
</body>
</html>