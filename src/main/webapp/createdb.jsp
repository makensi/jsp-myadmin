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
<%@ include file="common/header.jsp"%>
<%
String newdbname=request.getParameter("newdbname");
String mknewdb=request.getParameter("mknewdb");
%>
<% if (newdbname == null || newdbname.isEmpty()) { %>

	<script>error.show('Please Insert Database Name');</script>

<% } else if (newdbname!=null) { %>
	
	<%
		PreparedStatement pstm = con.prepareStatement("CREATE DATABASE " + newdbname);
		pstm.execute();
	%>
	<script>success.show('Database <%= newdbname %> created Successfully!');</script>

<div class="row-fluid">

	<div class="span2 offset4">
		<fieldset>
			<legend>Create new table</legend>

			<form name="createtable" action="createtbl.jsp?db=<%=newdbname %>" method="post" class="form-horizontal">

				<div class="control-group">
					<label class="control-label" for="newtblname">Name</label>
					<div class="controls">
						<input type="text" name="newtblname" placeholder="Table name">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="newtblfields">Number of columns</label>
					<div class="controls">
						<input type="number" name="newtblfields" placeholder="Number of columns">
					</div>
				</div>
				<div class="control-group text-right">
					<button type="submit" name="create" class="btn btn-primary">
						<i class="icon-plus icon-white"></i> Create
					</button>
				</div>

			</form>

		</fieldset>
	</div>

</div>

<% } %>

<script language="javascript">
	//  check for valid numeric strings	
	function isNumeric(value) {
		return (!/\D/.test(value));
	}

	$('form[name="createtable"]').bind('submit', function validate(event){
		var form = event.target,
			result = true;
		if (form.newtblfields.value.length == 0) {
			error.show("Please enter No. of columns");
			result = false;
		} else if (isNumeric(form.newtblfields.value) == false) {
			error.show("Invalid No. of columns!");
			result = false;
		}
		return result;
	});
</script>

<%@ include file="common/footer.jsp"%>