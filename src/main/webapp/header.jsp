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
<%
String[] uriSplitted = request.getRequestURI().split("/");
String uri = uriSplitted[uriSplitted.length-1];
boolean isTable = (request.getParameter("table")!=null && !request.getParameter("table").isEmpty());
String tableName = "";
if(isTable){
	tableName = request.getParameter("table");
} 
%>
<div class="span12">
	<ul class="breadcrumb">
		<li>
			<a href="welcome.jsp">Server: <%= request.getParameter("server") %></a>
			<i class="icon-chevron-right"></i>
		</li>
		<li <%= isTable ? "" : "class=\"active\"" %>>
			<a href="right.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db") %>">	Database: <%= request.getParameter("db") %>
			</a>
			<% if(isTable) { %>
				<i class="icon-chevron-right"></i>
			<% } %>
		</li>
		<% if (isTable) { %>
		<li class="active">
			<a href="tabledata.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db") %>&table=<%=request.getParameter("table") %>">
				Table: <%= request.getParameter("table") %>
			</a>
		</li>
		<% } %>
	</ul>
</div>

<div class="span12">
	<ul class="nav nav-tabs">
		<li class="<%= uri.equals("right.jsp")? "active" : "" %>">
			<a href="right.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>">
				Structure
			</a>
		</li>
		<li class="<%= uri.equals("query.jsp")? "active" : "" %>">
			<a href="query.jsp?server=<%=request.getParameter("server")%>&db=<%=request.getParameter("db")%>">
				Query
			</a>
		</li>
		<li class="<%= uri.equals("tabledata.jsp")? "active" : "" %>">
			<a href="tabledata.jsp?server=localhost&db=mysql&table=user">
				<%= !tableName.isEmpty() && !tableName.equals("user")  ? "Data" : "Privileges" %>
			</a>
		</li>
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				More options <b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<% if (isTable){ %>
					<script type="text/javascript">
						function dTable(url){
							var retcode = true;
							retcode = confirm('Are you sure, you want to delete the table with all the data?');
							
							if (retcode) {
							    window.location.href = url;
							}
						}

						function dData(url){
							var retcode = true;
							retcode = confirm('Are you sure, you want to delete all the data in table?');

							if (retcode) {
							    window.location.href = url;
							}
						}

						function dRecord(url){
							var retcode = true;
							retcode = confirm('Are you sure, you want to delete the record?');

							if (retcode {
							    window.location.href = url;
							}
						}
					</script>
					<li>
						<a href="export.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>">
							Export
						</a>
					</li>
					<li>
						<a href="javascript:dData('drop.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>&empty=yes')" target="jspmain">
							Drop data in <%=request.getParameter("table")%>
						</a>
					</li>
					<li>
						<a href="javascript:dTable('drop.jsp?db=<%=request.getParameter("db")%>&table=<%=request.getParameter("table")%>')" target="jspmain">
							Drop data and table <%=request.getParameter("table")%>
						</a>
					</li>
				<% } else { %>
					<script type="text/javascript">
						function dDatabase(url){
							var retcode = true;
							retcode = confirm('Are you sure, you want to delete the database?');

							if (retcode) {
							   window.location.href = url;
							}
						}
					</script>
					<li>
						<a href="javascript:dDatabase('drop.jsp?db=<%=request.getParameter("db")%>')" target="jspmain">
							Drop database <%=request.getParameter("db")%>
						</a>
					</li>
				<% } %>
			</li>
		</li>
	</ul>
</div>