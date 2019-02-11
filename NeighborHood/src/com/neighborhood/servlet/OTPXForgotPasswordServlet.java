package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * Servlet implementation class OTPXForgotPasswordServlet
 */
@WebServlet("/OTPXForgotPasswordServlet")
public class OTPXForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OTPXForgotPasswordServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession sess = request.getSession(false);
		if (sess == null) {
			sess = request.getSession();
		}

		String otp = (String) sess.getAttribute("otp"); // get session OTP
		String userOtp = (String) request.getParameter("otp");
		String password = (String) sess.getAttribute("password");
		String emailAddress = (String) sess.getAttribute("userEmail");

		if (userOtp.equals(otp)) {
			final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			Properties props = System.getProperties();
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.port", "465");
			props.setProperty("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.debug", "true");
			props.put("mail.store.protocol", "pop3");
			props.put("mail.transport.protocol", "smtp");
			
			MailSSLSocketFactory sf = null;
			try {
				sf = new MailSSLSocketFactory();
			} catch (GeneralSecurityException e1) {
				System.out.println("Error: " + e1);
			}
			sf.setTrustAllHosts(true); 
			props.put("mail.imaps.ssl.trust", "*");
			props.put("mail.imaps.ssl.socketFactory", sf);
			
			final String username = "vipulfootball9@gmail.com";
			final String pass = "vipul1895";
			try {
				Session session = Session.getDefaultInstance(props,
						new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(username,
										pass);
							}
						});
				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress("vipulfootball9@gmail.com"));
				msg.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(emailAddress, false));
				msg.setSubject("Team NeighborHood");
				msg.setText("Hello your password for NeighborHood is: "
						+ password + "\nRegards" + "\nNeighborHood Team");
				msg.setSentDate(new Date());
				Transport.send(msg);
				System.out.println("Message sent.");
			} catch (MessagingException e) {
				System.out.println("Error, cause: " + e);
			}
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		} else {
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