<%@ page language="java" import="java.sql.*,java.lang.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%> 
<%@ include file="functions.jsp"%>  
<%
String db=request.getParameter("db");  
String server=request.getParameter("server");
DatabaseMetaData dbmd = con.getMetaData();
String[] tablelist= null;
PreparedStatement pstm = con.prepareStatement("SHOW TABLES FROM "+db);
ResultSet rst = pstm.executeQuery();
tablelist= new String[mysql_num_rows(rst)];
int num_tables=0;        
while (rst.next()) {
	tablelist[num_tables]=rst.getString(1);
	num_tables++;
}
%>
<%@ include file="common/header.jsp"%>
<%@ include file="header.jsp"%>

<div class="row-fluid">

	<div class="span12">

		<table class="table table-bordered">
			<thead>
				<tr>
					<td>#</td>
					<td>Table</td>
					<td>Action</td>
					<td>Records</td>
					<td>Type</td>
					<td>Collation</td>
				</tr>
			</thead>
			
			<% for(int m=0; m<num_tables; m++) { %>
				<% String localtable = tablelist[m]; %>
			
			<tbody>
				<tr>
					<td>
						<input type="checkbox" name="kk">
					</td>
					<td>
						<a href="tabledata.jsp?server=<%=server%>&db=<%=db%>&table=<%=localtable%>" target="jspmain"><%=localtable%></a>
					</td>
					<td class="btn-toolbar">
						<div class="btn-group">

							<a href="tabledata.jsp?server=<%=server%>&db=<%=db%>&table=<%=localtable%>" target="jspmain" class="btn" title="Show data">
								<i class="icon-pencil" title="Show data"></i>
							</a>
							<a href="createtbl.jsp?newtblname=<%=localtable %>&db=<%=db %>&alter=yes" class="btn" title="Alter table">
								<i class="icon-wrench" title="Alter table"></i>
							</a>
							<a href="drop.jsp?table=<%=localtable %>&db=<%=db %>&empty=yes" class="btn" title="Truncate">
								<i class="icon-trash" title="Truncate table"></i>
							</a>
							<a href="drop.jsp?table=<%=localtable %>&db=<%=db %>" class="btn" title="Drop table">
								<i class="icon-remove" title="Drop table"></i>
							</a>

						</div>
					</td>
					<td>
						<%
						pstm = con.prepareStatement("USE "+db);
						pstm.execute();
						pstm = con.prepareStatement("SELECT COUNT(*) \"count\" FROM "+localtable);
						rst = pstm.executeQuery();
						String rows="";
						while (rst.next()) {
							rows=rst.getString(1);
						} %>
						<%=rows %>
					</td>
					<td>
						<%
						pstm = con.prepareStatement("USE "+db);
						pstm.execute();
						pstm = con.prepareStatement("SHOW TABLE STATUS");
						rst = pstm.executeQuery();
						rows="";
						while (rst.next()) {
							rows=rst.getString(2);
						}
						%>
						<%=rows %>
					</td>
					<td>		 
						<%
						pstm = con.prepareStatement("USE "+db);
						pstm.execute();
						pstm = con.prepareStatement("SHOW TABLE STATUS");
						rst = pstm.executeQuery();
						rows="";
						while (rst.next()){
						rows=rst.getString(15);
						}
						%>
						<%=rows %>
					</td>
				</tr>
			<% } %>
			</tbody>
				
			<tr>
				<td>&nbsp;</td>
				<td colspan="5">
					<%=num_tables%>  table(s)
				</td>
			</tr>
			
		</table>

		<form action="createtbl.jsp?db=<%=db %>" method="post" name="createtbl" class="form-horizontal">

			<fieldset>
				<legend>Create new table</legend>
			</fieldset>

			<div class="control-group">
				<label for="newtblname" class="control-label">Name</label>
				<input type="text" name="newtblname" placeholder="Name" maxlength="<%=dbmd.getMaxTableNameLength() %>">
			</div>
			
			<div class="control-group">
				<label for="newtblfields" class="control-label">Number of Fields</label>
				<input type="number" name="newtblfields" placeholder="Number of fields" maxlength="<%= String.valueOf(dbmd.getMaxColumnsInTable()).length() %>">
			</div>

			<div class="control-group text-right">
				<button type="submit" class="btn btn-primary" name="create">
					<i class="icon-ok-sign icon-white"></i> Create
				</button>
			</div>

		</form>

	</div>

</div>

<script language="javascript"> 
//  check for valid numeric strings  
function IsNumeric(value){
	return (!/\D/.test(value));
}
$('form[name="createtbl"]').bind('submit', function(event){
	var form = event.target,
	valid = true;
	if (form.newtblfields.value.length == 0) {
		error.show("Please Enter Number of Table Columns");
		form.newtblfields.focus();
		valid = false;
	} 
	else if (form.newtblname.value.length == 0) {
		error.show("Please Enter Table Name!");
		form.newtblname.focus();
		valid = false;
	}  
	else if (IsNumeric(form.newtblfields.value) == false) {
		error.show("Invalid Number of Table Columns!");
		form.newtblfields.focus();
		valid = false;
	}
	return valid;
});
</script> 

<%@ include file="common/footer.jsp"%>
