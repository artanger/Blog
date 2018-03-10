<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>


<div class="row justify-content-between">
    <div class="col-3">

    </div>

    <div class="col-3">

    </div>
</div>

<div class="row justify-content-center">
    <div class="col-4">
        <div class="card card-body mb-2">
            <div class="card card-outline-secondary">
                <div class="card-header">
                    <h3 class="mb-0">Login</h3>
                </div>
                <div class="card-block">
                    <form class="form" role="form"  method="post" action="">
                        <div class="form-group">
                            <label >Username</label>
                            <input type="text" class="form-control" name="username" >
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control"  name="password"  >
                        </div>
                        <input type="submit" class="btn btn-success btn-lg float-right" value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="AdminFooter.jsp" />
</body>
</html>
