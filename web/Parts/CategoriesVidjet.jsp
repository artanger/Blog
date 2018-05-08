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
        <li class="list-group-item">
            <a class="" href="/category?id=<%=c.getCategoryId()%>">
                <div>
                    <h5 class="my-0 d-flex justify-content-between align-items-center">
                        <span><%=c.getName()%></span>
                        <span class="badge badge-secondary badge-pill" title="amount of posts for the category"><%=c.getPostsCount()%></span>
                    </h5>
                    <small class="text-muted"><%=c.getDescription()%></small>
                </div>
            </a>
        </li>
        <%}%>
    </ul>
</div>
