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
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1" %>
<%
String User = null;     
String Pass = null;
String Host = null;
String Port = null;     		
Class.forName("com.mysql.jdbc.Driver");
Connection con=null;
  	
try {
	User = (String)session.getAttribute("user");
	Pass = (String)session.getAttribute("pass");
	Host = (String)session.getAttribute("host");
	Port = (String)session.getAttribute("port");
	con=DriverManager.getConnection("jdbc:mysql://"+Host +":" + Port,User,Pass);
} catch (Exception e){
	response.sendRedirect("index.jsp");
}
%>