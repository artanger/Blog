<%@ page import="model.Profile" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="datasource.src.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% LinkedList<Profile> users = (LinkedList<Profile>)request.getAttribute("profile");%>
<div class="bloggers">
    <a class="title" href="/ourbloggers">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span>Our Bloggers</span>
            <span class="badge badge-secondary badge-pill"><%=users.size()%></span>
        </h4>
    </a>
    <ul class="list-group mb-3">
        <% for(Profile pr:users){
            String imgsrc = !StringUtils.isNullOrWhitespace(pr.getImageSrc())?"img/"+pr.getImageSrc(): "//via.placeholder.com/50x50";%>
        <li class="list-group-item ">
            <a class="" href="/bloger?id=<%=pr.getProfileId()%>">
                <img class="avatar" src="<%=imgsrc%>" alt="<%=pr.getFirstName()%> <%=pr.getLastName()%>" >
                <div>
                    <h5 class="my-0"><%=pr.getFirstName()%> <%=pr.getLastName()%></h5>
                    <small class="text-muted"><%=pr.getShortenHighlight()%></small>
                </div>

            </a>
        </li>
        <%}%>
    </ul>
</div>