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
public class productUpdate extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int userId = Auth.check(request);
		String upId = request.getParameter("updateId");
		String upName = request.getParameter("pname");
		String upDescription = request.getParameter("pdescription");
		String upPrice = request.getParameter("pprice");
		String upCount = request.getParameter("pcount");
		String upCategory = request.getParameter("pcategory");
		String fileName = null;
		Part part = request.getPart("pphoto");

		// current date
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String formattedDate = dateFormat.format(currentDate);

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getDBConnection();
			pstmt = null;
			int row = 0;
			String forwardPage = null;
			if (!upName.isEmpty() && !upDescription.isEmpty()
					&& !upPrice.isEmpty() && !upCount.isEmpty()) {
				try {
					if (part.getSize() > 0) {
						fileName = getFileName(part);
						System.out.println("File name is" + fileName);
						String savePath = "D:\\Amono\\Amono\\WebContent\\images\\products"
								+ File.separator + fileName;
						part.write(savePath);
						String query = "update products set name=?,description=?,price=?,photo=?,count=?,category_id=?,updated_date=?,status=0 where id=?";
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, upName);
						pstmt.setString(2, upDescription);
						pstmt.setInt(3, Integer.parseInt(upPrice));
						pstmt.setString(4, fileName);
						pstmt.setInt(5, Integer.parseInt(upCount));
						pstmt.setInt(6, Integer.parseInt(upCategory));
						pstmt.setString(7, formattedDate);
						pstmt.setInt(8, Integer.parseInt(upId));
						row = pstmt.executeUpdate();
					} else {
						String query = "update products set name=?,description=?,price=?,count=?,category_id=?,updated_date=?,status=0 where id=?";
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, upName);
						pstmt.setString(2, upDescription);
						pstmt.setInt(3, Integer.parseInt(upPrice));
						pstmt.setInt(4, Integer.parseInt(upCount));
						pstmt.setInt(5, Integer.parseInt(upCategory));
						pstmt.setString(6, formattedDate);
						pstmt.setInt(7, Integer.parseInt(upId));
						row = pstmt.executeUpdate();
					}
					if (row < 1) {
						forwardPage = "/WebContent/Admin/product-edit.jsp?error=dberror";
					} else {
						forwardPage = "/WebContent/Admin/business.jsp?update=true";
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else{
				StringBuilder validCheck = new StringBuilder("");
				if (upName.isEmpty()) {
					validCheck.append("updateName");
				}
				if (upDescription.isEmpty()) {
					validCheck.append("updateDescription");
				}
				if (upPrice.isEmpty()) {
					validCheck.append("updatePrice");
				}
				if (upCount.isEmpty()) {
					validCheck.append("updateCount");
				}
				forwardPage = "/WebContent/Admin/product-edit.jsp?error="+validCheck;
				
			}

			if (forwardPage != null) {
				// Redirect to the forwardPage using sendRedirect
				response.sendRedirect(request.getContextPath() + forwardPage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
