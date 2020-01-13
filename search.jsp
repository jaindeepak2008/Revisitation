													  <%
                                                      String title="User Home Page";
													  %>
<%@ include  file="uheader.jsp"%>

			<div class="agile-blog-grids">
				<div class="col-md-8 agile-blog-grid-left">


<%@ page  import="java.sql.*" import="java.util.Vector" import="databaseconnection.*"  import="CT.*" %>
<%
String ip=GetMyIPAddress.main();
String loc="";
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
Statement st2 = con1.createStatement();
ResultSet rs=st1.executeQuery("select * from location where email='"+session.getAttribute("email")+"' and ip='"+ip+"' ");
if(rs.next()){
loc=rs.getString(3);
session.setAttribute("loc", loc);
}else{
%>

<script>
    var txt;
    var dip = prompt("Found New Location, Please Enter Location Name:", "");
    if (dip == null || dip == "") {
window.location="search.jsp";

	} else {
window.location="locstore.jsp?id="+dip;
  }
</script>

<%
}

Vector<String> v=CalendarDate.main();
%>

          
              <form method="post" action="search1.jsp">
                   
                   <center>
				   
				   <table><tr><tr><td>    <img src="images/logo.png" width="90%"><td><input name="search" type="text" class="form-control"  placeholder="Enter your keywords.."  size="100">
                    


                    <button type="submit" onclick="search1.jsp" id="submit" value="Search">Search</button>
</table>
                </div>
              </form>
<br>
				




<%@ include  file="footer.jsp"%>