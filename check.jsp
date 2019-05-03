<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
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

	ResultSet rs = st.executeQuery("select lname from dfaq where uname='"+request.getParameter("uid")+"'");
	String pass = request.getParameter("uid1");
	while(rs.next())
	{
		if(rs.getString("lname").equals(pass))
		{
			session.setAttribute("name", request.getParameter("uid"));
			response.sendRedirect("home.jsp");
		}
	}
	response.sendRedirect("log.jsp");
	
%>
</body>
</html>