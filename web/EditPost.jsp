<%@ page import="model.Post" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Post</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/admin-side.css">
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<% Post post = (Post)request.getAttribute("post");%>
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<div class="container">
    <h2>Edit Post</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="/posts" class="form" role="form" >
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Title</label>
                    <input class="form-control col-12"  type="text" name="title" id="title" value="<%=post.getTitle()%>" maxlength="500">
                    </br>
                </div>
                <div class="form-group ">
                    <select class="form-control" name="categoryId">
                        <% for(Category c:categories){
                        boolean isSelected = c.getCategoryId() == Integer.parseInt(post.getCategoryId());
                        String selected = isSelected ? "selected" : "";%>
                        <option value="<%=c.getCategoryId()%>" <%=selected%>><%=c.getName()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Introduction</label>
                    <textarea class="form-control col-12"  type="text" name="introduction" id="introduction" maxlength="2500" rows="3"><%=post.getIntroduction()%></textarea>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Text</label>
                    <textarea rows="6" name="text" id="text" class="form-control col-12 mce"><%=post.getText()%></textarea>
                    </br>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-share-square mr-1"></i>Save</button>
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
