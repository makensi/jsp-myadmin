<%@ page language="java" pageEncoding="ISO-8859-1" errorPage="error.jsp" contentType="text/html"%>
<%@ page import="java.util.*" %>
<%@ include file="common/header.jsp" %>

<div class="row-fluid">

	<div class="span2 offset4">
		
		<p><img src="img/logo.png"></p>

		<form action="main.jsp" method="post" name="login" class="form-horizontal"> 
			
			<div class="control-group">
				<lable class="control-label">Username</lable>
				<div class="controls">
					<input type="text" placeholder="Username" name="user" value="">
				</div>
			</div>
			<div class="control-group">
				<lable class="control-label">Password</lable>
				<div class="controls">
					<input type="password" placeholder="Password" name="pass" value="">
				</div>
			</div>
			<div class="control-group">
				<lable class="control-label">Host</lable>
				<div class="controls">
					<input type="text" placeholder="Host" name="host" pattern="^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])|$|^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$" value="">
				</div>
			</div>
			<div class="control-group">
				<lable class="control-label">Port</lable>
				<div class="controls">
					<input type="number" placeholder="Port" name="port" value="">
				</div>
			</div>
			<div class="control-group text-right">
				<button type="submit" class="btn btn-primary" name="login">
					<i class="icon-ok-sign icon-white"></i> Connect
				</button>
			</div>
		</form>

	</div>

</div>

<script language="javascript">
$('form[name="login"]').bind('submit', function(event){
	console.log('login');
	var form = event.target,
	valid = true;

	if(form.user.value.length==0){
		error.show("Please enter username!");
		form.user.focus();
		valid = false;
	}
	if(form.host.value.length==0){
		error.show("Please enter host Name!");
		form.host.focus();
		valid = false;
	}

	if(form.port.value.length==0){
		error.show("Please enter port name!");
		form.port.focus();
		valid = false;
	}

	return valid;
});
</script>

<%@ include file="common/footer.jsp" %>