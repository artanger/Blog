<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="postinfo">
    <li>
        <a href="/category?id=<%=request.getParameter("categoryId")%>">
            <i class="fas fa-clipboard-list"></i><span><%=request.getParameter("categoryName")%></span>
        </a>
    </li>
    <li>
        <a href="/bloger?id=<%=request.getParameter("userId")%>">
            <i class="fas fa-user-circle"></i><span><%=request.getParameter("userShortName")%></span>
        </a>
    </li>
    <li>
        <a href="javascript:void();">
            <i class="far fa-clock"></i><span><%=request.getParameter("timeFormatted")%></span>
        </a>
    </li>
    <li>
        <a href="javascript:void();">
            <i class="far fa-comments"></i><span><%=request.getParameter("commentsCount")%></span>
        </a>
    </li>
</ul>
