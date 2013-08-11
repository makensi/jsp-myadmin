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
<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String newtblfields=request.getParameter("newtblfields");
String db=request.getParameter("db");
String table=request.getParameter("table");
boolean f=false;
String query="";
if (request.getParameter("col1")!="") {
		int length = Integer.parseInt(newtblfields);
		for(int i=1;i<=length;i++) {
			if (request.getParameter("col" + i)!= "" ) {
				if (query=="") {
					query= "\"" + request.getParameter("col" + i ) + "\"";
				} else {
					query=query+ ",\""+ request.getParameter("col" + i) + "\"";
				}
			} else {
				f=true;
				break;
			}
		}

		if (f==false) {
			query=" VALUES ("+ query;
			query=query+")";
			PreparedStatement pstm = con.prepareStatement("USE " + db);
			pstm.execute();
			pstm = con.prepareStatement("INSERT INTO " + table +query);
			pstm.executeUpdate(); 
		}
			
} else {
	f=true;
}
%>

<jsp:include page="tabledata.jsp"/>

<% if (f==false) { %>

	<script>success.show('<p>INSERT INTO <%= table %> <%= query %></p><p>1 Row Inserted</p>');</script>

<% } else { %>

	<script>error.show('Some fields are empty');</script>

<% } %>