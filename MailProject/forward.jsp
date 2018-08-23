<html>
<head>
<style>
#t2
{
width: 60%;
height: 30%;	
}
</style>
</head>
<title>Compose</title>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page session="true"%>

<form>
<table id="t2" border="4" >
<tr>
<td>From: &nbsp &nbsp &nbsp &nbsp &nbsp  <input type=email value=<%=(String)session.getAttribute("id")%> readonly style="width:500px"></td>
</tr>

<tr>
<td>To: &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type=email name=id12 style="width:500px"></td>
</tr>

<tr>
<td>Subject: &nbsp &nbsp &nbsp <input type=text name=sub value=<%=(String)session.getAttribute("subject")%> style="width:500px"></td>
</tr>

<tr>
<td style="height:80px; cell-spacing:6px">Compose Email:<br><textarea name=data cols="4" rows="50" style="width:500px; height:100px" ><%=(String)session.getAttribute("data")%></textarea></td>
</tr>
</table>
<br>
<input type=submit value=send name=submit>
</form>


</body>
</html>