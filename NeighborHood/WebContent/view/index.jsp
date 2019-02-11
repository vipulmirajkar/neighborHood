<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>NeighborHood - Home</title>
<!-- Favicons -->
<link href="<%=request.getContextPath() %>/favicon/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="<%=request.getContextPath()%>/css/animate.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- Main Stylesheet File -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">

<!-- =======================================================
    Author: Vipul Mirajkar Dev
    License: https://thevipulm.appspot.com/
  ======================================================= -->
</head>
<body>

	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">NeighborHood</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="<%=request.getContextPath()%>/view/login.jsp">LogIn</a></li>
					<li><a
						href="<%=request.getContextPath()%>/view/registration.jsp">Sign
							Up</a></li>
					<li><a href="#services">Contact Us</a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->
	<section id="intro">
		<div class="intro-container">
			<div id="introCarousel" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="<%=request.getContextPath()%>/images/carousel/hero.jpg"
								alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Welcome To NeighborHood!</h2>
								<p>Rent anything, right from your Neighbourhood.</p>
								<a href="<%=request.getContextPath()%>/view/login.jsp" class="btn-get-started scrollto">Get
									Started</a>
								<%-- <%=(request.getAttribute("errorMessage") == null)
					? ""
					: request.getAttribute("errorMessage")%> --%>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="<%=request.getContextPath()%>/images/carousel/home.jpg"
								alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Easy Homes</h2>
								<p>Don't wait to rent Homes as, per your needs.</p>
								<a href="<%=request.getContextPath()%>/view/login.jsp" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="<%=request.getContextPath()%>/images/carousel/cars.jpg"
								alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Rent Cars</h2>
								<p>The cars we drive, say a lot about us!</p>
								<a href="<%=request.getContextPath()%>/view/login.jsp" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="<%=request.getContextPath()%>/images/carousel/bag.jpg"
								alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Carry Bags</h2>
								<p>Don't cry rent a bag, and get over it.</p>
								<a href="<%=request.getContextPath()%>/view/login.jsp" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img
								src="<%=request.getContextPath()%>/images/carousel/books.jpg"
								alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Read Books</h2>
								<p>There is no friend as loyal as book.</p>
								<a href="<%=request.getContextPath()%>/view/login.jsp" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#introCarousel" role="button"
					data-slide="prev"> <i class="fa fa-chevron-left"
					aria-hidden="true"></i> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#introCarousel"
					role="button" data-slide="next"> <i class="fa fa-chevron-right"
					aria-hidden="true"></i> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- #intro -->

	<main id="main"> <!--==========================
      About Us Section
    ============================-->
	<section id="about">
		<div class="container">

			<header class="section-header">
				<h3>What We Do?</h3>
				<p>
					<strong>It's pretty simple! We connect the lenders with
						the renters to encourage the business of renting products and
						commodities in the same neighbourhood.</strong>
				</p>
			</header>

			<div class="row about-cols">

				<div class="col-md-4 wow fadeInUp">
					<div class="about-col">
						<div class="img">
							<img
								src="<%=request.getContextPath()%>/images/about-mission.jpg"
								alt="" class="img-fluid">
							<div class="icon">
								<i class="fa fa-list" aria-hidden="true"></i>
							</div>
						</div>
						<h2 class="title">
							<a href="#">Select a category</a>
						</h2>
						<p>Choose a category to which your product belongs to</p>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
					<div class="about-col">
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/about-plan.jpg"
								alt="" class="img-fluid">
							<div class="icon">
								<i class="fa fa-file-text-o" aria-hidden="true"></i>
							</div>
						</div>
						<h2 class="title">
							<a href="#">Fill out a form</a>
						</h2>
						<p>Provide a few pictures, quote the renting value, a brief
							and crisp description and availability.</p>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
					<div class="about-col">
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/about-vision.jpg"
								alt="" class="img-fluid">
							<div class="icon">
								<i class="fa fa-bell-o" aria-hidden="true"></i>
							</div>
						</div>
						<h2 class="title">
							<a href="#">Get notified</a>
						</h2>
						<p>You'll get a notification on your mobile number if any
							neighbour is interested in your product.</p>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- #about --> <!--==========================
    Footer
  ============================--> <footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">About
									us</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Contact
									US</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="<%=request.getContextPath()%>/view/login.jsp">LOGIN</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="<%=request.getContextPath()%>/view/registration.jsp">SIGN
									UP</a></li>
						</ul>
					</div>

					<div class="col-lg-6 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							New Balaji Nagar, <br> Ambernath, Mumbai, <br> India <br>
							<strong>Phone:</strong> +91 96655 96907<br> <strong>Email:</strong>
							thevipulmirajkar@gmail.com<br>
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">&copy; Copyright. All Rights Reserved</div>
			<div class="credits">
				Designed by <a href="https://bootstrapmade.com/">VipulMirajkar</a>
			</div>
		</div>
	</footer><!-- #footer -->

	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

	<!-- JavaScript Libraries --> <script
		src="<%=request.getContextPath()%>/js/jquery.min.js"></script> <script
		src="<%=request.getContextPath()%>/js/jquery-migrate.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/hoverIntent.js"></script>
	<script src="<%=request.getContextPath()%>/js/superfish.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/wow.min.js"></script> <!-- Template Main Javascript File -->
	<script src="<%=request.getContextPath()%>/js/biz.js"></script> <script>
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				document.getElementById("myBtn").style.display = "block";
			} else {
				document.getElementById("myBtn").style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
</body>
</html>