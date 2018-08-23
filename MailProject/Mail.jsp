<html>
<head>

<%@ page import="java.sql.*" %>

<%
String col=null;
Class.forName("com.mysql.jdbc.Driver");
Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st2=con2.createStatement();
ResultSet rs2=st2.executeQuery("Select * from theme");
while(rs2.next())
{
	if(rs2.getString(3).equals("yes"))
	{
		col=rs2.getString(1);
	}
}
%>

<style>
#f1 
{
	padding-top:5px;
	margin-left:3px;
	width: 1245px;
	height: 120px;
	background-color: red;
	text-decoration:none;
}
#f1 svg
{
	float:left;
	margin-top:-7%;
}
#f2 
{
	margin-left:3px;
	float: left;
	width: 200px;
	height: 490px;
	text-decoration:none;
	background-color: green;
}
#f3 
{
	background-color:<%=col%>;
	margin-left:3px;
	float: left;
	width: 1040px;
	height: 490px;
	overflow-y:scroll;
}
#f1 a:hover
{
	text-decoration:none;
	color:white;
}

#f2 a:hover
{
	text-decoration:none;
	color:white;
}
.dropbtn
{
background-color:red;
padding:10px;
font-size:16px;
border:none;
}

.dropdown
{
display: inline-block;
}

.dropdown-content
{
display:none;
position:absolute;
background-color:blue;
box-shadow:0px 8px 16px 0px rgba(0,0,0,2);
}

.dropdown-content a
{
color:black;
padding:12px;
text-decoration:none;
display:block;

}

.dropdown-content a:hover
{
color:#ddd;
}

.dropdown:hover
.dropdown-content
{
display:block;
}

.dropdown:hover
.dropbtn
{
background-color:#3e8e41;
}
</style>
</head>
<title>Mail Page</title>
<body>

<div id="f1">
<h1 align=center> Welcome to Gmail</h1>
<svg height="90" width="90">
<defs>
<clippath id="mycircle">
<circle cx="40" cy="40" r="35" stroke="black" stroke-width="3" fill="blue"/>
</clippath>
</defs>
<image width="80" height="90" xlink:href="profilePic.jsp" clip-path="url(#mycircle)"/>
</svg>
<p style=text-align:right>
<div class="dropdown" style=float:right>
<a  class="dropbtn" href="Mail.jsp?nm=setting" >setting </a>&nbsp &nbsp &nbsp 
<div class="dropdown-content">
<a href="changePassword.jsp">change password</a>
<a href="theme.jsp">themes</a>
<a href="Upload1.jsp">profilePic</a>
<a href="Mail.jsp?nm=help">help</a>
</div>
</div>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="project.jsp" style=float:right
<%@ page session="true"%>
<%
String nm1=(String)session.getAttribute("id");
session.removeAttribute(nm1);
%>
>logout </a>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  
</p>
</div>

<div id="f2">
<p align=center>
<a href="Mail.jsp?nm=compose">Compose</a><br><br>
<a href="Mail.jsp?nm=sent">Sent</a><br><br>
<a href="Mail.jsp?nm=outbox">Outbox</a><br><br>
<a href="Mail.jsp?nm=inbox">Inbox</a><br><br>
<a href="Mail.jsp?nm=important">Important</a><br><br>
<a href="Mail.jsp?nm=spam">Spam</a><br><br>
<a href="Mail.jsp?nm=Trash">Trash</a><br><br>
<a href="Mail.jsp?nm=AllMail">All Mail</a><br><br>
</p>
</div>

<div id="f3" style="overflow-y: scroll;">

<%
String nm=(String)session.getAttribute("id");
String subject=request.getParameter("sub");
String to1=request.getParameter("id12");
String compose1=request.getParameter("data");
String action=request.getParameter("submit");
String action1=request.getParameter("submit1");
String select1[]=request.getParameterValues("id1");
String select2[]=request.getParameterValues("id2");
String select3[]=request.getParameterValues("id3");
String select4[]=request.getParameterValues("id4");
String select5[]=request.getParameterValues("id5");
String name=request.getParameter("nm");
String fetch1=request.getParameter("value");
String fetch2=request.getParameter("value1");
String fetch3=request.getParameter("value3");
String fetch4=request.getParameter("value4");
String starcolor=request.getParameter("lm");
String td=request.getParameter("id12");
session.setAttribute("td",td);

