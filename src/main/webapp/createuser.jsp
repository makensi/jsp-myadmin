<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String user=request.getParameter("user");
String pass=request.getParameter("pass");
DatabaseMetaData dbmd = con.getMetaData();
%>
<%@ include file="common/header.jsp"%>
<% if (user!=null && pass!=null && !user.isEmpty() && !pass.isEmpty()){ %>

	<%
		PreparedStatement pstm = con.prepareStatement("USE mysql");
		pstm.execute();
		pstm = con.prepareStatement("CREATE USER '"+ user + "'@'" + session.getAttribute("host") + "'");
		pstm.executeUpdate();
		pstm = con.prepareStatement("GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON *.* TO "+ user + "@'%' IDENTIFIED BY '" + pass+ "'");
		pstm.execute();
		pstm = con.prepareStatement("FLUSH PRIVILEGES");
		pstm.execute();
	%>
	
	<script>success.show('User <%= user %> created successfully with connect and resource grant!');</script>

<% } else { %>

	<fieldset class="span2">

		<legend>New user</legend>

		<span class="help-block">Enter username and password (Note: User will be given Select, Insert, Update, Delete, Create And Drop Grant Automatically)</span>

		<form action="createuser.jsp" name="createuser" method="post" class="form-horizontal">
			<div class="control-group">
				<label for="" class="control-label">Username</label>
				<div class="controls">
					<input type="text" name="user" maxlength="<%=dbmd.getMaxUserNameLength() %>">
				</div>
			</div>
			<div class="control-group">
				<label for="" class="control-label">Password</label>
				<div class="controls">
					<input type="password" name="pass">
				</div>
			</div>
			<div class="control-group">
				<div class="controls text-right">
					<button type="submit" name="create" class="btn btn-primary">
						<i class="icon-plus icon-white"></i> Create
					</button>
				</div>
			</div>
		</form>

	</fieldset>

<% } %>

<script language="javascript">
	$('form[name="createuser"]').bind('submit', function validate(event){
		var form = event.target,
			result = true;
		if(form.user.value.length==0){
			error.show("Please enter user name!");
			form.user.focus();
			result = false;
		}
		if(form.pass.value.length==0){
			error.show("Please enter password!");
			form.pass.focus();
			result = false;
		}
		return result;
	});
</script>

<%@ include file="common/footer.jsp"%>