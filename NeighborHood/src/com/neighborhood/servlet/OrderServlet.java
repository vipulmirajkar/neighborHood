package com.neighborhood.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.neighborhood.business.OrderDAO;
import com.neighborhood.model.Order;
import com.sun.mail.util.MailSSLSocketFactory;

/**
 * Servlet implementation class OrderServlet for placing order
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session == null) {
			request.getRequestDispatcher("view/index.jsp").include(request,
					response);
		}
		String productName = (String) session.getAttribute("productName");
		String productRate = (String) session.getAttribute("productRate");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		Date parsedStartDate = new Date();
		Date parsedEndDate = new Date();
		java.sql.Date sqlStartDate = null;
		java.sql.Date sqlEndDate = null;
		int rate = Integer.parseInt(productRate);

		/* Getting date formatting and parsing it */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			parsedStartDate = sdf.parse(startDate);
			parsedEndDate = sdf.parse(endDate);
			sqlStartDate = new java.sql.Date(parsedStartDate.getTime());
			sqlEndDate = new java.sql.Date(parsedEndDate.getTime());
		} catch (ParseException e) {
			System.out.println("Error in parsing: " + e);
		}
		String emailaddress = (String) session.getAttribute("user");

		Order order = new Order();
		order.setEmailAddress(emailaddress);
		order.setProductName(productName);
		order.setStartDate(sqlStartDate);
		order.setEndDate(sqlEndDate);
		order.setRate(rate);

		OrderDAO placeRequest = new OrderDAO();
		boolean status = placeRequest.placeOrder(order);

		if (status == true) {
			out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal('Order Placed','Please check your mail box for details !!!','success'); ");
			out.println("});");
			out.println("</script>");
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
			
			final String username = "vipulfootball9@gmail.com";//
			final String pass = "vipul1895";
			try {
				Session sess = Session.getDefaultInstance(props,
						new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(username,
										pass);
							}
						});
				Message msg = new MimeMessage(sess);
				msg.setFrom(new InternetAddress("vipulfootball9@gmail.com"));
				msg.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(emailaddress, false));
				msg.setSubject("Team NeighborHood");
				msg.setText("Hello your Order for: "
						+ productName
						+ " is placed Successfully !! \nOur Team will contact you within 2-3 hours"
						+ "\nRegards" + "\nNeighborHood Team");
				msg.setSentDate(new Date());
				Transport.send(msg);
				System.out.println("Message sent.");
			} catch (MessagingException e) {
				System.out.println("Error, cause: " + e);
			}
			request.getRequestDispatcher("view/categories.jsp").include(
					request, response);
		}
	}
}