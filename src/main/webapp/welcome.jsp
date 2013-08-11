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
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="login.jsp" %>
<%
String server=Host;
PreparedStatement pstm = con.prepareStatement("SHOW STATUS");
ResultSet rst = pstm.executeQuery();
DatabaseMetaData dbmd = con.getMetaData();
String i="1";
%>
<%@ include file="common/header.jsp"%>

<div class="row-fluid">

	<div class="span12">

		<h1>My SQL Information</h1>

		<ul class="nav nav-tabs nav-stacked">
			<li>
				<a href="#">
					<i class="icon-tags"></i> <b>Server Version</b>: <%=dbmd.getDatabaseProductVersion() %>
				</a>
			</li>
			<li>
				<a href="#"><i class="icon-globe"></i> <b>Server</b>: <%=dbmd.getDatabaseProductName()%>
				</a>
			</li>
			<li>
				<a href="#"><i class="icon-user"></i> <b>User</b>: <%=dbmd.getUserName() %>
				</a>
			</li>
		</ul>

		<form action="createdb.jsp?mknewdb=<%=i %>" method="post" name="newdbname" class="form-horizontal"> 

			<fieldset>
				<legend>Create new database</legend>
				<div class="control-group">
					<div class="control-label">Database name</div>
					<div class="controls">
						<input type="text" name="newdbname" placeholder="Database name" maxlength=<%=dbmd.getMaxTableNameLength() %> >
					</div>
				</div>
				<div class="control-group text-right">
					<button type="submit" class="btn btn-primary" name="create">
						<i class="icon-ok-sign icon-white"></i> Create
					</button>
				</div>
			</fieldset>

		</form>

	</div>

</div>

<div class="row-fluid">

	<div class="span12">

		<h2>JSP MyAdmin Information</h2>

	</div>

</div>

<div class="row-fluid">

	<div class="span4">
		<ul class="nav nav-tabs nav-stacked"> 
			<li>
				<a href="#"><i class="icon-tags"></i> <b>Version</b>: 1.1 </a>
			</li>
			<li>
				<a href="http://code.google.com/p/jsp-myadmin/" target="_blank"><i class="icon-globe"></i> Google Code Project</a>
			</li>
		</ul>
	</div>
	<div class="span4">
		<ul class="nav nav-tabs nav-stacked"> 
			<li>
				<a href="#"><i class="icon-user"></i> <b>Contributer</b>: Jaswant Singh </a>
			</li>
			<li>
				<a href="mailto:bagheljas@yahoo.com"><i class="icon-envelope"></i> bagheljas@yahoo.com</a>
			</li>
			<li>
				<a href="http://www.linkedin.com/in/jaswantsingh" target="_blank"><i class="icon-globe"></i>
					LinkedIn: www.linkedin.com/in/jaswantsingh
				</a>
			</li>
		</ul>
	</div>
	<div class="span4">
		<ul class="nav nav-tabs nav-stacked"> 
			<li>
				<a href="#"><i class="icon-user"></i> <b>Creator</b>: Ankit Sharma </a>
			</li>
			<li>
				<a href="mailto:ankit_sam2001@yahoo.com"><i class="icon-envelope"></i> ankit_sam2001@yahoo.com</a>
			</li>
			<li>
				<a href="http://in.linkedin.com/in/ankitsharma2001" target="_blank"><i class="icon-globe"></i>
					LinkedIn: in.linkedin.com/in/ankitsharma2001
				</a>
			</li>
		</ul>
	</div>

</div>

<script language="javascript">
$('form[name="newdbname"]').bind('submit', function validate(event){
	var form = event.target,
		valid = true;
	if(form.newdbname.value.length==0){
		error.show("Please enter Database Name!");
		form.newdbname.focus();
		valid = false;
	}
	return valid;
});
</script>

<%@ include file="common/footer.jsp"%>