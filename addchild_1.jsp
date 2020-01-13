<%@ page  import="java.sql.*" import="java.io.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>

<%
String level1=request.getParameter("level1");
%>
<%
int i=0;
Connection con1=databasecon.getconnection();
Statement st = con1.createStatement();
	try{
	i=st.executeUpdate("insert into child_1 values('"+level1+"')");
	response.sendRedirect("addactivity.jsp?id=level-1");
	}
	catch(Exception e)
	{
		System.out.println(e);
		return;
	}
	

%>	
<%@ include   file="footer.jsp"%>
