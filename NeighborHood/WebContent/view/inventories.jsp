<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NeighborHood - My Products</title>
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
	<div class="container">
		<hr />
		<h4 align="center">Your Inventories</h4>
		<hr />
	</div>
	<div class="container">
		<div class="main-iso">
		<%
			String user = (String) session.getAttribute("user");
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				String query = "select * from products where emailaddress = '"
						+ user + "'";
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
			<img src="<%=request.getContextPath()%>/productimages/<%=fileName%>"
				style="width: 150px; height: 150px;" alt="Bag Image">
			<h6 align="center">
				Name:-
				<%=productName%></h6>
			<h6 align="center">
				Rate:-
				<%=productRate%>
				(Per Day)
			</h6>
		</div>
		<hr />
		<%
			}
			} catch (Exception e) {
				System.out.println("Error " + e);
			}
		%>
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>