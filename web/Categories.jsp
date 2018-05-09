<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
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
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <% for(Category c:categories){%>
    <tr >
        <td><%=c.getCategoryId()%></td>
        <td><%=c.getName()%></td>
        <td><%=c.getDescription()%></td>
        <td><a href="?action=editcategory&id=<%=c.getCategoryId()%>"  class="btn btn-link"><i class="fas fa-edit"></i></a></td>
        <td>
            <form method="post">
                <button type="submit" class="btn btn-link" title="Delete categories"><i class="fas fa-trash-alt"></i></button>
                <%--<input type="submit"  class="btn btn-link" value=" X "><i class="fas fa-trash-alt"></i>--%>
                <input type="hidden" name="action" value="deletecategory" />
                <input type="hidden" name="categoryid" value="<%=c.getCategoryId()%>" />
            </form>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<jsp:include page="AdminFooter.jsp" />
</body>
</html>
