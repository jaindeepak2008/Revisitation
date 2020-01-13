<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="CT.*" import="java.io.*" import="java.util.*"%>
<%
String context=(String)session.getAttribute("context");
ArrayList<String> arrlist = new ArrayList<String>();
String[] tmp=context.split(";");
for(String t: tmp){

	arrlist.add(t.trim());
	System.out.println(t.trim());

}
   
   // use add() method to add elements in the list


%>

<h2>Context Score Caluculation</h2>

						<div class="alert alert-danger" role="alert">
							<strong>Context Score= exponential(-&lambda;&#8730;t-t0); where &lambda1=0.05,&lambda2=0.025,&lambda3=0.004</strong> 
						</div>

<br>
<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st3=con.createStatement();
Statement st2=con.createStatement();
String Sql="select * from score  ";
ResultSet rs=st.executeQuery(Sql);
ResultSet rs2=null;
%>
<table width="100%" border cellpadding="10">						
<tr><th>URL ID<th>URL<th>t-t0<th>Access Context<th>xRank
<%
int count=0;
float sc=1.0f;
float val=0.0f;
float t_t0=0.0f;

String temp="";
while(rs.next())
{	
		
	%>
	<tr><td><%=rs.getString(1)%><td><%=rs.getString(2)%>
	
	<%
rs2=st2.executeQuery("select * from context where uid='"+rs.getString(1)+"' ");
while(rs2.next()){
t_t0=(float)CalendarDate.dateDiff(rs2.getString("date_"));
%>
<td><%=t_t0%> Days<td>
<%
	temp=rs2.getString("year_");
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0f*0.5f*Math.exp(-0.004f*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b>: "+val+"<br>");
	sc=sc*val;
	} 

	temp=rs2.getString("month_");
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*0.5*Math.exp(-0.025*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 

	
	temp=rs2.getString("month2_");
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*0.5*Math.exp(-0.05*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 


	temp=rs2.getString("location");
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*0.5*Math.exp(-0.05*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 


}	
	
	//-----------------------------------------------
rs2=st2.executeQuery("select distinct(lamda3) from context2 where uid='"+rs.getString(1)+"' ");
while(rs2.next()){
%>
<%
	temp=rs2.getString(1);
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*Math.exp(-0.004*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 
	}

rs2=st2.executeQuery("select distinct(lamda2) from context2 where uid='"+rs.getString(1)+"' ");
while(rs2.next()){
%>
<%
	temp=rs2.getString(1);
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*Math.exp(-0.025*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 
	}

rs2=st2.executeQuery("select distinct(lamda1) from context2 where uid='"+rs.getString(1)+"' ");
while(rs2.next()){
%>
<%
	temp=rs2.getString(1);
	temp=temp.trim();
	if(arrlist.contains(temp)){
	val=(float)(1.0*Math.exp(-0.05*Math.sqrt(t_t0)));
	out.println("<b>"+temp+" </b> : "+val+"<br>");
	sc=sc*val;
	} 
	}

%>
<td><%=sc%>


<%	
st3.executeUpdate("update score set context="+sc+" where uid='"+rs.getString(1)+"' ");	


	
	
	
	
	

}


}catch(Exception e){
System.out.println("Sec update exception: "+e);
}

response.sendRedirect("revisitation_6.jsp");

%>
