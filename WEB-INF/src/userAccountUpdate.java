import com.amono.Auth;
import com.amono.DBUtil;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import java.sql.*;
import java.util.Date;
import java.util.UUID;
import java.text.SimpleDateFormat;
import java.lang.*;

@MultipartConfig
public class userAccountUpdate extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int userId = Auth.check(request);
		String upName = request.getParameter("name");
		String upGender = request.getParameter("gender");
		String fileName = null;
		Part part = request.getPart("profile");

		// current date
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String formattedDate = dateFormat.format(currentDate);

		Connection conn;
		try {
			conn = DBUtil.getDBConnection();
			PreparedStatement pstmt = null;
			int row = 0;
			String forwardPage = null;
			if (!upName.isEmpty()) {
				if (part.getSize() > 0) {
					fileName = getFileName(part);
					System.out.println("File name is" + fileName);
					String savePath = "D:\\Amono\\Amono\\WebContent\\images\\profiles"
							+ File.separator + fileName;
					part.write(savePath);
				}else{
					fileName = null;
				}
				try {
					System.out.println("Inserting into database");

					String query = "update users set name=?,gender=?,profile=?,updated_date=? where id=?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, upName);
					pstmt.setString(2, upGender);
					pstmt.setString(3, fileName);
					pstmt.setString(4, formattedDate);
					pstmt.setInt(5, userId);
					row = pstmt.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (pstmt != null) {
							pstmt.close();
						}
						if (conn != null) {
							conn.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			if (row < 1) {
				StringBuilder validCheck = new StringBuilder("");
				if (upName.isEmpty()) {
					validCheck.append("updateName");
				}else{
					validCheck.append("true");
				}
				forwardPage = "/WebContent/Customer/account-edit.jsp?error="
						+ validCheck;
			} else{
				forwardPage = "/WebContent/Customer/account-detail.jsp?update=true";
			}
			
			if (forwardPage != null) {
				// Redirect to the forwardPage using sendRedirect
				response.sendRedirect(request.getContextPath()
						+ forwardPage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public String getFileName(Part part) {
		String content = part.getHeader("content-disposition");
		if (!content.contains("filename=")) {
			return null;
		}
		int begin = content.indexOf("filename=") + 10;
		int end = content.length() - 1;
		String fi = content.substring(begin, end);
		String un = UUID.randomUUID().toString() + fi;
		return un;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doPost(request, response);
	}
}
