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
<%@ page import="java.util.regex.*" %>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");  
String table=request.getParameter("table");
String query1=request.getParameter("textarea");
String newtblname=request.getParameter("table");
String newtblfields=request.getParameter("newtblfields");
String path = request.getContextPath();
ResultSet rst = null ;
ResultSetMetaData rsmd = null;
%>

<%@ include file="common/header.jsp"%>

<script language="javascript" src="js/confirm.js" type="text/javascript"></script>

<%@ include file="header.jsp"%>	

<div class="row-fluid">

	<div class="span12">

		<% int num_rows=0;
		if (request.getParameter("row1col1")!=null) {
			String query="";	

			for(int i=1;i<=Integer.parseInt(newtblfields);i++) {
				if (request.getParameter("row" +i + "col1")!="") {
					if (query=="") {
						query=request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
					} else {
						query=query+ ","+ request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
					}
				} else{
					break;
				}
			}

			query="("+ query;
			query=query+")";

			PreparedStatement pstm = con.prepareStatement("USE " + db);
			rst=pstm.executeQuery();
			pstm = con.prepareStatement("CREATE TABLE " + newtblname + query);
			pstm.execute();
			%>

			<script type="text/javascript">success.show("Table: <%= newtblname%> created successfully!")</script>
					
		<% } 
		Integer modifiedRows = null;
		String columnnm,record;
		PreparedStatement pstm1 = con.prepareStatement("USE "+db);
		rst = pstm1.executeQuery();

		if (query1 == null || query1 == "" ) {
			pstm1 = con.prepareStatement("SELECT * FROM "+table);
		} else {
			pstm1 = con.prepareStatement(query1);
		}

		if(query1 != null && ( query1.contains("INSERT INTO") || query1.contains("DELETE FROM") || query1.contains("UPDATE ") )){
			modifiedRows = pstm1.executeUpdate();
		} else {
			rst= pstm1.executeQuery();
			rsmd = rst.getMetaData();
		}

		if (modifiedRows == null ) { %>	

		<table class="table table-bordered">
			<thead>
				<tr>
					<td>Action</td>

					<% for(int i=1;i<=rsmd.getColumnCount(); i++) { %>
						<% columnnm=rsmd.getColumnName(i).toString(); %>
					<td>
						<%= columnnm +"  " + rsmd.getColumnTypeName(i)+ "("+rsmd.getColumnDisplaySize(i)+")" %>
					</td>
					<% } %>

				</tr>
			</thead>

			<% while(rst.next()) { %>

			<tr>
				<td>
					<a href="javascript:dRecord('deletedata.jsp?db=<%=db%>&table=<%=table%>&field=<%=rsmd.getColumnName(1) %>&val=<%=rst.getString(1) %>')" class="btn" title="Delete Record">
						<i class="icon-trash" title="Delete Record"></i> 
					</a>
				</td>           
				<% 
				for(int i=1;i<=rsmd.getColumnCount(); i++) {
					record=rst.getString(i); %>
				<td>
					<%=record%>
				</td>

				<% } %>

			</tr>

			<% num_rows++; %>

		<% } %>
			
			<tfoot>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="<%= rsmd.getColumnCount() %>">
						<%=num_rows %> Row(s)
					</td>
				</tr>
			</tfoot>

		</table>

	</div>

</div>

<div class="row-fluid">

	<div class="span12">
		
		<form method="post" action="insertdata.jsp?newtblfields=<%=rsmd.getColumnCount()%>&db=<%=db %>&table=<%=table %>" class="form-horizontal">
			
			<fieldset>
				<legend>Insert new row</legend>
			
					<% for(int i=1;i<=rsmd.getColumnCount(); i++) { %>
						<div class="control-group">
							<label for="col<%=i%>" class="control-label"><%= rsmd.getColumnName(i) %></label>
							<div class="controls">
								<input type="text" name="<%="col" + i %>" placeholder="<%= rsmd.getColumnName(i) %>" maxlength="<%=rsmd.getColumnDisplaySize(i) %>">
							</div>
						</div>
					<% } %>

				<div class="control-group text-right">
					<button type="submit" name="insert" class="btn btn-primary">
						<i class="icon-plus icon-white"></i> Insert
					</button>	
				</div>

			</fieldset>
		</form>

	</div>

</div>

<% } else { %>	
	Modified rows <%= modifiedRows %>
<% } %>	

<%@ include file="common/footer.jsp"%>