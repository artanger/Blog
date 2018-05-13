<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posts</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/admin-side.css">
</head>
<body>
<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<jsp:include page="AdminPostHeader.jsp" />
<h2>Posts</h2>
<table class="table table-hover">
    <thead class="bg-inverse text-white">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Date</th>
        <th scope="col">Category</th>
        <th scope="col">User</th>
        <th scope="col">Comments Count</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <% for(Post p:posts){%>
    <tr >
        <td><%=p.getId()%></td>
        <td><%=p.getTitle()%></td>
        <td><%=p.getTimeFormatted()%></td>
        <td><%=p.getCategoryName()%></td>
        <td><%=p.getUserShortName()%></td>
        <td><%=p.getCommentsCount()%></td>
        <td><a href="?action=editpost&postid=<%=p.getId()%>" class="btn btn-link" title="Edit Post"><i class="fas fa-edit"></i></a></td>
        <td>
            <form method="post" class="mb-0">
                <button type="submit" class="btn btn-link" title="Delete Post"><i class="fas fa-trash-alt"></i></button>
                <input type="hidden" name="action" value="deletepost" />
                <input type="hidden" name="postid" value="<%=p.getId()%>" />
            </form>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<jsp:include page="AdminFooter.jsp" />
</body>
</html>