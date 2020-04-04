<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
try
{
	out.println("<center>");
    Cookie cookie = null;
	Cookie[] cookies = null;

	cookies = request.getCookies();

	if( cookies != null ) {
	out.println("<h2> Cookies Firstname and Lastname</h2>");
	String str="";

	for (int i = 0; i < cookies.length; i++) {
	   cookie = cookies[i];
	   out.print("Name : " + cookie.getName( ) + ",  ");
	   out.print("Value: " + cookie.getValue( )+" <br/>");
       if(i!=0){
	   str += cookie.getValue();
       str += " ";
       }

	}
	out.println("Thank you "+ str+ " for signing up!" + " <br/>");
	} else {
	out.println("<h2>No cookies founds</h2>");
	}
	
	out.print("<a href='index.html'> Go to Login </a>");
		
}
catch(Exception e)
{
	out.println(e);
}
%>
