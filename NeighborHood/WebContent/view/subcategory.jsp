<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NeighborHood - Sub Category</title>
</head>
<body>
	<%
		String category = request.getParameter("count");
		String buffer = "<select name='subCategory'><option value='-1'>Select Sub Category:	</option>";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String query = "select * from sub_categories where c_id='"+category+"' ";
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/neighborhood", "root", "");
			Statement statement = con.createStatement();
			ResultSet result = statement.executeQuery(query);
			while (result.next()) {
				buffer = buffer + "<option value='"
						+ result.getString("sub_id") + "'>"
						+ result.getString("sub_category_name") + "</option>";
			}
			buffer = buffer + "</select>";
			response.getWriter().println(buffer);
		} catch (Exception e) {
			System.out.print("Error " + e);
		}
	%>
</body>
</html>