<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<title>NeighborHood - Header</title>
<!-- Favicons -->
<link href="<%=request.getContextPath() %>/favicon/favicon.ico" rel="icon">
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
		<div class="container">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/view/index.jsp">NEIGHBORHOOD</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample07" aria-controls="navbarsExample07"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarsExample07">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/view/categories.jsp">Categories<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/view/postproduct.jsp">Lend</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown07"
						data-toggle="dropdown" href="" aria-haspopup="true" aria-expanded="false">Account</a>
						<div class="dropdown-menu" aria-labelledby="dropdown07">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/view/summary.jsp">My Orders</a> <a
								class="dropdown-item" href="<%=request.getContextPath()%>/view/inventories.jsp">Inventories</a> <a
								class="dropdown-item" href="<%=request.getContextPath()%>/view/profile.jsp">Profile</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/logout">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
</body>
</html>