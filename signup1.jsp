<%@ page  import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<%
Connection cx=databasecon.getconnection();
Statement ssx = cx.createStatement();

String email1 = request.getParameter("email");
String sx = "select * from users where email='"+email1+"'";

ResultSet rx = ssx.executeQuery(sx);
if(rx.next()){
	//error
	response.sendRedirect("signup.jsp?m="+"dup");
}
else {
	
}
%>


<%
int id=0;
Connection ccc=databasecon.getconnection();
	Statement ss = ccc.createStatement();
		
	String sss = "select max(uid) from users ";
	ResultSet r=ss.executeQuery(sss);
	if(r.next())
	{
		id=r.getInt(1);

		id++;
	}
	

%>

<% 


ResultSet rs=null;

PreparedStatement ps=null;

	String name = request.getParameter("name");
		String lname = request.getParameter("lname");
	String pwd = request.getParameter("pwd");


	String email = request.getParameter("email");	
	String tele = request.getParameter("tele");
	String city = request.getParameter("city");
	String zip = request.getParameter("zip");
String addr = request.getParameter("addr");


	String gen = request.getParameter("gen");


	String country = request.getParameter("country");
       try
                {	  

Connection con=databasecon.getconnection();
ps=con.prepareStatement("INSERT INTO users(uid,name,lname,pwd,email,tele,country,city,zip,gen,addr)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			//////////////////////////////////////////////////

ps.setInt(1,id);
ps.setString(2,name);
ps.setString(3,lname);
ps.setString(4,pwd);
ps.setString(5,email);
ps.setString(6,tele);
ps.setString(7,country);
ps.setString(8,city);
ps.setString(9,zip);
ps.setString(10,gen);
ps.setString(11,addr);

int s = ps.executeUpdate();

response.sendRedirect("signup.jsp?id="+email);

}

catch(Exception ex){

out.println("Error in connection : "+ex);

}




%>
       
