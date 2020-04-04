<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
out.println("<center>");
Integer count=(Integer)session.getAttribute("count");
out.print("I have used session to pass the hit count : " + count + "<br/>" + "<br/>");
%>
<html>  
<head>  
<title>JSTL Example</title>  
</head>  
<body>  
<c:out value="${'I have used the JSTL core tag to print these!'}"/> 
  
  
<%
out.println("<center>");
out.println("<br/>" + "<br/>" +"<a href='marks.html'> Go to enter your marks </a>" + "<br/>	");
%>

</body>  
</html> 

