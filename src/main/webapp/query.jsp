<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");
String table=request.getParameter("table");
String server=request.getParameter("server");
%>

<%@ include file="common/header.jsp"%>

<%@ include file="header.jsp"%>

<div class="span12">

	<p>Run SQL query/queries on database : <%= db %></p>

	<form action="tabledata.jsp?db=<%=db %>" name="query" method="post" class="form-horizontal">
		<div class="control-group">
			<textarea id="query" name="textarea" rows="10" class="span12"></textarea>
		</div>
		<div class="control-group text-right">
			<button type="submit" class="btn btn-primary" name="go">
				<i class="icon-ok-sign icon-white"></i> Go
			</button>
		</div>

	</form>

</div>

<script language="javascript">
$('form[name="query"]').bind('submit', function(event){
	var form = event.target,
	valid = true;
	if(form.textarea.value.length==0){
		error.show("Please enter SQL Query!");
		form.textarea.focus();
		valid = false;
	}
	return valid;
});
</script>

<%@ include file="common/footer.jsp"%>
