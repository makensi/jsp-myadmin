<%@ page isErrorPage="true" import="java.util.*" %> 
<%@ include file="common/header.jsp"%>
<% application.log(request.getRequestURI()+request.getQueryString(), exception); %>
<div class="span12">
	<h1>Error</h1>
	<div class="alert alert-error">
		<p><b>The exception was</b>: <%=exception.toString()%></p>
		<p><b>The exception class was</b>: <%=exception.getClass()%></p>
	</div>
</div>

<%@ include file="common/footer.jsp"%>