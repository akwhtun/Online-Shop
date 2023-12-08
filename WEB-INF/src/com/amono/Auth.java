package com.amono;

import java.io.IOException;

import javax.servlet.http.*;

public class Auth {

	public static Integer check(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		return userId;
	}
	
	
	public static void logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}
}
       