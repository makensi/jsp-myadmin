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
String empty=request.getParameter("empty");
%>
<%@ include file="common/header.jsp" %>
<% if (empty == null || empty.isEmpty()) {
	if (db != null && table == null) {
		PreparedStatement pstm = con.prepareStatement("DROP DATABASE " + db);
		pstm.execute(); %>

		<script type="text/javascript">success.show('Database <%= db %> dropped successfully!');</script>

<% } else if (table != null) {
	PreparedStatement pstm = con.prepareStatement("USE " + db);
	pstm.execute();
	pstm = con.prepareStatement("DROP TABLE " + table);
	pstm.execute(); %>

	<script type="text/javascript">success.show('Table <%= table %> dropped successfully!');</script>

	<% }
} else if (db != null && table != null) { 
	PreparedStatement pstm = con.prepareStatement("USE " + db);
	pstm.execute();
	pstm = con.prepareStatement("DELETE FROM " + table);
	pstm.execute(); %>

	<script type="text/javascript">success.show('Table <%= table %> emptied successfully!');</script>

<% } %>
<%@ include file="common/footer.jsp"%>