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
public class completeBusinessDetailRegister extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
	
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Integer authRoleId = (Integer) session.getAttribute("userRole");

		
			System.out.println("comldsfla fv dfasjfa dfjas sdjflk f");
			String businessName = request.getParameter("businessName").trim();
			String businessDescription = request.getParameter(
					"businessDescription").trim();
			
			// for image logo
			Part part = request.getPart("logo");
			
			// current date
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String formattedDate = dateFormat.format(currentDate);

			// set cookie to business detail registration value
			Cookie cbname = new Cookie("businessName", businessName);
			response.addCookie(cbname);
			Cookie cbdes = new Cookie("businessDescription",
					businessDescription);
			response.addCookie(cbdes);

			Connection conn=null;
			PreparedStatement pstmt = null;
			try {
				conn = DBUtil.getDBConnection();
				int row = 0;
				String forwardPage = null;
				String temp_user_id = null;
				if (!businessName.isEmpty() && !businessDescription.isEmpty()
						&& part.getSize() > 0) {
					
					String fileName = getFileName(part);
					System.out.println("File name is" + fileName);
					String savePath = "D:\\Amono\\Amono\\WebContent\\images\\businessLogoes"
							+ File.separator + fileName;
					part.write(savePath);
					try {
						System.out.println("Inserting into database");
						
						//get temp_user_id from cookie
						Cookie[] cookies = request.getCookies();
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								if (cookie.getName().equals("temp_user_id"))
									temp_user_id = cookie.getValue();
								
							}
						}
						String query = "insert into businesses (user_id, business_name, description,logo, created_date,updated_date) values (?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(query);
						pstmt.setInt(1, Integer.parseInt(temp_user_id));
						pstmt.setString(2, businessName);
						pstmt.setString(3, businessDescription);
						pstmt.setString(4, fileName);
						pstmt.setString(5, formattedDate);
						pstmt.setString(6, formattedDate);
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
				} else {
					forwardPage = "/WebContent/Admin/busines.jsp";
				}
				if (row < 1) {
					StringBuilder validCheck = new StringBuilder("");
					if (businessName.isEmpty()) {
						validCheck.append("businessName");
					}
					if (businessDescription.isEmpty()) {
						validCheck.append("businessDescription");
					}
					if (part.getSize()==0) {
						validCheck.append("businessLogo");
					}
					if (!businessName.isEmpty()
							&& !businessDescription.isEmpty()
							&& part.getSize()>0) {
						validCheck.append("true");
					}
					forwardPage = "/WebContent/Admin/business-complete.jsp?error="
							+ validCheck;
				} else {
					Cookie businessId = new Cookie("business_id", "authBusiness");
					businessId.setMaxAge(60*60*60);
					response.addCookie(businessId);
					forwardPage = "/WebContent/Admin/business.jsp";
				}
				if (forwardPage != null) {
					// Redirect to the forwardPage using sendRedirect
					response.sendRedirect(request.getContextPath()
							+ forwardPage);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doPost(request, response);
	}
}
