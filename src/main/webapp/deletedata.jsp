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
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");
String table=request.getParameter("table");
String field=request.getParameter("field");
String val=request.getParameter("val");

PreparedStatement pstm = con.prepareStatement("USE " + db);
pstm.execute();
pstm = con.prepareStatement("DELETE FROM " + table + " WHERE "+ field + "='" + val +"'");
pstm.executeUpdate();
%>
<jsp:include page="tabledata.jsp"/>
<script type="text/javascript">success.show('1 Row Deleted');</script>