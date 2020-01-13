  <%
                                                      String title="History";
													  %>

<%@ include  file="uheader.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.*"   import="CT.*"  import="java.io.*" import="java.util.*"%>

<%
String temp="";
try{
Connection con = databasecon.getconnection();
		Set<String> set=new HashSet<String>();

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from context where user_='"+session.getAttribute("email")+"' order by uid desc");
while(rs.next()){
set=GetContext.main(rs.getString(1));

						%>
												<div class="blog-left-grids">
							<div class="blog-left-left">
								<img src="images/link.png" width="56" height="56" border="0" alt="">
							</div>
							<div class="blog-left-right">

								<div class="blog-left-right-top">
									<%=rs.getString("title_")%><br>
								<a href="http://<%=rs.getString("uri")%>"><%=rs.getString("uri")%></a> 
								</div>
								<div class="blog-left-right-bottom">
									
									<%
								temp=rs.getString("data_");	
								try{out.println(temp.substring(0,400));
								}catch(Exception e){
								out.println(temp);
								}
								%><br>
									

								
									<a href=""><%=rs.getString("date_")%></a>
									<a href=""><%=rs.getString("year_")%></a>
									<a href=""><%=rs.getString("month_")%></a>
									<a href=""><%=rs.getString("month2_")%></a>
									<a href=""><%=rs.getString("location")%></a>
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
		}
}catch(Exception e){
System.out.println(e);
}
						%>

<br><br><br><br><br>
<%@ include  file="footer.jsp"%>
