<html>
<head>
</head>
<title> mail</title>
<body>

<%@ page import="java.sql.*,java.io.*" %>

<%
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from inbox");
while(rs.next())
{%>
&nbsp &nbsp &nbsp &nbsp &nbsp <input type=checkbox value=box> <a href ><%= rs.getString("mail") %></a> &nbsp &nbsp &nbsp &nbsp <%= rs.getString("date")%>
	<br><br>
<%}
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>