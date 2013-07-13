<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String temp;
String columnnm;
String db=request.getParameter("db");
String alter=request.getParameter("alter");
String newtblname=request.getParameter("newtblname");
String newtblfields=request.getParameter("newtblfields");
DatabaseMetaData dbmd = con.getMetaData();
int m;
%>
<%@ include file="common/header.jsp"%>
<% if (newtblname=="") { %>

	<script>error.show('Please insert table name');</script>

<% } else if (alter!=null && !alter.isEmpty()) { %>
	
	<%
		PreparedStatement pstm1 = con.prepareStatement("USE" + db);
		ResultSet rst =pstm1.executeQuery();
		pstm1 = con.prepareStatement("SELECT * FROM "+newtblname);
		rst= pstm1.executeQuery();
		ResultSetMetaData rsmd = rst.getMetaData();
	%>

<div class="row-fluid">
	
	<div class="span12">

		<form action="tabledata.jsp?db=<%=db %>&table=<%=newtblname %>&newtblfields=<%=rsmd.getColumnCount() %>" method="post" class="form-horizontal">

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Field</th>
						<th>Type</th>
						<th>Length</th>
						<th>Constraints</th>
					</tr>
				</thead>
				<tbody>
				<% for(m=1; m<=rsmd.getColumnCount(); m++) { %>

					<tr>
						<td><%= m %></td>
						<%temp="row" + m + "col1";%>
						<td>
							<input type="text" name="<%= temp %>" maxlength="<%= dbmd.getMaxColumnNameLength() %>" value="<%=rsmd.getColumnName(m)%>">
						</td>
						<%temp="row" + m + "col2";%>
						<td>
							<select name="<%= temp %>"> 
								<option selected="selected"><%=rsmd.getColumnTypeName(m).toString()%></option>
								<option>VARCHAR</option>
								<option>DATE</option>
								<option>TINYINT</option>
							</select>
						</td>
						<%temp="row" + m + "col3";%>
						<td>
							<input type="text" name="<%=temp%>" value="<%=rsmd.getColumnDisplaySize(m)%>">
						</td>
						<%temp="row" + m + "col4";%>
						<td>
							<select name="<%= temp %>">
								<option>Select one</option>
								<option>PRIMARY KEY</option>
								<option>NULL</option>
								<option>NOT NULL</option>
							</select>
						</td>

					</tr>

				<% } %>
				</tbody>
			</table>

			<div class="text-right">
				<button type="submit" name="create" class="btn btn-primary">
					<i class="icon-random icon-white"></i> Alter
				</button>
			</div>

		</form>

	</div>

</div>

<% } else if (newtblfields.length() == 0 ) { %>

	<script>error.show('Please insert table fields');</script>

<% } else if (Integer.parseInt(newtblfields) > dbmd.getMaxColumnsInTable() ) { %>

	<script>error.show('Please enter column no. less than <%= dbmd.getMaxColumnsInTable() %>');</script>

<% } else { %>

<div class="row-fluid">
	
	<div class="span12">

		<form action="tabledata.jsp?db=<%=db %>&table=<%=newtblname %>&newtblfields=<%=newtblfields %>" method="post" class="form-horizontal">

			<table class="table table-bordered">
				<thead>
					<tr>
						<td>#</td>
						<td>Field</td>
						<td>Type</td>
						<td>Length</td>
						<td>Constraints</td>
					</tr>
				</thead>
				<tbody>
				<% for(m=1; m<=Integer.parseInt(newtblfields); m++) { %>

					<tr>
					<td><%= m %></td>
					<%temp="row" + m + "col1";%>
					<td>
						<input type="text" name="<%=temp %>" maxlength="<%=dbmd.getMaxColumnNameLength() %>">
					</td>
					<%temp="row" + m + "col2"; %>	
					<td >
						<select name="<%=temp%>">
							<option>VARCHAR</option>
							<option>DATE</option>
							<option>TINYINT</option>
						</select>
					</td>
					<%temp="row" + m + "col3";%>
					<td>
						<input type="text" name="<%= temp %>">
					</td>
					<%temp="row" + m + "col4";%>
					<td>
						<select name="<%=temp %>">
							<option>Select one</option>
							<option>PRIMARY KEY</option>
							<option>NULL</option>
							<option>NOT NULL</option>
						</select>
					</td>

					</tr>
				<% } %>
			</table>

			<div class="text-right">
				<button type="submit" name="create" class="btn btn-primary">
					<i class="icon-plus icon-white"></i> Create
				</button>
			</div>

		</form>

	</div>

</div>

<% } %>

<%@ include file="common/footer.jsp"%>