<%@ page  import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.Vector"%>
<%
String 	content=(String)session.getAttribute("content");
%>

<h2>Impression Score Caluculation</h2>

						<div class="alert alert-warning" role="alert">
							<strong>Impression Score= {(Ratio of the time length(Len(w,d))+TFIDF)/2}</strong> 
						</div>

<br>
<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
st2.executeUpdate("delete from score");
String Sql="select * from context where  seconds>30 and user_='"+session.getAttribute("email")+"'  ";
String[] words=content.split("\\s+");
for(String w: words){
Sql=Sql+" and data_ like  '%"+w+"%' ";
}
System.out.println(Sql);
ResultSet rs=st.executeQuery(Sql);
%>
<table width="100%" border cellpadding="10">						
<tr><th>URL ID<th>URL<th>Ratio of the time length<th>TF-IDF Score<th>Impression Score
<%
int count=0;
String temp="";
while(rs.next())
{%>
	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%>

	<td><%=(rs.getDouble("seconds")/500)%>
		<%
	 words=content.split("\\s+");
		for(String ex:words)
		{
			count=count+CountWords.main(rs.getString("data_"),ex);
		}
//		out.println(count);
		%>

<%temp=rs.getString("data_");
	String[] tot=temp.split("\\s+");
//	out.println(tot.length);
	%>

	<td><%
	double d0=count;
	
	double d00=tot.length;
	double d1=(d0/d00);
	//out.println("d1="+d1);
	double d2=(Double)session.getAttribute("toturl");
	//	out.println("d2="+d2);
	double d3=(Integer)session.getAttribute("matched");
	//	out.println("d3="+d3);
	double d4=Math.log(d2/d3);
	//	out.println("d4="+d4);


	d4=d4*d1;
	out.println(d4);	
%>
<td><%

	double len=(rs.getDouble("seconds")/500);
	double d5=(len+d4)/2;
	out.println(d5);	
	
	st2.executeUpdate("insert into score values('"+rs.getString(1)+"','"+rs.getString(2)+"','"+d5+"','0.0','0.0')");
}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}
response.sendRedirect("revisitation_5.jsp");

%>
</table>
<br><br>
