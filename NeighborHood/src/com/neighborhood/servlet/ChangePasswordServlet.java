package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import com.neighborhood.business.ChangePasswordDAO;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePasswordServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession sess = request.getSession(); // Creating session for storing
													// attributes
		String emailAddress = (String) sess.getAttribute("user");
		String passwrd = request.getParameter("password");
		String oldPassword = request.getParameter("oldPassword");

		ChangePasswordDAO updatePassword = new ChangePasswordDAO(); // Instance
																	// of DAO
																	// class

		String getOldPassword = updatePassword.getOldPassword(emailAddress);

		if (oldPassword.equals(getOldPassword)) {
			/* Encrypting password using BaseCode64 */
			byte[] password = passwrd.getBytes("UTF-8");
			String encoded = DatatypeConverter.printBase64Binary(password);
			String decodedPassword = new String(encoded);
			System.out.println("Encoded password: " + decodedPassword);

			boolean checkUpdate = updatePassword.changePassword(emailAddress,
					decodedPassword);

			if (checkUpdate == true) {
				out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal('UPDATED','Updated Password Successfully !!!','success'); ");
				out.println("});");
				out.println("</script>");
				request.getRequestDispatcher("view/categories.jsp").include(
						request, response);
			} else {
				out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal('ERROR','Error in updating password, Try again!!!','error'); ");
				out.println("});");
				out.println("</script>");
				request.getRequestDispatcher("view/profile.jsp").include(
						request, response);
			}
		} else {
			out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal('ERROR','Old password incorrect, Try again!!!','error'); ");
			out.println("});");
			out.println("</script>");
			request.getRequestDispatcher("view/profile.jsp").include(
					request, response);
		}
	}
}