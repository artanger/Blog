<%@ page import="model.Post" %>
<%@ page import="model.Profile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Post</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous" />

    <link rel="stylesheet" href="css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="css/fileinput.min.css" />
    <link rel="stylesheet" href="css/admin-side.css" />
</head>
<body>
<jsp:include page="AdminPostHeader.jsp" />
<% Profile profileModel = (Profile)request.getAttribute("ProfileModel");%>
<div class="container">
    <h2>Edit Profile</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="${pageContext.request.contextPath}/currentprofile" class="form" role="form" >
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">First Name</label>
                    <input class="form-control col-12"  type="text" name="firstname" id="firstname" value="<%=profileModel.getFirstName()%>">
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Last Name</label>
                    <input class="form-control col-12"  type="text" name="lastname" id="lastname" value="<%=profileModel.getLastName()%>">
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Highlight</label>
                    <input class="form-control col-12"  type="text" name="highlight" id="highlight" value="<%=profileModel.getHighlight()%>">
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Birthdate</label>
                    <input class="form-control col-12 datepicker"  type="date" name="birthdate" id="birthdate" value="<%=profileModel.getBirthDate()%>">
                </div>
                <%=profileModel.getImageSrc()%>
                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Choose image:</label>
                    <input class="form-control col-12 file-input " type="file" name="imgsrc" id="imgsrc" value="<%=profileModel.getImageSrc()%>" >
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Description</label>
                    <textarea rows="4" name="description" id="description" class="form-control col-12"><%=profileModel.getDescription()%></textarea>
                    </br>
                    <input type="submit" value="Save" class="btn btn-outline-primary">
                    <input type="hidden" name="action" value="savecurrentprofile" />
                    <input type="hidden" name="userid" value="<%=profileModel.getUserId()%>" />
                </div>

            </form>
        </div>
    </div>
</div>

<jsp:include page="AdminFooterMce.jsp" />
</body>
</html>
