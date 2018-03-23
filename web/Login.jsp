<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/loginform.css">
</head>
<body>


<%--<div class="row justify-content-between">--%>
    <%--<div class="col-3">--%>

    <%--</div>--%>

    <%--<div class="col-3">--%>

    <%--</div>--%>
<%--</div>--%>

<%--<div class="row justify-content-center">--%>
    <%--<div class="col-4">--%>
        <%--<div class="card card-body mb-2">--%>
            <%--<div class="card card-outline-secondary">--%>
                <%--<div class="card-header">--%>
                    <%--<h3 class="mb-0">Login</h3>--%>
                <%--</div>--%>
                <%--<div class="card-block">--%>

                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
            <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
        </div>

        <!-- Login Form -->
        <form class="form" role="form"  method="post" action="">
            <label >Username</label>
            <input type="text" class="fadeIn second" name="username" id="login" >

            <label>Password</label>
            <input type="text" class="fadeIn third"  name="password" id="password"   >

            <input type="submit" class="fadeIn fourth" value="Submit">
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
            <a class="underlineHover" href="#">Forgot Password?</a>
        </div>

    </div>
</div>

<jsp:include page="AdminFooter.jsp" />
</body>
</html>
