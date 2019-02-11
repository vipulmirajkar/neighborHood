package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neighborhood.business.RegisterDAO;
import com.neighborhood.model.Person;

//import com.scraft.business.RegisterDAO;

/**
 * Servlet implementation class OTPXServlet for checking OTP entered by user is
 * true or no and if true then store (register) person
 */
@WebServlet("/OTPXServlet")
public class OTPXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OTPXServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		}
		Person person = null;
		String otp = (String) session.getAttribute("otp"); // Getting OTP from
															// session
		String otpText = request.getParameter("otpInput"); // Getting input from
															// user
		RegisterDAO register = new RegisterDAO(); // Business DAO Logic
		System.out.println("Session otp: " + otp + " User otp: " + otpText);
		try {
			person = (Person) session.getAttribute("user"); // Getting person
															// from session
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		if (otp.equals(otpText)) {
			boolean status = register.registerPerson(person); // Registering
																// person
																// here
			if (status == true) { // Checking whether user is registered
				/*String errorMessage = "Registration Successful!! Please Login to continue.";
				request.setAttribute("errorMessage", errorMessage);*/
				out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal('SUCCESS','Registration Successful!! Please Login to continue.','success'); ");
				out.println("});");
				out.println("</script>");
				request.getRequestDispatcher("view/login.jsp").include(request,
						response);
			} else {
				/*String errorMessage = "Oops something went wrong!! Try again.";
				request.setAttribute("errorMessage", errorMessage);*/
				out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal('Error','Oops something went wrong!! Try again.','error'); ");
				out.println("});");
				out.println("</script>");
				request.getRequestDispatcher("view/index.jsp").include(request,
						response);
			}
		} else {
			/*String errorMessage = "You entered wrong OTP !!";
			request.setAttribute("errorMessage", errorMessage);*/
			out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal('Error','You entered wrong OTP !!','error'); ");
			out.println("});");
			out.println("</script>");
			request.getRequestDispatcher("view/index.jsp").include(request,
					response);
		}
	}
}