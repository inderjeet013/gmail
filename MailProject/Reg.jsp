<html>
<head>
<title>Registration Form</title>
</head>
<body>
<form action =Reg.jsp>
<h1  align=center>Enter Your Detail To Create Account</h1><br><br>
<p align=center>

User_Name :<input type=text name=nm ><br><br>
User_ID :<input type=email name=id><br><br>
D.O.B :<input type=date name=do><br><br>
Phone_No<input type=tel name=number><br><br>
Gender:&nbsp &nbsp &nbsp &nbsp <br>
<input type=radio name=gend value=male>Male<br><br>
<input type=radio name=gend value=female>Female<br><br>
Password :<input type=password name=password><br><br>
Confirm_Password :<input type=password name=Cpassword><br><br>
<input type=submit name=submit10 value=submit><br><br>
if Already registered !! <a href=project.jsp>login here</a>
</p>
</form>


<%@ page import="java.sql.*,java.io.*,javax.swing.*" %>

<%
String name=request.getParameter("nm");
if(name!=null)	
{
	try
{
String id=request.getParameter("id");
String dob=request.getParameter("do");
String ph=request.getParameter("number");
String pass=request.getParameter("password");
String Cpass=request.getParameter("Cpassword");
String gender=request.getParameter("gend");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from reg");
rs.next();
if(name.isEmpty() || id.isEmpty() || dob.isEmpty() || ph.isEmpty() || pass.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur complete detail first");
}
else if(name.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur name");
}
else if(id.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur Email id");
}
else if(dob.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur date of birth ");
}
else if(ph.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur phone number");
}
else if(pass.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur password");
}
else if(gender.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please select ur gender");
}

else if(Cpass.isEmpty())
{
	JOptionPane.showMessageDialog(null,"please enter ur Confrm Password");
}
else if(rs.getString("Id").equals(id))
{
	JOptionPane.showMessageDialog(null,"please retry another Id? Id Alredy exit !!!");
}
else
{
	String img="";
st.executeUpdate("insert into reg values('"+name+"','"+id+"','"+ph+"','"+gender+"','"+pass+"','"+dob+"')");
st.executeUpdate("insert into image values('"+id+"','"+img+"')");
	JOptionPane.showMessageDialog(null,"your Id create sucssfully");
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
