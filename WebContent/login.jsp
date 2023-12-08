<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import="java.sql.*" import="com.amono.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		Connection conn = DBUtil.getDBConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from users where email=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, username);
		rs = pstmt.executeQuery();
		boolean authUser = false;
		String authId = null;
		String authRoleId = null;
		String getSuspended = "0";
		while (rs.next()) {
			authUser = BCrypt.checkpw(password, rs.getString("password"));
			if (authUser) {
				getSuspended = rs.getString("suspended");
				authId = rs.getString("id");
				authRoleId = rs.getString("role_id");
				break;
			}
		}
		Integer suspended = Integer.parseInt(getSuspended);
		if (suspended != 0) {
			response.sendRedirect("http://localhost:8080/Amono/WebContent/loginPage.jsp?suspended=true");
		} else {
			if (authUser) {
				Integer userId = Integer.parseInt(authId);
				Integer roleId = Integer.parseInt(authRoleId);
				session.setAttribute("userId", userId);
				session.setAttribute("userRole", roleId);

				switch (roleId) {
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
				response.sendRedirect("http://localhost:8080/Amono/WebContent/loginPage.jsp?error=true");
			}

		}
	%>
</body>
</html>