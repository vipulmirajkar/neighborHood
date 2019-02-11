<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/scraft.css">
<title>NeighborHood - Account</title>
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
		<h4 align="center">Change Password</h4>
		<hr />
	</div>
	<form action="<%=request.getContextPath()%>/changePassword"
		method="post">
		<div class="container">
			<div class="col-md-6 offset-3">
				<label>Current Password</label>
				<div class="form-group pass_show">
					<input type="password" name="oldPassword" class="form-control"
						placeholder="Current Password">
				</div>
				<label>New Password</label>
				<div class="form-group pass_show">
					<input type="password" name="password" id="password"
						class="form-control" placeholder="New Password">
				</div>
				<label>Confirm Password</label>
				<div class="form-group pass_show">
					<input type="password" name="confirmPassword" id="confirmPassword"
						class="form-control" placeholder="Confirm Password">
				</div>
				<br /> <br />
				<div class="form-group">
					<button type="submit" id="find" onclick="return validate();"
						class="btn btn-dark btn-block">Change Password</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/password.js"></script>
	<script type="text/javascript">
		function validate() {
			var password = document.getElementById('password').value;
			var repeatPassword = document.getElementById('confirmPassword').value;
			console.log(password);
			console.log(repeatPassword);
			if (password != repeatPassword) {
				window.alert("Passwords not matched");
				return false;
			}
		}
	</script>
</body>
</html>