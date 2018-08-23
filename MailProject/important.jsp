<html>
<head>
<style>
.u1 a
{
	text-decoration:none;
}
</style>
</head>
<title></title>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%
	try
{
	String ll=(String)session.getAttribute("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select mail,date from inbox where count='1' and N_id='"+ll+"'");
%>
<form>
<% while(rs.next())
{%>

&nbsp &nbsp &nbsp &nbsp <div class="u1"><input type="checkbox" name="id5" value="<%= rs.getString("mail") %>" style="margin-left:20px;"/><b><i> &nbsp &nbsp &nbsp <a href="Mail.jsp?value=<%= rs.getString("mail") %>" style="font-size:120%;color:black"> <%= rs.getString("mail") %></a></b></i> &nbsp &nbsp &nbsp &nbsp <%= rs.getString("date")%>
</div>
<%}%>

<input type=submit name=submit value=delete style="margin-top:0;float:right;">
</form>

<%}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>