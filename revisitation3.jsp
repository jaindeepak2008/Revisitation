  <%
                                                      String title="TfIdf Caluculation";
													  %>


<%@ include  file="uheader.jsp"%>
<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.Vector"%>
<%
String 	content=(String)session.getAttribute("content");
%>



						<div class="alert alert-danger" role="alert">
							<strong>Tfidf= {(Total times Words Appear "<%=content%>"/ Total Words) * log(Total URL's / Macthed URL's) } </strong> 
						</div>


<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
String Sql="select * from context where  seconds>30 and user_='"+session.getAttribute("email")+"'  ";
String[] words=content.split("\\s+");
for(String w: words){
Sql=Sql+" and data_ like  '%"+w+"%' ";
}
System.out.println(Sql);
ResultSet rs=st.executeQuery(Sql);
%>
<table width="100%" border cellpadding="10" id="tab">						
<tr><th>URL ID<th>URL<th>Words Count<th>Total Words<th>Macthed URL's<th>Total URL'S<th>TF-IDF Score
<%
int count=0;
String temp="";
while(rs.next())
{%>
	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%>
	<td>	<%
	 words=content.split("\\s+");
		for(String ex:words)
		{
			count=count+CountWords.main(rs.getString("data_"),ex);
		}
		out.println(count);
		%>

	<td><%temp=rs.getString("data_");
	String[] tot=temp.split("\\s+");
	out.println(tot.length);
	%>
	<td><%=session.getAttribute("matched")%>
	<td><%=session.getAttribute("toturl")%>
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

}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}

%>
</table>
<br><br>
<div class="opinion">

<form method="post" action="revisitation4.jsp">
<h3><input type="submit" Value="tRank"></h2>
</form>
</div><br><br>
<%@ include  file="footer.jsp"%>
