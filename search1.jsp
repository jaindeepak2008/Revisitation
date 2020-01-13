													  <%
                                                      String title="Search Results";
													  %>

<%@ include  file="uheader.jsp"%>
<%@ page import="org.jsoup.nodes.Element" import="java.sql.*" import="databaseconnection.*"  import="Search.*" import="java.io.*" import="java.util.Vector"%>

<%
String 	key=request.getParameter("search");

Vector v=new Vector();
v=Search.main(key);
	
%>
<h1> Search Results</font></h2>
<%
	File f=new File("SearchResults.txt");
	FileReader fr=new FileReader(f);
	BufferedReader br=new BufferedReader(fr);
		String s=br.readLine();
		%>
		
		<table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td>
		<table cellspacing="10">
<%		while(s !=null)
		{
			%>
			
			<tr><td><font size="+1" color=""><%=s%></font>&nbsp;
<%			s=br.readLine();


		}


%>
</table></table>
<%@ include  file="footer.jsp"%>
