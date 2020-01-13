<%@ page  import="java.sql.*,databaseconnection.*"%>
<%

	int n = Integer.parseInt(request.getParameter("q"));	
	int u = Integer.parseInt(request.getParameter("u"));	
	int m = Integer.parseInt(request.getParameter("m"));	

Connection ccc=databasecon.getconnection();
	Statement ss = ccc.createStatement();
		System.out.println("update feedback set n=n+"+n+", u=u+"+u+" , m=m+"+m+", q=q+1  ");
	ss.executeUpdate("update feedback set n=n+"+n+", u=u+"+u+" , m=m+"+m+", q=q+1  ");
	response.sendRedirect("revisitation9.jsp?id=succ");

%>

       
