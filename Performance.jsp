  <%
                                                      String title="Performance Metrics";
													  %>

<%@ page import="java.sql.*,databaseconnection.*"%>

<%@ include  file="aheader.jsp"%>


The web revisitation performance metrics include  pages’ finding rate, average precision, average recall and average rank error for a set of re-finding requests.
<br>
<table id="tab">
<%Connection ccc=databasecon.getconnection();
	Statement ss = ccc.createStatement();
		
	String sss = "select * from feedback ";
	
	ResultSet rs=ss.executeQuery(sss);
	while(rs.next()){
	%>
	<tr>	<tr><td>No of user’s web revisitation request Q<td><%=rs.getString("q")%>
	<tr><td>No of result pages n<td><%=rs.getString("n")%>
	<tr><td>No of target pages (clicked) u<td><%=rs.getString("u")%>
	<tr><td>No of relevant result pages m<td><%=rs.getString("m")%>
	<%
		
	}
%>
<form method="post" action="Performance2.jsp">

	<tr><td><td><CENTER><button class="btn btn-lg btn-primary btn-block"  type="submit">Caluculate</button></CENTER>
</form>
</table></CENTER>
<br><br><br>
<%@ include  file="footer.jsp"%>