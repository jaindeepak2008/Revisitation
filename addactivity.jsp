<%@ page  import="java.sql.*" import="databaseconnection.*" import="CT.*"%>

													  <%
                                                      String title="Add / View Activities";
													  %>

<%@ include   file="aheader.jsp"%>
										       <%
                                                       String message=request.getParameter("m");
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font color='red'><blink>You Entered String is dupicate</blink></font>");
                                                       }
													   message=request.getParameter("id");
                                                       if(message!=null )
                                                       {
                                                               out.println("<script type=text/javascript> alert('Activity Added !!');</script>");
                                                       }
                                               %>



<div>                                               
<hr>
<%
int count=0;
Connection con1=databasecon.getconnection();
//System.out.println(con1);
	Statement st = con1.createStatement();
	ResultSet rs=st.executeQuery("select * from child_1");
%>	


<CENTER><h2>
	Level 3
</h2></CENTER>
       
<table id="tab"  align="center" cellpadding="5"  >
<tr><th><font size="" color="#000"><b><b>SNo- <th><font size="" color="#000"><b>Level 3
<%while(rs.next())
	{
		%>
<tr><td><font size=	"" color="#009900"><%=++count%>
<td><font size=	"" color="#009900"><%=rs.getString(1)%>
<%
	}
%>	
<form method="post" action="addchild_1.jsp" >
<tr><td><td><input required  type="text" name="level1" placeholder="Enter " size="40"><input required  type="submit" value="   ADD  ">
</form>

<form method="post" action="remove_activity_1.jsp">
<tr><td><td><input required  type="submit" value="REMOVE">
</form>

</table id="tab" >
<hr>




<CENTER>
<h2>
	Level 2
</h2>
</CENTER>
<%
count=0;
	st = con1.createStatement();
	rs=st.executeQuery("select * from child_2");

%>	
<table id="tab"  align="center" cellpadding="5">
<tr><th><font size="" color="#000"><b>Sno</font><th><font size="" color="#000"><b>Level 3</font><th><font size="" color="#000"><b>Level 2</font>

<%
while(rs.next())
	{
		%>
	<tr><td><font size="" color="#7934d8"><%=++count%><td><font size="" color="#7934d8"><%=rs.getString(1)%><td><font size="" color="#7934d8"><%=rs.getString(2)%>

<%
	}
%>	
</table id="tab" >
	



<%
	st = con1.createStatement();
	rs=st.executeQuery("select * from child_1");

%>	
<form method="post" action="addchild_2.jsp">
           
<table id="tab"  align="center" cellpadding="5">
<tr><td><font size="" color="#000"><b>Select Status</font>
<tr><td><select name="level1">
<%
while(rs.next())
	{
		%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>

<%
	}
%>	

</select><br>
	
<tr><td><input required  type="text" name="level2"  placeholder="Enter activity" size="30"><input type="submit" value="   ADD  ">
<td><td>
</form>
</table id="tab" >
<hr>
<!-- **********************************************************88 -->



<CENTER>

<h2>Level 1
</h2>
</CENTER>

<%
count=0;
	st = con1.createStatement();
	rs=st.executeQuery("select * from child_3");

%>	
<font color="#bb0b5f">

<table id="tab"  align="center" cellpadding="5">
<tr><th><font size="" color="#bb0b5f"><b>Sno<th><font size="" color="#bb0b5f"><b>Level 3
 </font><th><font size="" color="#bb0b5f"><b>Level 2</font><th><font size="" color="#bb0b5f"><b>Level 1</font>

<%
while(rs.next())
	{
		%>
	<tr><td><%=++count%><td><%=rs.getString(1)%><td><%=rs.getString(2)%><td><%=rs.getString(3)%>

<%
	}
%>	
</table id="tab" >

<%
	st = con1.createStatement();
	rs=st.executeQuery("select * from child_2");

%>	
<form method="post" action="addchild_3.jsp">
           
<table id="tab"  align="center" cellpadding="5">
<tr><td><font size=	"" color="#bb0b5f"><b>Select Activity</font>
<tr><td><select name="level2">
<%
while(rs.next())
	{
		%>
	<option value="<%=rs.getString(1)%>,<%=rs.getString(2)%>"><%=rs.getString(2)%>

<%
	}
%>	

</select><br>
	
<tr><td><input type="text" name="level3" size="30" placeholder="Enter Application"><input type="submit" value="   ADD  ">
<td><td>
</form>
</font>
</table id="tab" ><hr>
</div>
</font>





<%@ include   file="footer.jsp"%>