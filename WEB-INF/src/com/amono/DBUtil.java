package com.amono;

import java.sql.*;

public class DBUtil {
	private static final String URL = "jdbc:mysql://localhost/amono";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	
	public static Connection getDBConnection() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
