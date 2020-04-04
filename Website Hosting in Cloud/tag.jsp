<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
 
out.println("<center>");
Integer hitsCount = (Integer)application.getAttribute("hitCounter");
if( hitsCount ==null || hitsCount == 0 ) {
   /* First visit */
   out.println("Welcome to your dashboard!" + "<br/>" + "<br/>");
   hitsCount = 1;
} else {
   /* return visit */
   out.println("Welcome back to your dashboard!" + "<br/>" + "<br/>");
   hitsCount += 1;
}
out.println("Application implicit object is used for hit count!"+ "<br/>" + "<br/>");

out.println("Hit Count is "+ hitsCount + "<br/>" + "<br/>");
application.setAttribute("hitCounter", hitsCount);

session.setAttribute("count",hitsCount);

%>

<html>  
<body>  
<%! int five=5; %>
<%= "I have used Expression tag!" %> 

<%
out.print("<br/>" + "<br/>" + "<a href='jstl.jsp'>JSTL</a>" + "<br/>" + "<br/>");
%>
</body>  
</html>  