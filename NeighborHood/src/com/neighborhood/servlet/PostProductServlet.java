package com.neighborhood.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.neighborhood.business.PostProductDAO;
import com.neighborhood.model.Product;

/**
 * Servlet implementation class PostProductServlet for inserting a product in
 * database using PostProductDAO class for inserting product in database
 */
@WebServlet("/PostProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class PostProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostProductServlet() {
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
		String userEmail = (String) session.getAttribute("user");

		String category = request.getParameter("category");
		String subCategory = request.getParameter("subCategory");
		String productName = request.getParameter("productName");
		String productDescription = request.getParameter("productDescription");
		int productRate = Integer.parseInt(request.getParameter("productRate"));
		String address = request.getParameter("productAddress");

		Part part = request.getPart("productImage");
		String fileName = extractFileName(part);
		String savePath = "E:\\Java Practice Programs\\NeighborHood\\WebContent\\productimages"
				+ File.separator + fileName;
		@SuppressWarnings("unused")
		File fileSaveDirectory = new File(savePath);

		part.write(savePath + File.separator);

		Product product = new Product(); // POJO class
		product.setEmailAddress(userEmail);
		product.setCategory(category);
		product.setSubCategory(subCategory);
		product.setProductName(productName);
		product.setProductDescription(productDescription);
		product.setProductRate(productRate);
		product.setAddress(address);
		product.setImageName(fileName);
		product.setProductImage(savePath);

		PostProductDAO postProduct = new PostProductDAO(); // DAO Class for
															// posting product

		boolean checkProductStatus = postProduct.postProduct(product);

		if (checkProductStatus == true) {
			out.println("<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal('POSTED','Posted Product Successfully !!!','success'); ");
			out.println("});");
			out.println("</script>");
			request.getRequestDispatcher("view/postproduct.jsp").include(
					request, response);
		} else {
			out.println("Sorrry, Try again later !!");
		}
	}

	/* Getting file name */
	private String extractFileName(Part part) {
		String contentDisplay = part.getHeader("content-disposition");
		String[] items = contentDisplay.split(";");
		for (String str : items) {
			if (str.trim().startsWith("filename")) {
				return str.substring(str.indexOf("=") + 2, str.length() - 1);
			}
		}
		return "";
	}
}