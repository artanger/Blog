<%@ page import="model.Category" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% LinkedList<Category> categories = (LinkedList<Category>)request.getAttribute("categories");%>
<% String categoryId = (String)request.getAttribute("categoryId");%>
<div class="categories">
    <a class="title" href="/index">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span>Categories</span>
            <span class="badge badge-secondary badge-pill"><%=categories.size()%></span>
        </h4>
    </a>
    <ul class="list-group mb-3">
        <% for(Category c:categories){
        String active = !StringUtils.isNullOrEmpty(categoryId) && Integer.parseInt(categoryId) == c.getCategoryId() ? "list-group-item-secondary" : "";%>
        <li class="list-group-item <%=active%>">
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