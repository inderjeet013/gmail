<html>
<head>
<style>
#f4
{
	margin-left:450px;
	float:center;
	margin-top:80px;
	width: 400px;
	height: 400px;
	text-decoration:none;
	background-color: yellow;

}
#f4 a
{
	margin-top:100px;
	float:right;
}
</style>
</head>
<title></title>
<body bgcolor="orange">
<h1 align="center">Change Password</h1>
<div id="f4" align="center">
<form action="project.jsp">
<table border="2" >
<tr>
<td width=600px height=60px>Enter your old password:    <input type=password name=old><br></td></tr>
<tr><td width=600px height=60px>
Enter your new password:<input type=password name=new><br></td></tr>
<tr><td width=600px height=60px align="center"><input type=submit name=submit value=submit><br></td></tr>
</table>
</form>
</div>
<%@ page import="java.sql.*,java.io.*,javax.swing.*" %>
<%@ page session="true"%>

<%
String oldpass=request.getParameter("old");
String nm2=(String)session.getAttribute("id");
String newpass=request.getParameter("new");
if(oldpass!=null)	
{
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from reg where id='"+nm2+"'");
rs.next();
if(oldpass.isEmpty() || newpass.isEmpty())
{
JOptionPane.showMessageDialog(null,"please enter your  detail");
}
else
{
st.executeUpdate("update reg set password='"+newpass+"' where id='"+nm2+"' and password='"+oldpass+"'");
JOptionPane.showMessageDialog(null,"Your password change successfully !!!");
}
}
catch(Exception e)
{
	out.println(e);
}
}
%>
</body>
</html>