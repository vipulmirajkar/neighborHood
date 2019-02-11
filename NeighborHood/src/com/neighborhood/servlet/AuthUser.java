package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neighborhood.business.LoginDAO;
import com.neighborhood.model.AuthBean;

/**
 * Servlet implementation class AuthUser used for authenticating user for
 * logging into his/her account with cookies
 */
@WebServlet("/AuthUser")
public class AuthUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthUser() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if (action == null) {
			AuthBean user = checkCookie(request);
			if (user == null) {
				RequestDispatcher dispatch = request
						.getRequestDispatcher("view/login.jsp");
				dispatch.include(request, response);
			} else {
				LoginDAO checkLogin = new LoginDAO();

				boolean status = checkLogin.authUser(user);

				if (status) {
					session.setAttribute("user", user.getEmailAddress());
					RequestDispatcher dispatch = request
							.getRequestDispatcher("view/categories.jsp");
					dispatch.include(request, response);
				} else {
					RequestDispatcher dispatch = request
							.getRequestDispatcher("view/login.jsp");
					dispatch.include(request, response);
				}
			}
		}
	}

	// method for checking cookies
	private AuthBean checkCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		AuthBean user = null;
		if (cookies == null)
			return null;
		else {
			String emailAddress = "";
			String password = "";
			for (Cookie ck : cookies) {
				if (ck.getName().equalsIgnoreCase("emailAddress"))
					emailAddress = ck.getValue();
				if (ck.getName().equalsIgnoreCase("password"))
					password = ck.getValue();
			}
			if (!emailAddress.isEmpty() && !password.isEmpty())
				user = new AuthBean(emailAddress, password);
		}
		return user;
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String emailAddress = "";
		String password = "";
		boolean rememberMe = false;
		PrintWriter out = response.getWriter();

		AuthBean authUser = new AuthBean();

		LoginDAO authenticate = new LoginDAO();

		if (action == null) {
			emailAddress = request.getParameter("emailAddress").trim();
			password = request.getParameter("password").trim();
			rememberMe = request.getParameter("remember") != null;

			System.out.println("remember me: " + rememberMe);

			authUser.setEmailAddress(emailAddress);
			authUser.setPassword(password);

			boolean status = authenticate.authUser(authUser);

			if (status == true) {
				HttpSession session = request.getSession();
				session.setAttribute("user", emailAddress);
				if (rememberMe) {
					Cookie emailAddressCookie = new Cookie("emailAddress",
							emailAddress);
					emailAddressCookie.setMaxAge(3600);
					response.addCookie(emailAddressCookie);
					Cookie passwordCookie = new Cookie("password", password);
					emailAddressCookie.setMaxAge(3600);
					response.addCookie(passwordCookie);
				}
				request.getRequestDispatcher("view/categories.jsp").forward(
						request, response);
			} else {
				/*
				 * String errorMessage = "Invalid Credentials, Try again !!!";
				 * request.setAttribute("errorMessage", errorMessage);
				 */
				out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal('ERROR','Invalid Credentials, Try again !!!','error'); ");
				out.println("});");
				out.println("</script>");
				request.getRequestDispatcher("view/login.jsp").include(request,
						response);
			}
		}
	}
}