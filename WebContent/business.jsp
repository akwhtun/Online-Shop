<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*" import="javax.servlet.http.*"
	import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./Admin/header.html"></jsp:include>
	<%
		Integer userId = (Integer) session.getAttribute("userId");
		Integer authRoleId = (Integer) session.getAttribute("userRole");
		String businessName = "";
		String businessDescription = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("businessName"))
					businessName = cookie.getValue();
				if (cookie.getName().equals("businessDescription"))
					businessDescription = cookie.getValue();
			}
		}
		if (userId != null) {
			switch (authRoleId) {
			case 1:
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Customer/index.jsp");
				break;
			case 2:
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Admin/business.jsp");
				break;
			case 3:
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Admin/index.jsp");
				break;
			}
		} else {
	%>
	<div class="content-wrapper " style="height: 100vh">
		<div class="col-md-6 offset-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
				
					<div class="mx-auto mb-4"
					style="width: 200px;margin-top: -20px">
						<img src="./images/logo/logo.png" class="w-100 h-100"
							 alt="logo" />
					</div>
					<p class="fw-bold fw-lighter text-primary" style="font-size: 18px;">Notice
						that You are creating account for your Business.</p>
					<%
						StringBuilder requiredField = new StringBuilder("");
							String requiredRegistration = "";
							if (request.getQueryString() != null) {
								requiredRegistration = request.getQueryString();
							}
							if (requiredRegistration.equals("error=true")) {
					%>
					<div class="alert alert-warning" role="alert">Registration
						Failed.Try Again!</div>
					<%
						} else if (requiredRegistration.equals("registered=true")) {
					%>

					<div class="alert alert-primary" role="alert">Account Created
						Successfully.Now Register Your Business Details!</div>
					<%
						} else if (requiredRegistration.equals("complete=false")) {
					%>
					<div class="alert alert-warning" role="alert">Complete
						Business Account Creation!</div>
					<%
						} else {
								if (requiredRegistration.contains("businessName")) {
									requiredField.append("BusinessName ");
								}
								if (requiredRegistration.contains("businessDescription")) {
									requiredField.append("BusinessDescription ");
								}
								if (requiredRegistration.contains("businessLogo")) {
									requiredField.append("BusinessLogo ");
								}
								if (!requiredRegistration.isEmpty()) {
					%>
					<div class="alert alert-warning" role="alert"><%=requiredField%>
						Field Required!
					</div>
					<%
						}
							}
					%>
					<form action="businessDetailRegister" method="post"
						enctype="multipart/form-data" class="forms-sample">
						<div class="form-group row">
							<label for="businessName" class="col-sm-3 col-form-label">Business's
								Name</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="businessName"
									placeholder="Business's Name" value=<%=businessName%>>
							</div>
						</div>

						<div class="form-group row">
							<label for="businessDescription" class="col-sm-3 col-form-label">Description</label>
							<div class="col-sm-9">
								<textarea class="form-control" name="businessDescription"
									rows="4" placeholder="Business's Description"><%=businessDescription%></textarea>
							</div>
						</div>

						<div class="form-group row">
							<label for="logo" class="col-sm-3 col-form-label">Business's
								Logo</label>
							<div class="col-sm-9">
								<input type="file" name="logo" class="form-control" />
							</div>
						</div>
						<input type="submit" class="btn btn-gradient-primary me-2 w-100"
							value="Complete Registration" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>