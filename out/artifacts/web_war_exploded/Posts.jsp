<%@ page import="model.Post" %>
<%@ page import="java.util.LinkedList" %><%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 08.01.2018
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

</head>
<body>


<% LinkedList<Post> posts = (LinkedList<Post>)request.getAttribute("post");%>

<table class="table table-hover">
    <thead class="bg-inverse text-white">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Text</th>
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

<a href="AddPost.jsp" class="btn btn-primary">AddPost</a>


<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

</body>
</html>
