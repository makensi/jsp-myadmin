<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String newtblfields=request.getParameter("newtblfields");
String db=request.getParameter("db");
String table=request.getParameter("table");
boolean f=false;
String query="";
if (request.getParameter("col1")!="") {
		int length = Integer.parseInt(newtblfields);
		for(int i=1;i<=length;i++) {
			if (request.getParameter("col" + i)!= "" ) {
				if (query=="") {
					query= "\"" + request.getParameter("col" + i ) + "\"";
				} else {
					query=query+ ",\""+ request.getParameter("col" + i) + "\"";
				}
			} else {
				f=true;
				break;
			}
		}

		if (f==false) {
			query=" VALUES ("+ query;
			query=query+")";
			PreparedStatement pstm = con.prepareStatement("USE " + db);
			pstm.execute();
			pstm = con.prepareStatement("INSERT INTO " + table +query);
			pstm.executeUpdate(); 
		}
			
} else {
	f=true;
}
%>

<jsp:include page="tabledata.jsp"/>

<% if (f==false) { %>

	<script>success.show('<p>INSERT INTO <%= table %> <%= query %></p><p>1 Row Inserted</p>');</script>

<% } else { %>

	<script>error.show('Some fields are empty');</script>

<% } %>