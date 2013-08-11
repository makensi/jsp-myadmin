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
<%@ page language="java" import="java.sql.*" errorPage="error.jsp"  contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%@ include file="functions.jsp"%>
<%
if (con==null) {
	response.sendRedirect("index.jsp");
}
String server=Host;   
PreparedStatement pstm = con.prepareStatement("SHOW DATABASES");
ResultSet rst = pstm.executeQuery();            
String[] dblist= null;
int num_dbs=0;
if( dblist == null ) {
	dblist=  new String[mysql_num_rows(rst)];
	while (rst.next()) {
		dblist[num_dbs]=rst.getString(1);
		num_dbs++;
	}
	rst.close();
} else {
	num_dbs = dblist.length;
}
%>
<%@ include file="common/header.jsp"%>

<img class="icon" src="img/logosml.png" alt="-">

<div class="span12">

	<h3>Options</h3>
	<ul class="nav nav-tabs nav-stacked">
		<li>
			<a href="welcome.jsp" target="jspmain">Home</a>
		</li>
	</ul>
	
	<h3>Databases</h3>
	<ul class="nav nav-tabs nav-stacked"> 
	<% for(int i=0; i<num_dbs; i++) { %> 
		<% String localdb = dblist[i]; %> 
		<li> 
			<a href="right.jsp?server=<%=server%>&amp;db=<%=localdb%>" target="jspmain">
				<%=localdb%>
			</a> 
		</li> 
	<% }  %> 
	</ul>
 
	<h3>Advanced</h3>
	<ul class="nav nav-tabs nav-stacked">
		<li><a href="createuser.jsp"><i class="icon-user"></i> Create User</a></li>
		<li><a href="tabledata.jsp?server=localhost&db=mysql&table=user"><i class="icon-user"></i> Privileges</a></li>
	</ul>

</div>

<%@ include file="common/footer.jsp"%>