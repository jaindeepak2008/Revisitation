													  <%
                                                      String title="Session Details";
													  %>

<%@ include  file="uheader.jsp"%>


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
window.location="u_home.jsp";

	} else {
window.location="locstore.jsp?id="+dip;
  }
</script>

<%
}

Vector<String> v=CalendarDate.main();
%>
						<ul>
							<li>Location: <%=loc%></li>
							<li>IP Address: <%=ip%></li>
							<li>Year: <%=v.get(0)%></li>
							<li>Month: <%=v.get(1)%></li>
							<li><%=v.get(2)%></li>
							<li>Date: <%=v.get(3)%></li>
							
						</ul>


<%@ include  file="footer.jsp"%>