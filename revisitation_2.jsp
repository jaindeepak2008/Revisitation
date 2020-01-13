<%@ page  import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="Search.*" import="java.io.*" import="java.util.Vector"%>


<h2>Ratio of the time length. Len(w,d)</h2>

						<div class="alert alert-info" role="alert">
							<strong>Len(w,d)= {Visitation time length / Maximal
Time length} where Maximal Time length=500 sec</strong> 
						</div>
<br>

<%
String 	content=(String)session.getAttribute("content");
System.out.println(content);
try{
Connection con = databasecon.getconnection();
System.out.println(con);
Statement st=con.createStatement();
String Sql="select * from context where  seconds>30 and user_='"+session.getAttribute("email")+"'  ";
System.out.println(Sql);
String[] words=content.split("\\s+");
System.out.println(words);
for(String w: words){
Sql=Sql+" and data_ like  '%"+w+"%' ";
}
System.out.println(Sql);
System.out.println(st);
ResultSet rs=st.executeQuery(Sql);
System.out.println(rs);

%>
<table width="100%" border cellpadding="10">						
<tr><th>URL ID<th>URL<th>Visitation time<th>Maximal time<th>Len(w,d)
<%
int count=0;
String temp="";
while(rs.next())
{%>
	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%><td><%=rs.getString("seconds")%> Seconds<td>500 Seconds<td><%=(rs.getDouble("seconds")/500)%>
<%
}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}

response.sendRedirect("revisitation_3.jsp");

%>
