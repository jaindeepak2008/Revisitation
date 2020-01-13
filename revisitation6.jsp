  <%
                                                      String title="Ranking";
													  %>


<%@ include  file="uheader.jsp"%>
<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.*"%>


						<div class="alert alert-danger" role="alert">
							<strong>Adding the content and context scores those URI's (Page Id's) are same.</strong> 
						</div>

<br>
<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
String Sql="select * from score  ";
ResultSet rs=st.executeQuery(Sql);
%>
<table width="100%" border cellpadding="10" id="tab">						
<tr><th>URL ID<th>URL<th>Content Score<th>Context Score
<%
while(rs.next())
{	
		
	%>

	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%><td><%=rs.getString(3)%><td><%=rs.getString(4)%>
	
	<%

}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}

%>
</table>
<br><br>
<div class="opinion">

<form method="post" action="revisitation7.jsp">
<h3><input type="submit" Value="Merge"></h2>
</form>
</div><br><br>
<%@ include  file="footer.jsp"%>
