<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NeighborHood - My Orders</title>
<style type="text/css">
/****** Main portfilio styling ********/
.main-iso .item {
	text-align: center;
}

body {
	counter-reset: Serial; /* Set the Serial counter to 0 */
}

table {
	border-collapse: separate;
}

tr td:first-child:before {
	counter-increment: Serial; /* Increment the Serial counter */
	content: " " counter(Serial); /* Display the counter */
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
	<div class="container">
		<hr />
		<h4 align="center">Your Orders</h4>
		<hr />
	</div>
	<div class="container">
		<div class="main-iso">
			<table class="table table-striped-bordered-hover table-dark">
				<thead>
					<tr>
						<th scope="col">Serial Number</th>
						<th scope="col">Product Name</th>
						<th scope="col">Product Rate</th>
					</tr>
				</thead>
				<%
					String user = (String) session.getAttribute("user");
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						String query = "select * from orders where emailaddress = '"
								+ user + "'";
						Connection con = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/neighborhood", "root", "");
						Statement statement = con.createStatement();
						ResultSet result = statement.executeQuery(query);
						while (result.next() == true) {
							String productName = result.getString("product_name");
							int productRate = Integer
									.parseInt(result.getString("rate"));
				%>
				<tbody>
					<tr>
						<td></td>
						<td><%=productName%></td>
						<td><%=productRate%> Rs.</td>
					</tr>
				</tbody>
				<%
						}
					} catch (Exception e) {
						System.out.print("Error " + e);
					}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>