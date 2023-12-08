<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import="java.sql.*,com.amono.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Integer userId = (Integer) session.getAttribute("userId");
		Integer authRoleId = (Integer) session.getAttribute("userRole");

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
			String name = request.getParameter("name").trim();
			String email = request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			String gender = request.getParameter("gender").trim();

			//current date
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String formattedDate = dateFormat.format(currentDate);

			//hash password
			String salt = BCrypt.gensalt();
			String hashPassword = BCrypt.hashpw(password, salt);

			//set cookie to registration value
			Cookie cname = new Cookie("name", name);
			response.addCookie(cname);
			Cookie cemail = new Cookie("email", email);
			response.addCookie(cemail);
			Cookie cpassword = new Cookie("password", password);
			response.addCookie(cpassword);
			Cookie cgender = new Cookie("gender", gender);
			response.addCookie(cgender);

			Connection conn = DBUtil.getDBConnection();
			PreparedStatement pstmt = null;
			int row = 0;
			boolean hasValidLength = false;
			boolean hasSpecialCharacter = false;
			boolean hasNumber = false;
			boolean hasLowerCase = false;
			boolean hasUpperCase = false;
			String specialCharacters = "!@#$%&*";
			String forwardPage = null;
		
			if (!name.isEmpty() && !email.isEmpty() && !password.isEmpty()
					&& !gender.isEmpty()) {
				if (password.length() >= 8) {
					hasValidLength = true;
				}
				for (char ch : password.toCharArray()) {
					if (Character.isLowerCase(ch)) {
						hasLowerCase = true;
					}
					if (Character.isUpperCase(ch)) {
						hasUpperCase = true;
					}
					if (Character.isDigit(ch)) {
						hasNumber = true;
					}
					if (specialCharacters.contains(String.valueOf(ch))) {
						hasSpecialCharacter = true;
					}
				}
				if (hasValidLength && hasUpperCase && hasLowerCase
						&& hasNumber && hasSpecialCharacter) {
				try {
					String query = "insert into users (name,email,password,gender,role_id,created_date,updated_date) values (?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					pstmt.setString(3, hashPassword);
					pstmt.setString(4, gender);
					pstmt.setInt(5, 2);
					pstmt.setString(6, formattedDate);
					pstmt.setString(7, formattedDate);

					row = pstmt.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();
				}}
			} else {
				forwardPage = "/WebContent/businessRegisterPage.jsp";
			}
			if (row < 1) {
				StringBuilder validCheck = new StringBuilder("");
				StringBuilder validPassword =  new StringBuilder("");
				if (name.isEmpty()) {
					validCheck.append("name");
				}
				if (email.isEmpty()) {
					validCheck.append("email");
				}
				if (password.isEmpty()) {
					validCheck.append("password");
				}
				if(!name.isEmpty() && !email.isEmpty()
						&& !password.isEmpty()){
					if (!hasValidLength) {
						validPassword.append("length");
					}
					if (!hasLowerCase) {
						validPassword.append("lowercase");
					}
					if (!hasUpperCase) {
						validPassword.append("uppercase");
					}
					if (!hasSpecialCharacter) {
						validPassword.append("special");
					}
					if (!hasNumber) {
						validPassword.append("number");
					}
				}
				 if (!name.isEmpty() && !email.isEmpty()
						&& !password.isEmpty() && !gender.isEmpty()
						&& hasValidLength && hasUpperCase && hasLowerCase
						&& hasNumber && hasSpecialCharacter) {
					validCheck.append("true");
				} 
				
			
				if(validPassword.length() >0){
					
					forwardPage = "/WebContent/businessRegisterPage.jsp?password="
							+ validPassword;
				}
				if(validCheck.length() > 0){
					
					forwardPage = "/WebContent/businessRegisterPage.jsp?error="
							+ validCheck;
				}
				
			}  else {
				//get business user id
				ResultSet rs = null;
				String businessman_id = "0";
				String query = "select * from users where name=? and email=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					businessman_id = Integer.toString(rs.getInt("id"));
					//set temp_user_it to cookie
					 Cookie temp_user_id = new Cookie("temp_user_id", businessman_id);
					temp_user_id.setMaxAge(60*60*60);
					response.addCookie(temp_user_id); 
				}
				forwardPage = "/WebContent/business.jsp?registered=true";
			}
			if (forwardPage != null) {
				// Redirect to the forwardPage using sendRedirect
				response.sendRedirect(request.getContextPath()
						+ forwardPage);
			}
		}
	%>
</body>
</html>