<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.*"%>


<h2>Ranking</h2>

						<div class="alert alert-danger" role="alert">
							<strong>Rank(w) = tRank * xRank </strong> 
						</div>


<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st3=con.createStatement();
String Sql="select uid, uri,sum(impr),sum(context) from score group by uri   ";
ResultSet rs=st.executeQuery(Sql);
st3.executeUpdate("delete from score ");	

%><br>
<table width="100%" border cellpadding="10">						
<tr><th>URL ID<th>URL<th>tRank<th>xRank<th>Rank
<%
while(rs.next())
{	
		
		
	%>

	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%><td><%=rs.getFloat(3)%><td><%=rs.getFloat(4)%><td><%=rs.getFloat(3)*rs.getFloat(4)%>
	
	<%
st3.executeUpdate("insert into score values ('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getFloat(3)+"','"+rs.getFloat(4)+"','"+rs.getFloat(3)*rs.getFloat(4)+"')");	

}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}
response.sendRedirect("revisitation9.jsp");

%>
