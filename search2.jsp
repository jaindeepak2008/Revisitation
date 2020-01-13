													  <%@ page  import="java.sql.*" import="databaseconnection.*"   import="CT.*"  import="java.io.*" import="java.util.*"%>

<%


int i=1;

Set<String> set=Processer.main();
Connection con = databasecon.getconnection();
Statement st=con.createStatement();

//Procedure to set time for previous link
int uid=0;
try{
uid=(Integer)session.getAttribute("uid");
}catch(Exception e){}
	try{
if(uid!=0){
	String t1=(String)session.getAttribute("t1");
	String t2=TimeCalc.getTime();;
	long t3=TimeCalc.timeDiff(t1,t2);;
	if(t3<500){
		st.executeUpdate("update context set seconds='"+t3+"' where uid='"+uid+"' ")	;
	}
}
}catch(Exception e){
System.out.println("Sec update exception: "+e);
}
//end
try{

//Procedure to Generate uri id
ResultSet rs=st.executeQuery("select max(uid) from context");
if(rs.next())
{
	i=rs.getInt(1);
	++i;
}

System.out.println("----"+i);
}
catch(Exception e){
System.out.println("Exception Occured"+e);}
//end

Vector<String> v=CalendarDate.main();

String uri=request.getParameter("link");
session.setAttribute("uri", uri);
try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
Statement st2 = con1.createStatement();
//System.out.println("insert into context values ('"+i+"','"+uri+"','"+v.get(0)+"','"+v.get(1)+"','"+v.get(2)+"','"+v.get(3)+"','"+session.getAttribute("loc")+"','"+session.getAttribute("email")+"') ");

//inserting context values 

PreparedStatement ps=con1.prepareStatement("insert into context values(?,?,?,?,?,?,?,?,?,?,?)");
ps.setInt(1,i);
ps.setString(2,uri);
ps.setString(3,v.get(0));
ps.setString(4,v.get(1));
ps.setString(5,v.get(2));
ps.setString(6,v.get(3));
ps.setString(7,(String)session.getAttribute("loc"));
ps.setString(8,(String)session.getAttribute("email"));
ps.setInt(9,500);
ps.setString(10,GetText.main("http://"+uri));
ps.setString(11,GetText.title("http://"+uri));

ps.executeUpdate();



String temp="";

//matching with lamda values
ResultSet rs=st1.executeQuery("select * from child_3");
while(rs.next()){
temp=rs.getString(3);
temp=temp.toLowerCase();
for(String s1:set){
	s1=s1.toLowerCase();
	if(s1.contains(temp)){
	
		 st2.executeUpdate("insert into context2 values('"+i+"','"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+session.getAttribute("email")+"')");
	
		//:::::::::::End::::::::::::::::

	}
}
}

String t1=TimeCalc.getTime();
session.setAttribute("t1",t1);
session.setAttribute("uid",i);

response.sendRedirect("http://"+uri);
}catch(Exception e){
out.println(e.getMessage());
}
%>
