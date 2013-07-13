<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");
String table=request.getParameter("table");
%>
<%@ include file="common/header.jsp"%>
<%
if (db!=null && db!="") {
	if (table!=null && table!="") {
		PreparedStatement pstm = con.prepareStatement("USE " + db);
		pstm.execute();
		String file = System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +table+".txt";
		String s="SELECT * INTO OUTFILE \'" + file + "\' FROM " + table;
		pstm = con.prepareStatement(s);
		pstm.execute(); %>

		<script type="text/javascript">success.show('Table <%= table %> outputed to <%= file %>.Successfully!');</script>

	<% } else { %>

		<script type="text/javascript">error.show('Please Select table then click on exportd');</script>

	<% }

} else { %>

	<script type="text/javascript">error.show('Please Select Database then click on export');</script>

<% } %>
<%@ include file="common/footer.jsp"%>