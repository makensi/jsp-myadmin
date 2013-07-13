<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");
String table=request.getParameter("table");
String field=request.getParameter("field");
String val=request.getParameter("val");

PreparedStatement pstm = con.prepareStatement("USE " + db);
pstm.execute();
pstm = con.prepareStatement("DELETE FROM " + table + " WHERE "+ field + "='" + val +"'");
pstm.executeUpdate();
%>
<jsp:include page="tabledata.jsp"/>
<script type="text/javascript">success.show('1 Row Deleted');</script>