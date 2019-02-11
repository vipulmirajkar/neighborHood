<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<title>NeighborHood - Footer</title>
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
	<div class="text-lg-center"
		style="color: #fff; background-color: #17a2b8; min-height: 50px; padding: 20px;">
		<h3>NeighborHood</h3>
		<p>
			<strong>Rent anything, right from your neighbourHood! </strong>
		</p>
		<p>&copy;2018 neighborhood Inc.</p>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>