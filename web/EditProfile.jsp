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
<% String imagesPath = (String) request.getAttribute("ImagesPath");%>
<div class="container">
    <h2>Edit Profile</h2>
    <div class="row">
        <div class="col">
            <form method="post" action="${pageContext.request.contextPath}/currentprofile" class="form" role="form" >
                <div class="form-group row">
                    <div class="col-6">
                        <label class="col-form-label">First Name</label>
                        <input class="form-control col-12"  type="text" name="firstname" id="firstname" maxlength="45" value="<%=profileModel.getFirstName()%>">
                    </div>
                    <div class="col-6">
                        <label class="col-form-label">Last Name</label>
                        <input class="form-control col-12"  type="text" name="lastname" id="lastname" maxlength="45" value="<%=profileModel.getLastName()%>">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-6">
                        <label class="col-form-label">Choose image:</label>
                        <input class="form-control file-input" type="file" data-id="imgsrc">
                        <label class="col-form-label">Selected image:</label>
                        <img src="img/<%= profileModel.getImageSrc()%>" class="form-control edit-profile" />
                        <input type="hidden" name="imgsrc" id="imgsrc" value="<%=profileModel.getImageSrc()%>" >
                    </div>
                    <div class="col-6">
                        <label class="col-form-label">Birthdate</label>
                        <input class="form-control col-12 datepicker"  type="date" name="birthdate" id="birthdate" value="<%=profileModel.getBirthDate()%>">
                        <label class="col-form-label">Highlight</label>
                        <input class="form-control col-12"  type="text" name="highlight" id="highlight" maxlength="500" value="<%=profileModel.getHighlight()%>">
                        <label class="col-form-label">Description</label>
                        <textarea rows="10" name="description" id="description" class="form-control col-12" maxlength="2000"><%=profileModel.getDescription()%></textarea>
                        </br>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-share-square mr-1"></i>Save
                        </button>
                        <input type="hidden" name="action" value="savecurrentprofile" />
                        <input type="hidden" name="userid" value="<%=profileModel.getUserId()%>" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="AdminFooterMce.jsp" />
</body>
</html>
