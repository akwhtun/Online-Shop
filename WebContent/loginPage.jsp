<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<jsp:include page="./Admin/header.html"></jsp:include>
	<%
		Integer userId = (Integer) session.getAttribute("userId");
		Integer authRoleId = (Integer) session.getAttribute("userRole");
		String temp_user_id = "0";
		String business_id = "0";
		//for business user
		 Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("temp_user_id"))
					temp_user_id = cookie.getValue();
				if (cookie.getName().equals("business_id"))
					business_id = cookie.getValue();
			}
		} 
		Integer tempUserId = Integer.parseInt(temp_user_id);
		String auth = "no-error";

	/* 	if(tempUserId != null && business_id.equals("0")){
			response.sendRedirect("http://localhost:8080/Amono/WebContent/business.jsp?complete=false");
		}  
		  */
		if (userId != null) {
			if (authRoleId == 1) {
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Customer/index.jsp");
			} else if (authRoleId == 2) {
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Admin/business.jsp");
			} else if (authRoleId == 3) {
				response.sendRedirect("http://localhost:8080/Amono/WebContent/Admin/index.jsp");
			}
		} else {
	%>
	<div class="content-wrapper " style="height: 100vh">

		<div class="col-md-6 offset-3 mt-4 grid-margin stretch-card">
			<div class="card mb-0">
				<div class="card-body mb-0">

					<div class="mx-auto mb-4"
					style="width: 200px;margin-top: -20px">
						<img src="./images/logo/logo.png" class="w-100 h-100"
							 alt="logo" />
					</div>


					<!-- login Error  -->
					<%
						if (request.getQueryString() != null) {
								auth = request.getQueryString();
							}
							if (auth.equals("error=true")) {
					%>
					<div class="alert alert-warning" role="alert">Invalid Email
						or Password. Try Again!</div>
					<%
						}
							if (auth.equals("registered=true")) {
					%>
					<div class="alert alert-success" role="alert">Account created
						successfully.Login now!</div>
					<%
						}
							if (auth.equals("suspended=true")) {
					%>
					<div class="alert alert-danger" role="alert">Your account is
						suspended!</div>
					<%
						}
							if (auth.equals("passwordChanged=true")) {
					%>
					<div class="alert alert-success" role="alert">Your Password
						changed successfully.Login Now!</div>
					<%
						}
					%>
					<form action="login.jsp" method="post" class="forms-sample">
						<div class="form-group row">
							<label for="email" class="col-sm-3 col-form-label">Email</label>
							<div class="col-sm-9">
								<input type="email" name="email" class="form-control"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group row">
							<label for="password" class="col-sm-3 col-form-label">Password</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control"
									placeholder="Password">
							</div>
						</div>
						<input type="submit" class="btn btn-gradient-primary me-2 w-100"
							value="Log In" />
						<div class="d-flex mt-5 mb-0 p-0">
							<p class="m-0 p-0">Don't have an account?</p>
							<a class="ms-3 text-decoration-none"
								href="/Amono/WebContent/registerPage.jsp">Register Here</a>
						</div>
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