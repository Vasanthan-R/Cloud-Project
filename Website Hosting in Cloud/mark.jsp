<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
try
{
	out.println("<center>");
	java.sql.Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbName = System.getProperty("RDS_DB_NAME");
	String userName = System.getProperty("RDS_USERNAME");
	String password = System.getProperty("RDS_PASSWORD");
	String hostname = System.getProperty("RDS_HOSTNAME");
	String port = System.getProperty("RDS_PORT");
	String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
	con = DriverManager.getConnection(jdbcUrl);
    
    String n = (String)session.getAttribute("uname");
    String ip = request.getParameter("ip");
    String iplab = request.getParameter("iplab");
    
    PreparedStatement statement = con.prepareStatement("select count(*) from marks where username =?");
    statement.setString(1, n);

    ResultSet result = statement.executeQuery();
    int cnt=0;

    if(result.next()){
        cnt = result

        .getInt(1);
    }
    if(cnt!=0){
        out.println("Your marks have already been stored! We will update it. " + "<br/>" +"<br/>");
        
        PreparedStatement ps= con.prepareStatement("update marks set ip=?,iplab=? where username=?");
    	ps.setString(1,ip);
    	ps.setString(2,iplab);
    	ps.setString(3,n);
    	
    	int x=ps.executeUpdate();
    	
    	if(x==0)
    		out.println("Something went wrong");
    	else
    		out.println("Updated!" + "<br/>");
    	
    	con.close();
    }

    else
    {
		PreparedStatement ps= con.prepareStatement("insert into marks values(?,?,?)");
		ps.setString(1,n);
		ps.setString(2,ip);
		ps.setString(3,iplab);
		
		int x=ps.executeUpdate();
		
		if(x==0)
			out.println("Something went wrong");
		else
			out.println("Your marks have been stored!" + "<br/>");
		
		con.close();
    }

	out.println("<a href='index.html'>Logout</a>");
    
}
catch(Exception e)
{
	out.println(e);
}
%>
