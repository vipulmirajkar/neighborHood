package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.sql.Connection;
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
import javax.xml.bind.DatatypeConverter;

import com.neighborhood.business.EmailVerification;
import com.neighborhood.model.Person;
import com.sun.mail.util.MailSSLSocketFactory;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	Connection conn = null;
	private static final long serialVersionUID = 1L;

	public Registration() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String emailAddress = request.getParameter("emailAddress");
		String location = request.getParameter("geocomplete");
		Long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
		String passwrd = request.getParameter("password");

		/* Encrypting password using BaseCode64 */
		byte[] password = passwrd.getBytes("UTF-8");
		String encoded = DatatypeConverter.printBase64Binary(password);
		System.out.println("Encoded message: " + encoded);
		
		String otp = "";

		Person person = new Person(); // POJO

		HttpSession sess = request.getSession(); // Creating session for
													// storing attributes

		person.setFirstName(firstName);
		person.setLastName(lastName);
		person.setEmailAddress(emailAddress);
		person.setLocation(location);
		person.setPhoneNumber(phoneNumber);
		person.setPassword(encoded);

		EmailVerification ev = new EmailVerification(); // Email Verification

		boolean checkEmail = ev.verifyEmail(emailAddress);

		if (checkEmail == true) {
			out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal('ERROR','User Already Registered, Please Log In !!!','error'); ");
			out.println("});");
			out.println("</script>");
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		} else {
			sess.setAttribute("user", person);
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
				String randomNum = Math.random() + "".toString();
				otp = randomNum.substring(randomNum.length() - 4,
						randomNum.length());
				System.out.println(otp);
				msg.setSubject("Team NeighborHood");
				msg.setText("Hello your OTP for NeighborHood is: " + otp
						+ "\nRegards" + "\nNeighborHood Team");
				msg.setSentDate(new Date());
				Transport.send(msg);
				System.out.println("Message sent.");
			} catch (MessagingException e) {
				System.out.println("Error, cause: " + e);
			}
			sess.setAttribute("otp", otp);
			sess.setAttribute("user", person);
			request.getRequestDispatcher("view/otp.jsp").include(request,
					response);
		}
	}
}