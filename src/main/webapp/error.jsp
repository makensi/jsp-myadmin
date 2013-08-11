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