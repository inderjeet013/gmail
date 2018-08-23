<html>
<head>
</head>
<title></title>
<body>
<font size=30><center> Enter The Detail To Change Password</center></font><br><br>
<div id="i1">
<form >
<p align=center>
<br><br><br><br>
Enter Your_Name :<input type=text name=nm5 ><br><br>
D.O.B : &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type=date name=do5><br><br>
Phone_No &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type=tel name=number5><br><br>
Gender:&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <br>
  <input type=radio name=gender value=male>Male<br><br>
&nbsp &nbsp <input type=radio name=gender value=female>Female<br><br>
<input type=submit name=submit5 value=submit><br><br>
</p>
</form>
</div>

<%@ page import="java.sql.*,java.io.*,javax.swing.*" %>

<%
String name=request.getParameter("nm5");
if(name!=null)	
{
	try
{
String dob=request.getParameter("do5");
String ph=request.getParameter("number5");
String gender=request.getParameter("gender");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from reg where name='"+name+"'");
rs.next();

	if(name.isEmpty() || dob.isEmpty() || ph.isEmpty() || gender.isEmpty())
		{
			JOptionPane.showMessageDialog(null,"please enter ur complete detail first");
		}
	else if(rs.getString("Name").equals(name) && rs.getString("gender").equals(gender) && rs.getString("dob").equals(dob) && rs.getString("phone_no").equals(ph))
		{
			session.setAttribute("ph2",ph);
			response.sendRedirect("password.jsp");
		}
	else
		{
		JOptionPane.showMessageDialog(null,"detail mismatch !! please enter your valid detail");
		
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