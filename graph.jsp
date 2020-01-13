  <%
                                                      String title="Performanc Graph";
													  %>


<%@ include  file="aheader.jsp"%>


<%@ page import="databaseconnection.*" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.awt.*" %>

<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>



<%
String query="SELECT * from graph";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/revisitation", "com.mysql.jdbc.Driver","root","root");

dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createBarChart3D("Evaluation Graph", "", "",dataset, PlotOrientation.VERTICAL, true, true, true);
//E:\                
ChartUtilities.saveChartAsJPEG(new File("E://Apache Tomcat//webapps//Revisitation//images//graph.jpg"), chart, 800, 400);
%>

<center><img src="images/graph.jpg" width="800" height="450" border="0" alt=""></center>

<br><br><br>
<%@ include  file="footer.jsp"%>
