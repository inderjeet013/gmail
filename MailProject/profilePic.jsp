<html>
<head>
</head>
<title></title>
<body>

<%@ page import="java.sql.*,java.io.*"%>
<%@ page session="true"%>
<%
try
{
String pp=(String)session.getAttribute("id");
String img=null;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from image");
while(rs.next())
{	
	if(rs.getString("mail").equals(pp))
{
	img=rs.getString("image");
	byte[] img2=new byte[img.length()];
	InputStream imgstream=rs.getBinaryStream("image");
	int index=imgstream.read(img2,0,img.length());
	response.reset();
	response.setContentType("image/jpg");
	response.getOutputStream().write(img2,0,img2.length);
	response.getOutputStream().flush();
	imgstream.close();
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