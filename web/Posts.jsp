<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posts</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>
<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>
<jsp:include page="AdminPostHeader.jsp" />
<table class="table table-hover">
    <thead class="bg-inverse text-white">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Text</th>
        <th scope="col">Date</th>
        <th scope="col">UserId</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <% for(Post p:posts){%>
    <tr >
        <td><%=p.getId()%></td>
        <td><%=p.getTitle()%></td>
        <td><%=p.getShortText()%></td>
        <td><%=p.getTime()%></td>
        <td><%=p.getUserId()%></td>
        <td><a href="?action=editpost&postid=<%=p.getId()%>"  class="btn btn-link">Edit</a></td>
        <td>
            <form method="post">
                <input type="submit"  class="btn btn-link" value=" X ">
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