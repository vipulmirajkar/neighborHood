<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NeighborHood - Place Order</title>
<style type="text/css">
/****** Main portfilio styling ********/
.main-iso .item {
	text-align: center;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("user") == null) {
			session.setAttribute("errorMessage",
					"Please Log in to continue");
			response.sendRedirect(request.getContextPath()
					+ "/view/login.jsp");
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<hr />
	<div class="container">
	<h3 align="center">Rent</h3>
		<h4 align="center">Why spend excessively when you can rent..</h4>
		<hr />
	</div>
	<div class="container">
		<div class="main-iso">
			<%
				int getproductId = Integer.parseInt(request.getParameter("id"));
				try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					String query = "select * from products where p_id = "
							+ getproductId + "";
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/neighborhood", "root", "");
					Statement statement = con.createStatement();
					ResultSet result = statement.executeQuery(query);
					while (result.next()) {
						int productId = Integer.parseInt(result.getString("p_id"));
						String productName = result.getString("product_name");
						String productDescription = result
								.getString("product_description");
						int productRate = Integer
								.parseInt(result.getString("rate"));
						String fileName = result.getString("image_name");
			%>
			<%
				session.setAttribute("productName", productName);
						String rate = Integer.toString(productRate);
						session.setAttribute("productRate", rate);
			%>
			<div class="item">
				<img src="<%=request.getContextPath()%>/productimages/<%=fileName%>"
					style="width: 100px; height: 150px;" alt="Bag Image">
				<h6 align="center">
					Name:-
					<%=productName%></h6>
				<h6 align="center">
					Description:-
					<%=productDescription%></h6>
				<h6 align="center">
					Rate:-
					<%=productRate%>
					(Per Day)
				</h6>
			</div>
			<hr />
			<div class="container">
				<form method="post" action="<%=request.getContextPath()%>/order">
					<div class="col-md-6 offset-3">
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-calendar"></i>
								</span>
							</div>
							<input name="startDate" class="form-control"
								placeholder="Start Date" type="date" required="required">
						</div>
						<!-- form-group// -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-calendar"></i>
								</span>
							</div>
							<input name="endDate" class="form-control" placeholder="End Date"
								type="date" required="required">
						</div>
						<div class="form-group">
							<button type="submit" id="find" class="btn btn-dark btn-block">Place
								Order</button>
						</div>
					</div>
				</form>
			</div>
			<%
				}
				} catch (Exception e) {
					System.out.print("Error " + e);
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>