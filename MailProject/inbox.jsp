<html>
<head>
<%@ page import="java.sql.*" %>

<style>
.rating a
{
	text-decoration:none;
	font-size:120%;
	color:black;
}

.rating span a
{
	text-decoration:none;
	font-size:190%;
	margin-left:20px;
}
</style>
</head>
<title> mail</title>
<body>

<%@ page import="java.sql.*,java.io.*" %>

<%
	try
{
	String ll=(String)session.getAttribute("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from inbox where N_id='"+ll+"'");
%>
<form>
<%
while(rs.next())
{String color=null;
	if(rs.getInt(5)==1)
	{
		color="cyan";
	}
	else
	{
		color="white";
	}	
	
	
%>

&nbsp &nbsp &nbsp <div class="rating" ><span><a href="Mail.jsp?lm=<%= rs.getString("mail") %>" style="color:<%=color%>">&starf;</a></span> &nbsp &nbsp <input type="checkbox" name="id1" value="<%= rs.getString("mail") %>" /><b><i>&nbsp  &nbsp &nbsp &nbsp <a href="Mail.jsp?value=<%= rs.getString("mail")+"ooq"%><%= rs.getString("subject") %>"> <%= rs.getString("mail") %></a></b></i> &nbsp &nbsp &nbsp &nbsp <%= rs.getString("date")%>
<br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <%= rs.getString("subject") %>

	</div>
<%
}
%>

<input type=submit name=submit value=delete style="margin-top:0;float:right;">
<input type=submit name=submit value=Mark_as_spam style="margin-top:30;margin-right:-55;float:right;">
</form>
<%
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>