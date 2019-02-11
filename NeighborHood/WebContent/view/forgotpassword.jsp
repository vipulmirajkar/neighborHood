<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ForgotPassword - NeighborHood</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/favicon.ico">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Favicons -->
<link href="favicon/favicon.ico" rel="icon">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
</head>
<body>
	<div class="container" style="padding-top: 150px;">
		<div class="jumbotron col-md-12">
			<div class="container bg-info" style="color: white;">
				<h2>Hello, Please Enter Your Email Address.</h2>
			</div>
			<div class="container">
				<h4>You Will Receive OTP In Your Mail Box.</h4>
			</div>
			<br />
			<div class="container col-md-3 col-md-push-1" align="left">
				<form action="<%=request.getContextPath()%>/forgotPassword"
					method="post">
					<input type="text" class="form-control" name="emailAddress"
						placeholder="Enter Email Address" required> <br />
					<button class="btn btn-lg btn-info btn-block">NEXT</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>