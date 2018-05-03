<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Post</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<div class="container">
    <h2>Add Post</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="/posts" class="form" role="form">
                <div class="form-group ">
                    <label  class="col-sm-2 col-form-label">Title</label>
                    <input type="text" name="title" class="form-control col-12" > </br>
                </div>
                <div class="form-group ">
                    <select class="form-control" name="categoryId">
                        <% for(Category c:categories){%>
                        <option value="<%=c.getCategoryId()%>"><%=c.getName()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Introduction</label>
                    <input class="form-control col-12"  type="text" name="introduction" id="introduction">
                    </br>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 col-form-label">Text</label>
                    <textarea rows="4" name="text" id="text" class="form-control col-12"></textarea>
                </div>

                <input type="submit" value="Add Post" class="btn btn-outline-primary">
                <input type="hidden" name="action" value="newpost" />
            </form>
        </div>
    </div>
</div>
<jsp:include page="AdminFooterMce.jsp" />
</body>
</html>
