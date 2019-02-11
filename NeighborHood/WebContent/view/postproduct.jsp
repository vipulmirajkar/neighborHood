<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Neighborhood - Post Product</title>

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/favicon/favicon.ico"
	rel="icon">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/layon.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
					<li class="nav-item "><a class="nav-link active"
						href="<%=request.getContextPath()%>/view/postproduct.jsp.jsp">Lend</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown07"
						data-toggle="dropdown" aria-haspopup="true" href=""
						aria-expanded="false">Account</a>
						<div class="dropdown-menu" aria-labelledby="dropdown07">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/view/summary.jsp">My
								Orders</a> <a class="dropdown-item"
								href="<%=request.getContextPath()%>/view/inventories.jsp">Inventories</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/view/profile.jsp">Profile</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/logout">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<div class="container">
		<hr />
		<h4 align="center">Lend</h4>
		<h5 align="center">Every unused belonging is an asset..</h5>
		<hr />
	</div>
	<form action="<%=request.getContextPath()%>/product" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<div class="form-group input-group">
					<select name="category" required
						onchange="showSubCategory(this.value)">
						<option value="">Select Category</option>
						<%
							try {
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								String query = "select * from categories";
								Connection con = DriverManager.getConnection(
										"jdbc:mysql://localhost:3306/neighborhood", "root", "");
								Statement statement = con.createStatement();
								ResultSet result = statement.executeQuery(query);
								while (result.next()) {
						%>
						<option value="<%=result.getString("c_id")%>"><%=result.getString("category_name")%></option>
						<%
							}
							} catch (Exception e) {
								System.out.print("Error " + e);
							}
						%>
					</select>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<select name="subCategory" id="subCategory" required>
						<option value="-1">Select Sub Category</option>
					</select>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<input name="productName" class="form-control" required
						placeholder="Product Name" type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<textarea class="form-control" name="productDescription" required
						placeholder="Product description"></textarea>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<input name="productRate" class="form-control" required
						placeholder="Product Rate (Per day)" type="text">
				</div>
				<!-- form-group end.// -->
				<div class="form-group input-group">
					<input class="form-control" name="productAddress" required
						placeholder="Address" type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<input class="form-control" name="productImage" required
						type="file">
				</div>
				<!-- form-group// -->
				<div class="form-group">
					<button type="submit" id="find" class="btn btn-dark btn-block">Post
						Product</button>
				</div>
				<!-- form-group// -->
			</article>
		</div>
	</form>
	<!--Footer-->
	<div class="text-lg-center"
		style="color: #fff; background-color: #17a2b8; min-height: 50px; padding: 20px;">
		<h3>NeighborHood</h3>
		<p>
			<strong>Rent anything, right from your neighbourhood!</strong>
		</p>
		<p>&copy;2018 neighborhood Inc.</p>
	</div>
	<!--container end.//-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-slim.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
	var xmlHttp;
	function showSubCategory(str) {
		if (typeof XMLHttpRequest !== "undefined") {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp == null) {
			alert("Browser doesn't support XMLHTTP");
			return;
		}
		var url = "<%=request.getContextPath()%>/view/subcategory.jsp";
			url += "?count=" + str;
			xmlHttp.onreadystatechange = stateChange;
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}
		function stateChange() {
			if (xmlHttp.readyState === 4 || xmlHttp.readyState == "complete") {
				document.getElementById("subCategory").innerHTML = xmlHttp.responseText;
			}
		}
	</script>
</body>
</html>