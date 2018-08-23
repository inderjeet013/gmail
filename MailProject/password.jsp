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
<form>
<table border="2" >
<tr>
<td width=600px height=60px>Enter your New password:    <input type=password name=old placeholder="enter ur new password"><br></td></tr>
<tr><td width=600px height=60px>
Confirm password:<input type=password name=new placeholder="confrm password"><br></td></tr>
<tr><td width=600px height=60px align="center"><input type=submit name=submit value=submit><br></td></tr>
</table>
</form>
<p style="margin-top:170px; text-align:left">To login click here !!!</p><a href="project.jsp" style="margin-top:-35px">Previous Page</a>
</div>

<%@ page import="java.sql.*,java.io.*,java.util.*,javax.swing.*" %>
<%
String pass2=request.getParameter("old");
String Cpass2=request.getParameter("new");
String ph2=(String)session.getAttribute("ph2");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
if((pass2).equals(Cpass2))
{
st.executeUpdate("update reg set password='"+pass2+"' where phone_no='"+ph2+"'");	
	JOptionPane.showMessageDialog(null,"Password change sucessfully !!!");
}
else
{
	JOptionPane.showMessageDialog(null,"detail mismatch !! please enter both password same");
}
}
catch(Exception e)
{
	
}
%>
</body>
</html>