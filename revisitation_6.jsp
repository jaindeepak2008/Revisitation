
<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.*"%>


<h2>Ranking</h2>

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
<table width="100%" border cellpadding="10">						
<tr><th>URL ID<th>URL<th>Impr Score<th>Context Score
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
response.sendRedirect("revisitation_7.jsp");

%>
