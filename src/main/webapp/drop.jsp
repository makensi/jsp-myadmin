<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");
String table=request.getParameter("table");
String empty=request.getParameter("empty");
%>
<%@ include file="common/header.jsp" %>
<% if (empty == null || empty.isEmpty()) {
	if (db != null && table == null) {
		PreparedStatement pstm = con.prepareStatement("DROP DATABASE " + db);
		pstm.execute(); %>

		<script type="text/javascript">success.show('Database <%= db %> dropped successfully!');</script>

<% } else if (table != null) {
	PreparedStatement pstm = con.prepareStatement("USE " + db);
	pstm.execute();
	pstm = con.prepareStatement("DROP TABLE " + table);
	pstm.execute(); %>

	<script type="text/javascript">success.show('Table <%= table %> dropped successfully!');</script>

	<% }
} else if (db != null && table != null) { 
	PreparedStatement pstm = con.prepareStatement("USE " + db);
	pstm.execute();
	pstm = con.prepareStatement("DELETE FROM " + table);
	pstm.execute(); %>

	<script type="text/javascript">success.show('Table <%= table %> emptied successfully!');</script>

<% } %>
<%@ include file="common/footer.jsp"%>