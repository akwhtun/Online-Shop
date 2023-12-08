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
public class productAdd extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String productName = request.getParameter("productName");
		String productCategoryId = request.getParameter("productCategory");
		String productPrice = request.getParameter("productPrice");
		String productCount = request.getParameter("productCount");
		String productDescription = request.getParameter("productDescription");
		String businessId = request.getParameter("businessId");
		int status = 0;

		// set form value to cookie
		Cookie pname = new Cookie("pname", productName);
		response.addCookie(pname);
		Cookie pprice = new Cookie("pprice", productPrice);
		response.addCookie(pprice);
		Cookie pcount = new Cookie("pcount", productCount);
		response.addCookie(pcount);
		Cookie pdescription = new Cookie("pdescription", productDescription);
		response.addCookie(pdescription);
		

		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		String forward = null;
		// current date
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String formattedDate = dateFormat.format(currentDate);

		// for product photo
		Part part = request.getPart("productPhoto");

		try {
			if (!productName.isEmpty() && !productPrice.isEmpty()
					&& !productCount.isEmpty() && part.getSize() > 0
					&& !productDescription.isEmpty()) {
				conn = DBUtil.getDBConnection();

				String fileName = getFileName(part);
				String savePath = "D:\\Amono\\Amono\\WebContent\\images\\products"
						+ File.separator + fileName;
				part.write(savePath);

				String query = "insert into products (business_id, category_id, name, description, price, photo, count, status, created_date, updated_date) values (?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(query);

				pstmt.setInt(1, Integer.parseInt(businessId));
				pstmt.setInt(2, Integer.parseInt(productCategoryId));
				pstmt.setString(3, productName);
				pstmt.setString(4, productDescription);
				pstmt.setString(5, productPrice);
				pstmt.setString(6, fileName);
				pstmt.setString(7, productCount);
				pstmt.setInt(8, status);
				pstmt.setString(9, formattedDate);
				pstmt.setString(10, formattedDate);
				row = pstmt.executeUpdate();
				if (row < 1) {
					if (!productName.isEmpty() && !productDescription.isEmpty()
							&& !productPrice.isEmpty() && part.getSize() > 0
							&& !productCount.isEmpty()) {
						forward = "/WebContent/Admin/product-add-page.jsp?error=dberror";
					}

				} else {
					forward = "/WebContent/Admin/business.jsp?productadd=true";
				}
			} else {
				StringBuilder validCheck = new StringBuilder("");
				if (productName.isEmpty()) {
					validCheck.append("ProductName");
				}
				if (productDescription.isEmpty()) {
					validCheck.append("ProductDescription");
				}
				if (productPrice.isEmpty()) {
					validCheck.append("ProductPrice");
				}
				if (part.getSize() == 0) {
					validCheck.append("ProductPhoto");
				}
				if (productCount.isEmpty()) {
					validCheck.append("ProductCount");
				}

				forward = "/WebContent/Admin/product-add-page.jsp?error="
						+ validCheck;
			}
			if (forward != null) {
				// Redirect to the forwardPage using sendRedirect
				response.sendRedirect(request.getContextPath() + forward);
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
