import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import com.oreilly.servlet.*;

public class Upload extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
	//String pp=(String)session.getAttribute("id");
	PrintWriter out=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");	
		Statement st=con.createStatement();
		PreparedStatement pstmt=con.prepareStatement("update image set image=? where mail='pikujain00@gmail.com'");
		out=response.getWriter();
		MultipartRequest mp=new MultipartRequest(request,getServletContext().getRealPath("images"));
		String ft=mp.getOriginalFileName("fil");
		
		if(ft!=null)
		{
			response.setContentType("text/html");
			ServletContext ctx=getServletContext();
			String path=ctx.getRealPath("images/"+ft);
			out.println("<img src="+path+">");
			File ff=new File(path);
			String f1=ff.getAbsolutePath();
			
			FileInputStream fi=new FileInputStream(ff);
			pstmt.setBinaryStream(1,fi,(int)ff.length());
			int n=pstmt.executeUpdate();
			if(n>0)
			{
			out.println("insert");
			}
			else
			{
				out.println("please select a limited size image");
			}
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
}