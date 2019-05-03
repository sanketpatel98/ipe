<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud","root","root");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from dfaq");
		%><table border="1"><%
		while(rs.next())
		{
			%><tr>
				<td><%= rs.getInt(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getString(3)%></td></tr><%
		}
		%>
		</table>
		<%
			String id = request.getParameter("id");
			String fname = request.getParameter("uid");
			String lname = request.getParameter("uid1");
			st.executeUpdate("insert into dfaq values("+id+",'"+fname+"','"+lname+"')");
		%>
		<table border="1"><%
		ResultSet rs1 = st.executeQuery("select * from dfaq");
		while(rs1.next())
		{
			%><tr>
				<td><%= rs1.getInt(1)%></td>
				<td><%= rs1.getString(2)%></td>
				<td><%= rs1.getString(3)%></td></tr><%
		}
		response.sendRedirect("log.jsp");
		%>
		</table>
</body>
</html>