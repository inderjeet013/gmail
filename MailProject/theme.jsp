<html>
<head>
<style>
#t1 div
{
	margin:2%;
	width:98%;
	text-align:center;
	vertical-align:top;
	white-space:nowrap;
	position:relative;
	display:block;
	float:left;
	overflow:hidden;
}
</style>
</head>
<title></title>
<body>
<font size=30><center> Click to change</center></font><br><br>
<div id="t1">
<a href="theme.jsp?nm=1"><div style=" background-color:blue;height:400;width:200; float:left"></div></a>
&nbsp &nbsp &nbsp &nbsp &nbsp <a href="theme.jsp?nm=2"><div style=" background-color:yellow;height:400;width:200;"></div></a>
&nbsp &nbsp &nbsp &nbsp &nbsp <a href="theme.jsp?nm=3"><div style=" background-color:purple;height:400;width:200;"></div></a>
&nbsp &nbsp &nbsp &nbsp &nbsp <a href="theme.jsp?nm=4"><div style=" background-color:orange;height:400;width:200;"></div></a>
</div>
<%@ page import="java.sql.*,java.io.*,javax.swing.*" %>

<%
String nm=request.getParameter("nm");
	try
{
	if(nm!=null)
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
	Statement st=con.createStatement();
	Statement st2=con.createStatement();
	
	if(nm.equals("1"))
	{
		ResultSet rs=st.executeQuery("Select * from theme");
		while(rs.next())
		{
			if(rs.getString(3).equals("yes"))
			{
				st2.executeUpdate("update theme set truth='no' where color='"+rs.getString(1)+"'");
			}
		}
		st2.executeUpdate("update theme set truth='yes' where color='blue'");
		JOptionPane.showMessageDialog(null,"theme change");
		response.sendRedirect("Mail.jsp");
	}
	else if(nm.equals("2"))
	{
		ResultSet rs=st.executeQuery("Select * from theme");
		while(rs.next())
		{
			if(rs.getString(3).equals("yes"))
			{
				st2.executeUpdate("update theme set truth='no' where color='"+rs.getString(1)+"'");
			}
		}
		st2.executeUpdate("update theme set truth='yes' where color='yellow'");
		JOptionPane.showMessageDialog(null,"theme change");
		response.sendRedirect("Mail.jsp");
	}
	else if(nm.equals("3"))
	{
		ResultSet rs=st.executeQuery("Select * from theme");
		while(rs.next())
		{
			if(rs.getString(3).equals("yes"))
			{
				st2.executeUpdate("update theme set truth='no' where color='"+rs.getString(1)+"'");
			}
		}
		st2.executeUpdate("update theme set truth='yes' where color='purple'");
		JOptionPane.showMessageDialog(null,"theme change");
		response.sendRedirect("Mail.jsp");
	}
	 else if(nm.equals("4"))
	{
		ResultSet rs=st.executeQuery("Select * from theme");
		while(rs.next())
		{
			if(rs.getString(3).equals("yes"))
			{
				st2.executeUpdate("update theme set truth='no' where color='"+rs.getString(1)+"'");
			}
		}
		st2.executeUpdate("update theme set truth='yes' where color='orange'");
		JOptionPane.showMessageDialog(null,"theme change");
		response.sendRedirect("Mail.jsp");
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