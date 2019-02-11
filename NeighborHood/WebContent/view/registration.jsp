<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Neighborhood - Register Here</title>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="767558508350-rtlukv4rbmhlq1ii8c6djb8rujslg069.apps.googleusercontent.com">

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
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<br />
	<div class="container">
		<div class="text-center">
			<h2>
				<a href="<%=request.getContextPath()%>/view/index.jsp"
					class="badge badge-info">NeighborHood</a>
			</h2>
			<hr style="width: 300px;" />
			<h4>Become a NeighborHood neighbor</h4>
		</div>
	</div>
	<!-- <img id="myImg">
	<br>
	<p id="name"></p>
	<div id="status"></div> -->
	<div class="container">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<form method="post"
				action="<%=request.getContextPath()%>/registration">
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="firstName" class="form-control"
						placeholder="First name" type="text" required>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="lastName" class="form-control" placeholder="Last name"
						type="text" required="required">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-envelope"></i>
						</span>
					</div>
					<input name="emailAddress" class="form-control"
						placeholder="Email Address" type="text" required="required"
						pattern="[^ @]*@[^ @]*">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-map-marker"></i>
						</span>
					</div>
					<input id="geocomplete" name="geocomplete" class="form-control"
						placeholder="Location eg: Ambernath" type="text"
						required="required">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-phone"></i>
						</span>
					</div>
					<input name="phoneNumber" class="form-control"
						placeholder="Phone number" type="text" required="required"
						size="20" required pattern="[7-9]{1}[0-9]{9}">
				</div>
				<!-- form-group end.// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="inputPassword" name="password" class="form-control"
						placeholder="Create password" type="password" required="required">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="repeatPassword" name="repeatPassword"
						class="form-control" placeholder="Repeat password" type="password"
						required="required">
				</div>
				<!-- form-group// -->
				<div class="form-group">
					<button type="submit" id="find" class="btn btn-success btn-block"
						onclick="return validate();">Create Account</button>
				</div>
				<!-- form-group// -->
				<div class="row">
					<div class="col-md-4">
						<button type="button"
							onclick="location.href = '<%=request.getContextPath()%>/view/login.jsp'"
							class="btn btn-outline-info">Have an account? LogIn</button>
					</div>
					<div class="col-md-4 offset-md-3">
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
					</div>
				</div>
			</form>
		</article>

	</div>
	<!--container end.//-->
	<script
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDVbqlmH5UsgmtO-qANT2FH7riDYRGr2yY&libraries=places"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.geocomplete.js"></script>
	<script>
		$(function() {

			$("#geocomplete").geocomplete();

			$("#find").click(function() {
				$("#geocomplete").trigger("geocode");
			});
		});

		function validate() {
			//var tester = document.getElementById('geocomplete').value;
			var password = document.getElementById('inputPassword').value;
			var repeatPassword = document.getElementById('repeatPassword').value;
			console.log(password);
			console.log(repeatPassword);
			if (password != repeatPassword) {
				window.alert("Passwords not matched");
				return false;
			}
		}

		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			var imagurl = profile.getImageUrl();
			var name = profile.getName();
			var email = profile.getEmail();
			}
	</script>
</body>
</html>