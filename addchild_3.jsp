<%@ page  import="java.sql.*" import="java.io.*" import="databaseconnection.*" %>

<%
String levels=request.getParameter("level2");
String[]temp=levels.split(",");

String level1=temp[0];
String level2=temp[1];


String level3=request.getParameter("level3");
%>
<%
int i=0;

Connection con1=databasecon.getconnection();
Statement st = con1.createStatement();
	try{
	i=st.executeUpdate("insert into child_3 values('"+level1+"','"+level2+"','"+level3+"')");
	response.sendRedirect("addactivity.jsp?id=level-3");
	}
	catch(Exception e)
	{
		System.out.println(e);
		return;
	}
	

%>	
<%@ include   file="footer.jsp"%>
