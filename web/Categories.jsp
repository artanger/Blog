<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/admin-side.css">
</head>
<body>
<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<jsp:include page="AdminPostHeader.jsp" />
<h2>Categories</h2>
<table class="table table-hover">
    <thead class="bg-inverse text-white">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Post Count</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <% for(Category c:categories){
    String disabledClass = c.getPostsCount() > 0 ? "disabled": "";
    %>
    <tr>
        <td><%=c.getCategoryId()%></td>
        <td><%=c.getName()%></td>
        <td><%=c.getDescription()%></td>
        <td><%=c.getPostsCount()%></td>
        <td><a href="?action=editcategory&id=<%=c.getCategoryId()%>"  class="btn btn-link"><i class="fas fa-edit"></i></a></td>
        <td>
        <% if(StringUtils.isNullOrWhitespace(disabledClass)){%>
            <form method="post" class="mb-0">
                <button type="submit" class="btn btn-link" title="Delete categories"><i class="fas fa-trash-alt"></i></button>
                <input type="hidden" name="action" value="deletecategory" />
                <input type="hidden" name="categoryid" value="<%=c.getCategoryId()%>" />
                <input type="hidden" name="disabled" value="<%=disabledClass%>" />
            </form>
        <%} else {%>
            <button type="submit" class="btn btn-link <%=disabledClass%>" title="Delete categories"><i class="fas fa-trash-alt"></i></button>
        <%}%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<jsp:include page="AdminFooter.jsp" />
</body>
</html>