if(name!=null)
{
	if(name.equals("compose"))
	{
%>  
	<%@ include file="compose.jsp"%>
<%
}
if(name.equals("forward"))
	{
%>  
	<%@ include file="forward.jsp"%>
<%
}
if(name.equals("reply"))
	{
%>  
	<%@ include file="reply.jsp"%>
<%
}
if(name.equals("important"))
	{
%>  
	<%@ include file="important.jsp"%>
<%
}
if(name.equals("inbox"))
	{
%>
	<%@ include file="inbox.jsp"%>
<%
}
if(name.equals("outbox"))
{
%>
	<%@ include file="outbox.jsp"%>
<%
}
if(name.equals("AllMail"))
{
%>
	<%@ include file="AllMail.jsp"%>
<%}
if(name.equals("spam"))
	{
%>
	<%@ include file="spam.jsp"%>
<%}
if(name.equals("Trash"))
	{
%>
	<%@ include file="Trash.jsp"%>
<%}
if(name.equals("sent"))
	{
%>
	<%@ include file="sent.jsp"%>
<%}
if(name.equals("help"))
	{
%>
	<%@ include file="help.jsp"%>
<%}
}
else if(to1!=null && subject!=null && compose1!=null)	
{
%>
	<%@ page import="java.util.*,java.sql.*" %>
<%
try
{
	String ll=(String)session.getAttribute("id");
	String lm=(String)session.getAttribute("td");
	int count=0;
	java.sql.Date d1=new java.sql.Date(new java.util.Date().getTime());
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
if((nm).equals(to1))
{
st.executeUpdate("insert into inbox values('"+to1+"','"+d1+"','"+subject+"','"+compose1+"',"+count+",'"+ll+"')");
st.executeUpdate("insert into compose values('"+to1+"','"+d1+"','"+subject+"','"+compose1+"',"+count+",'"+ll+"')");	
}
else
{
st.executeUpdate("insert into compose values('"+to1+"','"+d1+"','"+subject+"','"+compose1+"',"+count+",'"+ll+"')");
st.executeUpdate("insert into inbox values('"+ll+"','"+d1+"','"+subject+"','"+compose1+"',"+count+",'"+lm+"')");
}
}
catch(Exception e)
{
	out.println(e);
}
}
else if(select1!=null)
{ 
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
	if(action.equals("delete"))
	{
	for(int i=0;i<select1.length;i++)
	{
		st.executeUpdate("insert into trash select mail,date,subject,data,count,N_id from inbox where mail='"+select1[i]+"'");
		st.executeUpdate("delete from inbox where mail='"+select1[i]+"'");
	}
	}
	else if(action.equals("Mark_as_spam"))
	{
	for(int i=0;i<select1.length;i++)
	{
		st.executeUpdate("insert into spam select mail,date,subject,data,N_id from inbox where mail='"+select1[i]+"'");
		st.executeUpdate("delete from inbox where mail='"+select1[i]+"'");
	}
	}
	
}
catch(Exception ee)
{
	out.println(ee);
}

}
else if(select2!=null)
{ 
try
{
	int count=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
	if(action1.equals("restore"))
	{
	for(int i=0;i<select2.length;i++)
	{
		st.executeUpdate("insert into inbox select mail,date,subject,data,count,N_id from trash where mail='"+select2[i]+"'");
		st.executeUpdate("delete from trash where mail='"+select2[i]+"'");
	}
	}
	 else if(action1.equals("delete"))
	{
	for(int i=0;i<select2.length;i++)
	{
		st.executeUpdate("delete from trash where mail='"+select2[i]+"'");
	}
	}
	
}
catch(Exception ee)
{
	out.println(ee);
}
}
else if(select3!=null)
{ 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
	for(int i=0;i<select3.length;i++)
	{
		st.executeUpdate("delete from spam where mail='"+select3[i]+"'");
	}
	
}
catch(Exception ee)
{
	out.println(ee);
}
}
else if(select4!=null)
{ 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
	for(int i=0;i<select4.length;i++)
	{
		st.executeUpdate("insert into trash select * from compose where mail='"+select4[i]+"'");
		st.executeUpdate("delete from compose where mail='"+select4[i]+"'");
	}
	
}
catch(Exception ee)
{
	out.println(ee);
}
}
else if(select5!=null)
{ 
try
{
	int count=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
	for(int i=0;i<select5.length;i++)
	{
		st.executeUpdate("insert into trash select mail,date,subject,data,count,N_id from inbox where mail='"+select5[i]+"'");
		st.executeUpdate("delete from inbox where mail='"+select5[i]+"'");
	}
	
}
catch(Exception ee)
{
	out.println(ee);
}
}

