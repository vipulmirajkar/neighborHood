<%@page import="java.util.Date"%>
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
<title>NeighborHood - Clothes</title>
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
		<h4 align="center">Clothes</h4>
		<hr />
	</div>
	<div class="container">
		<div class="main-iso">
			<%
				/* Getting date formatting and parsing it */
				Date date = new Date();
				java.sql.Date sqlDate = null;
				try {
					sqlDate = new java.sql.Date(date.getTime());
				} catch (Exception e) {
					System.out.println("Error in parsing: " + e);
				}

				try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					String query = "SELECT * FROM products AS r WHERE r.category = 2 AND r.p_id NOT IN(SELECT m.p_id FROM orders AS b JOIN orders_map AS m ON b.o_id = m.o_id WHERE b.start_date <='"
							+ sqlDate + "' AND b.end_date >='" + sqlDate + "')";
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/neighborhood", "root", "");
					Statement statement = con.createStatement();
					ResultSet result = statement.executeQuery(query);
					while (result.next()) {
						int productId = Integer.parseInt(result.getString("p_id"));
						String productName = result.getString("product_name");
						int productRate = Integer
								.parseInt(result.getString("rate"));
						String fileName = result.getString("image_name");
			%>
			<div class="item">
				<a
					href="<%=request.getContextPath()%>/view/orders.jsp?id=<%=productId%>"><img
					src="<%=request.getContextPath()%>/productimages/<%=fileName%>"
					style="width: 100px; height: 150px;" alt="Bag Image"></a>
				<h6 align="center"><%=productName%></h6>
				<h6 align="center"><%=productRate%></h6>
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