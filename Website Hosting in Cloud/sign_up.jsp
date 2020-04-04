<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
try
{
	java.sql.Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbName = System.getProperty("RDS_DB_NAME");
	String userName = System.getProperty("RDS_USERNAME");
	String password = System.getProperty("RDS_PASSWORD");
	String hostname = System.getProperty("RDS_HOSTNAME");
	String port = System.getProperty("RDS_PORT");
	String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
	con = DriverManager.getConnection(jdbcUrl);
    
	PreparedStatement ps= con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,request.getParameter("f"));
	ps.setString(2,request.getParameter("l"));
	ps.setString(3,request.getParameter("g"));
	ps.setString(4,request.getParameter("age"));
	ps.setString(5,request.getParameter("m"));
	ps.setString(6,request.getParameter("e"));
	ps.setString(7,request.getParameter("u"));
	ps.setString(8,request.getParameter("p"));
	ps.setString(9,request.getParameter("edu"));
	ps.setString(10,request.getParameter("med"));
	ps.setString(11,request.getParameter("std"));
	ps.setString(12,request.getParameter("add"));
	ps.setString(13,request.getParameter("pin"));

	int x=ps.executeUpdate();
	
	if(x==0)
		out.println("Something went wrong");
	
	con.close();
	 

   Cookie firstName = new Cookie("first_name", request.getParameter("f"));
   Cookie lastName = new Cookie("last_name", request.getParameter("l"));

   firstName.setMaxAge(60*60*24); 
   lastName.setMaxAge(60*60*24); 
   
   response.addCookie( firstName );
   response.addCookie( lastName );
	
   response.sendRedirect("store.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>
