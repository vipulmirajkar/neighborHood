package com.neighborhood.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutServlet for Logging out a user &
 * destroying his session
 */
@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogOutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			// Clearing cookies from browser after successful log out
			Cookie[] cookies = request.getCookies();
			for (Cookie ck : cookies) {
				if (ck.getName().equalsIgnoreCase("emailAddress")) {
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
				if (ck.getName().equalsIgnoreCase("password")) {
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
			// Removing session
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			response.setDateHeader("Expires", -1);
			session.removeAttribute("user");
			session.invalidate();
		}
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("view/login.jsp");
		dispatcher.forward(request, response);
	}
}