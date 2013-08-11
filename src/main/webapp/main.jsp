<%
/*
 * This file is part of JSPMyAdmin.
 * 
 * https://code.google.com/p/jsp-myadmin/
 * 
 * JSPMyAdmin is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * JSPMyAdmin is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with JSPMyAdmin.  If not, see <http://www.gnu.org/licenses/>.
 */
%>
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