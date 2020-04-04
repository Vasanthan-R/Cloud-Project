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
    
    String n=(String)session.getAttribute("uname");
    String p=(String)session.getAttribute("pwd");
	
	PreparedStatement statement = con.prepareStatement("select count(*) from student where username =? and password=?");
    statement.setString(1, n);
    statement.setString(2, p);

    ResultSet result = statement.executeQuery();
    int cnt=0;

    if(result.next()){
        cnt = result

        .getInt(1);
    }
    if(cnt==0){
        out.println("Username and Password is incorrect! You will be redirected in 3 seconds! " + "<br/>" +"<br/>");
        out.println("We are noting down the security breach! Enter your credentials correctly!" + "<br/>");
        
        PreparedStatement ps= con.prepareStatement("insert into login values(?,?)");
    	ps.setString(1,n);
    	ps.setString(2,p);
    	
    	int x=ps.executeUpdate();
    	
    	if(x==0)
    		out.println("Something went wrong");
    	else
    		out.println("Stored!");
    	
    	con.close();
    	
    	response.setHeader("Refresh", "3;url=index.html");
    }
    else
    {

	out.println("Hello "+ n + "<br/>" + "<br/>"); 

	out.println("Hurray! Your credentials are absolutely correct!" + "<br/>" + "<br/>");
	
	out.println("<a href='tag.jsp'>Go to JSP tags</a>");
    }

}
catch(Exception e)
{
	out.println(e);
}
%>
