<html>
<head>
<style>
#f2
{	
height:200px;
width:500px;
margin-top:18%;
float:right;
}
</style>
</head>
<body>
<title> login page</title>
<img src="images/5.jpg" width=730 height=590>
<div id="f2">
<form>
<table border="1" width="100%" height="90%">
<tr>
<th colspan="2">Login Here</th>
</tr>
<tbody>
<tr>
<td>Email_ID </td>
<td> <input type=email name=mail placeholder="enter your Email" /></td>
</tr>
<tr>
<td>Password </td>
<td> <input type=password name=pass placeholder="enter your password" /></td>
</tr>
<tr>
<td colspan="2" align="center"> <input type=submit name=submit value=login width="70%" onclick=validateForm() /></td>
</tr>
</tbody>
</table>
</form><br>
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href=forgetPassword.jsp>Forget Password</a>&nbsp &nbsp &nbsp &nbsp
<a href=Reg.jsp>Register Here</a>
</div>

<%@ page import="java.sql.*,java.io.*,javax.swing.*" %>
<%@ page session="true" %>
<%
try
{
String id=request.getParameter("mail");
String password1=request.getParameter("pass");
if(id!=null && password1!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from reg");
while(rs.next())
{
if(rs.getString("id").equals(id) && rs.getString("password").equals(password1))
{

	session.setAttribute("id",id);
	response.sendRedirect("Mail.jsp");	
}
else
{%>
<script>
	function validateForm()
	{
		alert("please enter the valid Email-Address and Password");
	}	
</script>

<%}
}
}
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>