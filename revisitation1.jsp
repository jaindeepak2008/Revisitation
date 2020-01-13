  <%
                                                      String title="Content Extraction and Management Module";
													  %>

<%@ include  file="uheader.jsp"%>
<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="Search.*" import="java.io.*" import="java.util.Vector"%>



						<div class="alert alert-success" role="alert">
							<strong>From history collected URL's those minimum 30 sec access time.</strong> 
						</div>
<br>

<%
String 	content=request.getParameter("content");
String 	context=request.getParameter("context");
session.setAttribute("content",content);
session.setAttribute("context",context);


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
					<div class="grid_3 grid_5 wow fadeInUp animated" data-wow-delay=".5s">
						
<%
int count=0;
String temp="";
while(rs.next())
{%>
<h3>
<span class="label label-default"><%=++count%>.</span>
<font size="" color="#2e58eb"><%				
								temp=rs.getString("title_");	
								try{out.println(temp.substring(0,37)+"..");
								}catch(Exception e){
								out.println(temp);
								}
								%>
</span>&nbsp;
<font size="" color="#1fc734"><%temp=rs.getString("uri");	
								try{out.println(temp.substring(0,50)+"..");
								}catch(Exception e){
								out.println(temp);
								}
								%></span>&nbsp;
<font size="" color="#e005bf"><%=rs.getString("date_")%></span>
<font size="" color="#cd7718"><%=rs.getString("seconds")%> Seconds</span>
</h3>
<%
}
rs=st.executeQuery("select count(*) from context where  seconds>30 and user_='"+session.getAttribute("email")+"'  ");
rs.next();
session.setAttribute("toturl",rs.getDouble(1));

session.setAttribute("matched",count);
}catch(Exception e){
System.out.println("Sec update exception: "+e);
}

%><br><br>
<div class="opinion">

<form method="post" action="revisitation2.jsp">
<h3><input type="submit" Value="Time Ratio"></h2>
</form>

</div><br><br>
<CENTER><button class="btn btn-lg btn-primary btn-block" onclick="window.location='revisitation_2.jsp'" style="width: 40%">SKIP TO FINAL</button></CENTER>
<%@ include  file="footer.jsp"%>
