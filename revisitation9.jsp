  <%
                                                      String title="Final Web Ranking Results";
													  %>

<%@ include  file="uheader.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.*"   import="CT.*"  import="java.io.*" import="java.util.*"%>

<%
    String message=request.getParameter("id");
    if(message!=null && message.equalsIgnoreCase("succ")){
    out.println("<script type=text/javascript>alert('Thank you for your Feedback !!')</script>");
	}
 %>
<%
String key=(String)session.getAttribute("content");
String[] keys=key.split("\\s+");
String temp="";
try{
Connection con = databasecon.getconnection();
		Set<String> set=new HashSet<String>();

Statement st=con.createStatement();
Statement st2=con.createStatement();
ResultSet rs2=null;

ResultSet rs=st.executeQuery("select * from score order by rank desc "); 
while(rs.next()){
rs2=st2.executeQuery("select * from context where uid='"+rs.getString(1)+"' ");
while(rs2.next()){
set=GetContext.main(rs.getString(1));
							%>
					<div class="blog-left-grids">
							<div class="blog-left-left">
								<img src="images/link.png" width="56" height="56" border="0" alt="">
							</div>
							<div class="blog-left-right">

								<div class="blog-left-right-top">
									<%=rs2.getString("title_")%><br>
									<a href="http://<%=rs2.getString("uri")%>"><%=rs2.getString("uri")%></a><br>
								</div>
								<div class="blog-left-right-bottom">
									<%
								temp=rs2.getString("data_");	
								try{
										
									temp=temp.substring(0,600);
									temp=temp.toLowerCase();
									for(String s:keys){
									temp=temp.replaceAll(s,"<b><u>"+s+"</u></b>");
									}
					
									out.println(temp);
								
								
								
								}catch(Exception e){
								out.println(temp);
								}
								%>
<br>
								
									<a href=""><%=rs2.getString("year_")%></a>
									<a href=""><%=rs2.getString("month_")%></a>
									<a href=""><%=rs2.getString("month2_")%></a>
									<a href=""><%=rs2.getString("location")%></a>
									<%for(String s: set){
									%>
									<a href=""><%=s%></a>
									
									<%
									}%>
								</div>

							</div>
							<div class="clearfix"> </div>
						</div>
						<br>

							<%
		}}
}catch(Exception e){
System.out.println(e);
}
						%>
<table align="right">
<tr>
	<td><a href="feedback.jsp"><img src="images/feedback.png" width="250" height="100" border="0" alt=""></a></td>
</tr>
</table>
<br><br><br><br><br>
<%@ include  file="footer.jsp"%>
