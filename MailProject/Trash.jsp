<html>
<head>
</head>
<title></title>
<body>
<%@ page import="java.sql.*,java.io.*" %>

<%
String ll=(String)session.getAttribute("id");
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from trash where N_id='"+ll+"'");
%>
<form>
<% while(rs.next())
{%>
<div>
&nbsp &nbsp &nbsp &nbsp <input type="checkbox" name="id2" value="<%= rs.getString("mail") %>" /> &nbsp &nbsp &nbsp <b><i><a href="Mail.jsp?value3=<%= rs.getString("mail")+"ooq" %><%= rs.getString("subject") %>" style="font-size:120%;color:black;text-decoration:none"> <%= rs.getString("mail") %></a> </b></i> &nbsp &nbsp &nbsp &nbsp <%= rs.getString("date")%>
<br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <%= rs.getString("subject") %>	<br><br>

</div>
<%}%>


<input type=submit name=submit1 value=restore style="margin-top:0;float:right;">
<input type=submit name=submit1 value=delete style="margin-top:30;margin-right:-55;float:right;">
</form>
<%}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>