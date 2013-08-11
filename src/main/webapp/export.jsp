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
%>
<%@ include file="common/header.jsp"%>
<%
if (db!=null && db!="") {
	if (table!=null && table!="") {
		PreparedStatement pstm = con.prepareStatement("USE " + db);
		pstm.execute();
		String file = System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +table+".txt";
		String s="SELECT * INTO OUTFILE \'" + file + "\' FROM " + table;
		pstm = con.prepareStatement(s);
		pstm.execute(); %>

		<script type="text/javascript">success.show('Table <%= table %> outputed to <%= file %>.Successfully!');</script>

	<% } else { %>

		<script type="text/javascript">error.show('Please Select table then click on exportd');</script>

	<% }

} else { %>

	<script type="text/javascript">error.show('Please Select Database then click on export');</script>

<% } %>
<%@ include file="common/footer.jsp"%>