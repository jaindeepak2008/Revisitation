													  <%
                                                      String title="User Home Page";
													  %>

<%@ include  file="uheader.jsp"%>

			<div class="agile-blog-grids">
				<div class="col-md-8 agile-blog-grid-left">


<%@ page  import="java.sql.*" import="java.util.Vector" import="databaseconnection.*"  import="CT.*" %>

<%try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
	
%>
<div class="grid_3 grid_5 wow fadeInUp animated" data-wow-delay=".5s">
						<br><br>
						<h3 class="hdg">Tabs</h3>
						<br><br><br>
						<CENTER><div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#location" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Place Tree</a></li>
								<li role="presentation"><a href="#time" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Time Tree</a></li>
								<li role="presentation"><a href="#activity" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Activity Tree</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="location" aria-labelledby="home-tab">
									
			<%
			String sss1 = "select Distinct location from context  where user_='"+session.getAttribute("email")+"'  ";

	ResultSet rs=st1.executeQuery(sss1);
	while(rs.next())
	{

			%>									
									<p><li class="list-group-item"><%=rs.getString(1)%></p>
								
<%}%>								
								</div>
								<div role="tabpanel" class="tab-pane fade" id="time" aria-labelledby="profile-tab">
				
									
<%sss1 = "select Distinct year_ from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>

<%sss1 = "select Distinct month_ from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>

<%sss1 = "select Distinct month2_ from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>


								</div>

							
							
							<div role="tabpanel" class="tab-pane fade" id="activity" aria-labelledby="profile-tab">
				
									
<%sss1 = "select Distinct lamda3 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>

<%sss1 = "select Distinct lamda2 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>

<%sss1 = "select Distinct lamda1 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
		<p><li class="list-group-item"><%=rs.getString(1)%></p>
	
	<%}%>


								</div>
							
							
							</div>
						</div></CENTER>
					</div>

					
					
	<%
	}catch(Exception e){}
	%>				
					
					
					
					</div>
					</div>

	
	<%@ include  file="footer.jsp"%>
