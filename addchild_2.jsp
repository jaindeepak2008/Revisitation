<%@ page  import="java.sql.*" import="java.io.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>

<%
String level1=request.getParameter("level1");
String level2=request.getParameter("level2");
%>
<%
int i=0;


Connection con1=databasecon.getconnection();
Statement st = con1.createStatement();
	try{
	i=st.executeUpdate("insert into child_2 values('"+level1+"','"+level2+"')");
	response.sendRedirect("addactivity.jsp?id=level-2");

	}
	catch(Exception e)
	{
		System.out.println(e);
		return;
	}
	

%>	
<%@ include   file="footer.jsp"%>
