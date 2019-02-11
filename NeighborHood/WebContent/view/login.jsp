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
<link rel="icon" href="/favicon.ico">

<title>Neighborhood - Log in</title>

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/favicon/favicon.ico"
	rel="icon">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/floating-labels.css"
	rel="stylesheet">
</head>
<body>
	<%
		response.sendRedirect(request.getContextPath() + "/login");
	%>
	<form class="form-signin" method="post"
		action="<%=request.getContextPath()%>/login">
		<div class="text-center mb-4">
			<h1>
				<a href="<%=request.getContextPath()%>/view/index.jsp"
					class="badge badge-dark">NeighborHood</a>
			</h1>
			<hr />
			<h1 class="h3 mb-3 font-weight-normal">Login to continue</h1>
			<p>Welcome back, sign in with your existing Neighborhood account
				credentials</p>
		</div>

		<div class="form-label-group">
			<input type="email" id="inputEmail" name="emailAddress"
				class="form-control" placeholder="Email address" required autofocus
				pattern="[^ @]*@[^ @]*"> <label for="inputEmail">Email
				address</label>
		</div>

		<div class="form-label-group">
			<input type="password" id="inputPassword" name="password"
				class="form-control" placeholder="Password" required> <label
				for="inputPassword">Password</label>
		</div>

		<div class="checkbox mb-3">
			<label> <input type="checkbox" name="remember"
				value="remember-me"> Remember me
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
		<br />
		<%
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
		%>
		<%=(request.getAttribute("errorMessage") == null) ? ""
					: request.getAttribute("errorMessage")%>
		<%
			String errorMessage = (String) session.getAttribute("errorMessage");
			if (null != errorMessage) {
		%>
		<h4>
			<%=errorMessage%>
		</h4>
		<%
			}
		%>
		<%
			session.removeAttribute("errorMessage");
		%>
		<div class="col-12 text-center">
			<button type="button" class="btn btn-outline-success"
				onclick="location.href = '<%=request.getContextPath()%>/view/registration.jsp';">Don't
				have account? Sign Up</button>
				<br/><br/>
			<a href="<%=request.getContextPath()%>/view/forgotpassword.jsp">Forgot
				Your Password ???</a>
		</div>
		<p class="mt-5 mb-3 text-muted text-center">&copy; 2018
			Neighborhood Inc.</p>
	</form>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/main.js"></script>
</body>
</html>