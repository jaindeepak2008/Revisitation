
													  <%
                                                      String title="Feedback";
													  %>


<%@ include  file="uheader.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.*"   import="CT.*"  import="java.io.*" import="java.util.*"%>

<%
int tot=0;
try{
Connection con = databasecon.getconnection();
	
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) from score "); 
while(rs.next()){
	tot=rs.getInt(1);
}

}catch(Exception e){
System.out.println(e);
}
%><form method="post" action="feedback2.jsp">

<table align="left" id="tab">
<tr><tr>
	<td><h3>Total Links we provide you Q (n)</h4><td><input type="number" class="form-control" name="q" value="<%=tot%>" readonly size="60">
	<tr><td><h3>How Many You Visited <td><input type="number" class="form-control" name="u" max="<%=tot%>" min="0" size="60">
	<tr><td><h3>How Many You feel Relevant (m)<td><input type="number"  class="form-control"name="m" max="<%=tot%>" min="0" size="60">
	<tr><td><td><input class="form-control" type="submit" value="Submit">
</tr>
</table>
</div>
</form>
<br><br><br><br><br><br><br><br><br><br>
<%@ include  file="footer.jsp"%>
