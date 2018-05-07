<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<div class="categories">
    <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span >Categories</span>
        <span class="badge badge-secondary badge-pill"><%=categories.size()%></span>
    </h4>
    <ul class="list-group mb-3">
        <% for(Category c:categories){%>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
                <h5 class="my-0"><%=c.getName()%></h5>
                <small class="text-muted"><%=c.getDescription()%></small>
            </div>
            <span class="text-muted">0</span>
        </li>
        <%}%>
    </ul>
</div>
