  <%
                                                      String title="Performance Metrics";
													  %>


<%@ page import="java.sql.*,databaseconnection.*"%>

<%@ include  file="aheader.jsp"%>



<p>The web revisitation performance metrics include  pages’ finding rate, average precision, average recall and average rank error for a set of re-finding requests.</p></CENTER>
<CENTER>
<table id="tab"><tr>
<%Connection ccc=databasecon.getconnection();
	Statement ss = ccc.createStatement();
		
	String sss = "select * from feedback ";
	double v1=0.0;
		double v2=0.0;
			double v3=0.0;
	ResultSet rs=ss.executeQuery(sss);
	while(rs.next()){
	%>
	
	
	<tr><td>FindRate(Q) <em>[1/Q]</em><td><% v1=(1/rs.getDouble("q"));%><%=v1%>
	
	<tr><td>AvgPrecision(Q) <em>[(m/n)/Q]</em><td><%  v2=(rs.getDouble("m")/rs.getDouble("n"))/rs.getDouble("q");%><%=v2%>
	
	<tr><td>AvgRecall(Q) <em>[(m/u)/Q]</em><td><% v3=(rs.getDouble("m")/rs.getDouble("u"))/rs.getDouble("q");%><%=v3%>
	

	<%
	}

	ss.executeUpdate("delete from graph");
	ss.executeUpdate("insert into graph values ('0','"+v1+"','"+v2+"','"+v3+"')");

%>
</table>
</CENTER>

<br><br>

<CENTER><button class="btn btn-lg btn-primary btn-block" style="width: 15%" onclick="window.location='graph.jsp'">Graph</button></CENTER>
<br>
<%@ include  file="footer.jsp"%>