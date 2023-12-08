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
		String name = "";
		String email = "";
		String password = "";
		String gender = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("name"))
					name = cookie.getValue();
				if (cookie.getName().equals("email"))
					email = cookie.getValue();
				if (cookie.getName().equals("password"))
					password = cookie.getValue();
				if (cookie.getName().equals("gender"))
					gender = cookie.getValue();
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
				<div class="card-body mb-0">
					<div class="mx-auto mb-4" style="width: 200px; margin-top: -20px">
						<img src="./images/logo/logo.png" class="w-100 h-100" alt="logo" />
					</div>



					<%
						StringBuilder requiredField = new StringBuilder("");
							String validPassword = request.getParameter("password");
							String validCheck = request.getParameter("error");
							if (validPassword != null) {
								if (validPassword.contains("length")) {
					%>
					<div class="alert alert-warning m-0 p-0 pb-2" role="alert">Password
						must have at least 8 letters!</div>
					<%
						}

								if (validPassword.contains("lowercase")) {
					%>
					<div class="alert alert-warning m-0 p-0 pb-2" role="alert">Password
						must contain Lowercase letter!</div>
					<%
						}
								if (validPassword.contains("uppercase")) {
					%>
					<div class="alert alert-warning m-0 p-0 pb-2" role="alert">Password
						must contain Uppercase letter!</div>
					<%
						}

								if (validPassword.contains("special")) {
					%>
					<div class="alert alert-warning m-0 p-0 pb-2" role="alert">Password
						must contain Special character (eg. !,@,#,$,%,&,*).</div>
					<%
						}
								if (validPassword.contains("number")) {
					%>
					<div class="alert alert-warning m-0 p-0 pb-2" role="alert">Password
						must contain number!</div>
					<%
						}

							}

							if (validCheck != null) {
								if (validCheck.equals("true")) {
					%>
					<div class="alert alert-warning" role="alert">Registration
						Failed.Try Again!</div>
					<%
						} else {
									if (validCheck.contains("name")) {
										requiredField.append("Name ");
									}
									if (validCheck.contains("email")) {
										requiredField.append("Email ");
									}
									if (validCheck.contains("password")) {
										requiredField.append("Password ");
									}
									if (validCheck.contains("gender")) {
										requiredField.append("Gender ");
									}
									if (!requiredField.equals("")) {
					%>
					<div class="alert alert-warning" role="alert"><%=requiredField%>
						Field Required!
					</div>
					<%
						}
								}
							}
					%>
					<form action="register.jsp" method="post" class="forms-sample">
						<div class="form-group row">
							<label for="name" class="col-sm-3 col-form-label">User
								Name</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="name"
									placeholder="Username" value=<%=name%>>
							</div>
						</div>
						<div class="form-group row">
							<label for="email" class="col-sm-3 col-form-label">Email</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" name="email"
									placeholder="Email" value=<%=email%>>
							</div>
						</div>
						<div class="form-group row">
							<label for="password" class="col-sm-3 col-form-label">Password</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="password"
									placeholder="Password" value=<%=password%>>
							</div>
						</div>
						<div class="form-group row">
							<label for="gender" class="col-sm-3 col-form-label">Gender</label>
							<div class="col-sm-9">
								<select class="form-control py-3 ps-4" name="gender">
									<%
										if (gender != "") {
												if (gender.equals("Male")) {
									%>
									<option value="Male" selected="selected">Male</option>
									<option value="Female">Female</option>
									<%
										} else {
									%>
									<option value="Male">Male</option>
									<option value="Female" selected="selected">Female</option>
									<%
										}
											} else {
									%>
									<option value="Male">Male</option>
									<option value="Female">Female</option>

									<%
										}
									%>
								</select>
							</div>
						</div>
						<input type="submit" class="btn btn-gradient-primary me-2 w-100"
							value="Register" />
						<div class="d-flex justify-content-between mt-5 mb-0 p-0">
							<div class="d-flex">
								<p class="m-0 p-0">Already have an account?</p>
								<a class="ms-3 text-decoration-none"
									href="/Amono/WebContent/loginPage.jsp">Login Here</a>
							</div>
							<a class="ms-3  text-decoration-none"
								href="/Amono/WebContent/businessRegisterPage.jsp"> Create
								account for your <span
								class="fw-bold text-success fs-5 fst-italic">Business</span> </a>
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