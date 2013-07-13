<%@ page language="java"  errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%
String host = "";
if(request.getMethod().equalsIgnoreCase("post")){
	session.setAttribute("user",request.getParameter("user"));
	session.setAttribute("pass",request.getParameter("pass"));
	session.setAttribute("host",request.getParameter("host"));
	session.setAttribute("port",request.getParameter("port"));
	host = request.getParameter("host");
} // Only if user enters the credentials otherwise it is available in the session object.		
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title><%= host %> | JSPMyAdmin</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		
	</head> 

<% if(!host.isEmpty()){ %>

	<frameset cols="240,*" rows="0" border="0" frameborder="no"> 
	  <frame src="left.jsp" name="nav">
	  <frame src="welcome.jsp" name="jspmain">  
	</frameset>
	<body></body>

<% } else {  %>

	<body>
		<script language="javascript">
			parent.location.href = 'index.jsp';
		</script>
	</body>

<% } %>

</html>