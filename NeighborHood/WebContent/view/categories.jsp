<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>NeighborHood - Categories</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	
<!-- Favicons -->
<link href="<%=request.getContextPath() %>/favicon/favicon.ico" rel="icon">

<style type="text/css">
/****** Navigation styling *******/
.iso-nav {
	text-align: center;
}

/****** Main portfilio styling ********/
.main-iso .item {
	width: 303px;
	padding-left: 90px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/view/index.jsp">NEIGHBORHOOD</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample07" aria-controls="navbarsExample07"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarsExample07">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/view/categories.jsp">Categories<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/view/postproduct.jsp">Lend</a></li>
					<li class="nav-item dropdown"><a href=""
						class="nav-link dropdown-toggle" id="dropdown07" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Account</a>
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
	<%
		if (session.getAttribute("user") == null) {
			session.setAttribute("errorMessage",
					"Please Log in to continue");
			response.sendRedirect(request.getContextPath()
					+ "/view/login.jsp");
		}
	%>
	<br />
	<h6 align="center">Welcome</h6>
	<h6 align="center">
		<%
			String user = (String) session.getAttribute("user");
			out.print(user);
		%>
	</h6>
	<div class="container">
		<hr />
	</div>
	<div class="wraper">
		<div class="iso-nav">
			<button class="btn btn-dark" data-filter="*">All Categories</button>
			<button class="btn btn-info" data-filter=".daily">Daily
				Needs</button>
			<button class="btn btn-dark" data-filter=".weekly">Weekly
				Needs</button>
			<button class="btn btn-info" data-filter=".long">Long Needs</button>
		</div>

		<div class="container">
			<hr />
		</div>
		<div class="container">
			<div class="main-iso">
				<div class="item daily">
					<a href="<%=request.getContextPath()%>/view/bags.jsp"><img
						src="<%=request.getContextPath()%>/images/bags.png"
						style="width: 256px; height: 256px;" alt=""></a>
					<h6 align="center">Bags</h6>
				</div>
				<div class="item daily">
					<a href="<%=request.getContextPath()%>/view/clothes.jsp"><img
						src="<%=request.getContextPath()%>/images/clothes.png"
						style="width: 256px; height: 256px;" alt=""></a>
					<h6 align="center">Clothes</h6>
				</div>
				<div class="item weekly">
					<a href="<%=request.getContextPath()%>/view/hardware.jsp"><img
						src="<%=request.getContextPath()%>/images/hardware.png" alt=""></a>
					<h6 align="center">Hardware</h6>
				</div>
				<div class="item long">
					<a href="<%=request.getContextPath()%>/view/realestate.jsp"><img
						src="<%=request.getContextPath()%>/images/real_estate.png" alt=""></a>
					<h6 align="center">Real Estate</h6>
				</div>
				<div class="item weekly">
					<a href="<%=request.getContextPath()%>/view/gamingconsole.jsp"><img
						src="<%=request.getContextPath()%>/images/gaming_consoles.png"
						alt=""></a>
					<h6 align="center">Gaming Consoles</h6>
				</div>
				<div class="item weekly">
					<a href="<%=request.getContextPath()%>/view/books.jsp"><img
						src="<%=request.getContextPath()%>/images/books.png" alt=""></a>
					<h6 align="center">Books</h6>
				</div>
				<div class="item long">
					<a href="<%=request.getContextPath()%>/view/vehicles.jsp"><img
						src="<%=request.getContextPath()%>/images/vehicles.png" alt=""></a>
					<h6 align="center">Vehicles</h6>
				</div>
				<div class="item weekly">
					<a href="<%=request.getContextPath()%>/view/appliances.jsp"><img
						src="<%=request.getContextPath()%>/images/appliances.png" alt=""
						style="width: 256px; height: 256px;"></a>
					<h6 align="center">Appliances</h6>
				</div>
				<div class="item long">
					<a href="<%=request.getContextPath()%>/view/furniture.jsp"><img
						src="<%=request.getContextPath()%>/images/furniture.png" alt=""></a>
					<h6 align="center">Furniture</h6>
				</div>
			</div>
		</div>
	</div>
	
	<hr/>
	
	<div class="text-lg-center"
		style="color: #fff; background-color: #17a2b8; min-height: 50px; padding: 20px;">
		<h3>NeighborHood</h3>
		<p>
			<strong>Rent anything, right from your neighbourhood! </strong>
		</p>
		<p>&copy;2018 neighborhood Inc.</p>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<!--isotope here...-->
	<script src="<%=request.getContextPath()%>/js/isotope.pkgd.min.js"></script>
	<!--Custom Js file here ... -->
	<script type="text/javascript">
		$('.main-iso').isotope({
			itemSelector : '.item',
			layoutMode : 'fitRows'
		});
		// Isotope click function
		$('.iso-nav button').click(function() {
			$('.iso-nav button').removeClass('active');
			$(this).addClass('active');

			var selector = $(this).attr('data-filter');
			$('.main-iso').isotope({
				filter : selector
			});
			return false;
		});
	</script>
</body>
</html>