else if(fetch1!=null)
{
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from inbox");
String mn[]=fetch1.split("ooq");
String po1=	mn[0];
String po2=	mn[1];
while(rs.next())
{	
		ResultSet rs1=st.executeQuery("select subject,data from inbox where mail='"+po1+"' and subject='"+po2+"'");
		rs1.next();
		%>
		<table  align="center" border="3" width="80%" height="100%" style="overflow-y: scroll;">
		<%= "<h1><b>"+rs1.getString("subject")+"</h1>"%>
		<tr><td height="30"><%= mn[0] %></td></tr>
		<tr>
		<td align="center"><%= "<br>"+rs1.getString("data") %></td>
		</tr>
		<%String subject1= rs1.getString("subject");
		String data= rs1.getString("data");
		session.setAttribute("subject",subject1);
		session.setAttribute("data",data);
		session.setAttribute("mail",po1);
		%>
		</table>
		<table>
		<br><br>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp	<a href="Mail.jsp?nm=reply" style="text-decoration:none;margin-left:100px;">Reply </a> &nbsp <a href="Mail.jsp?nm=forward" style="text-decoration:none;margin-left:600px;">Forward </a>
		</table>
		
<%}
}
catch(Exception ee)
{
}
}
else if(fetch2!=null)
{
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from compose");
String mn[]=fetch2.split("ooq");
String po1=	mn[0];
String po2=	mn[1];
while(rs.next())
{
		ResultSet rs1=st.executeQuery("select subject,data from compose where mail='"+po1+"' and subject='"+po2+"'");
		rs1.next();
		%>
		<table  align="center" border="3" width="80%" height="100%" style="overflow-y: scroll;">
		<%= "<h1><b>"+rs1.getString("subject")+"</h1>"%>
		<tr><td height="30"><%= mn[0]%></td></tr>
		<tr>
		<td align="center"><%= "<br>"+rs1.getString("data") %></td>
		</tr>
		<%String subject1= rs1.getString("subject");
		String data= rs1.getString("data");
		session.setAttribute("subject",subject1);
		session.setAttribute("data",data);
		session.setAttribute("mail",po1);
		%>
		</table>
		<table>
		<br><br>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp	<a href="Mail.jsp?nm=reply" style="text-decoration:none;margin-left:100px;">Reply </a> &nbsp <a href="Mail.jsp?nm=forward" style="text-decoration:none;margin-left:600px;">Forward </a>
		</table>

<%}
}
catch(Exception ee)
{
}
}
else if(fetch3!=null)
{
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from trash");
String mn[]=fetch3.split("ooq");
String po1=	mn[0];
String po2=	mn[1];

while(rs.next())
{
		ResultSet rs1=st.executeQuery("select subject,data from trash where mail='"+po1+"' and subject='"+po2+"'");
		rs1.next();
		%>
		<table  align="center" border="3" width="80%" height="100%" style="overflow-y: scroll;">
		<%= "<h1><b>"+rs1.getString("subject")+"</h1>"%>
		<tr><td height="30"><%= mn[0] %></td></tr>
		<tr>
		<td align="center"><%= "<br>"+rs1.getString("data") %></td>
		</tr>
		<%String subject1= rs1.getString("subject");
		String data= rs1.getString("data");
		session.setAttribute("subject",subject1);
		session.setAttribute("data",data);
		session.setAttribute("mail",po1);
		%>
		</table>
		<table>
		<br><br>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp	<a href="Mail.jsp?nm=reply" style="text-decoration:none;margin-left:100px;">Reply </a> &nbsp <a href="Mail.jsp?nm=forward" style="text-decoration:none;margin-left:600px;">Forward </a>
		</table>
<%}
}
catch(Exception ee)
{
}
}
else if(fetch4!=null)
{
	try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from spam");
String mn[]=fetch4.split("ooq");
String po1=	mn[0];
String po2=	mn[1];

while(rs.next())
{
		ResultSet rs1=st.executeQuery("select subject,data from spam where mail='"+po1+"' and subject='"+po2+"'");
		rs1.next();
		%>
		<table  align="center" border="3" width="80%" height="100%" style="overflow-y: scroll;">
		<%= "<h1><b>"+rs1.getString("subject")+"</h1>"%>
		<tr><td height="30"><%= mn[0] %></td></tr>
		<tr>
		<td align="center"><%= "<br>"+rs1.getString("data") %></td>
		</tr>
		<%String subject1= rs1.getString("subject");
		String data= rs1.getString("data");
		session.setAttribute("subject",subject1);
		session.setAttribute("data",data);
		session.setAttribute("mail",po1);
		%>
		</table>
		<table>
		<br><br>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp	<a href="Mail.jsp?nm=reply" style="text-decoration:none;margin-left:100px;">Reply </a> &nbsp <a href="Mail.jsp?nm=forward" style="text-decoration:none;margin-left:600px;">Forward </a>
		</table>
<%}
}
catch(Exception ee)
{
}
}
 else if(starcolor!=null)
{
	try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from inbox");
while(rs.next())
{
	if(rs.getString("mail").equals(starcolor))
	{
		if(rs.getInt("count")==0)
		{
			st.executeUpdate("update inbox set count=1 where mail='"+starcolor+"'");
		}
		else
		{
			st.executeUpdate("update inbox set count=0 where mail='"+starcolor+"'");
		}
	}		
}
}
catch(Exception ee)
{
}
}
%>
</div>	
</body>
</html>