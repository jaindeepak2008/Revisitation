<%@ page  import="java.sql.*" import="databaseconnection.*" %>

  <%
                                                      String title="Re-Visitation";
													  %>
													
<%@ page  import="java.sql.*" import="databaseconnection.*" %>


<%@ include  file="uheader.jsp"%>


<style>
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 12px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
<body>
<div class="opinion">
<form method="post" action="revisitation1.jsp" name="form2" id="form2" onsubmit="return validate()">
	
<h1> Web Revisitation by Context and Content Keywords</h1><br><br>
<table width="100%" id="tab"> <tr><td>       
<input type="text" name="context" id="ids"  required  readonly placeholder="Enter Context Keywords" />
<td><input type="text" name="content" required placeholder="Enter Content Keywords" />
<td><input type="submit" value="Revisit">&nbsp;<input type="reset" value="Clear">
</table>
<br>

</center>
</div>
<table background="#fff" cellpadding="10">

<tr ><td valign="top"><h4>Time</h4>
<%try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
	
String sss1 = "select Distinct year_ from context  where user_='"+session.getAttribute("email")+"'  ";

	ResultSet rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}%>


<%sss1 = "select Distinct month_ from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}%>
<%sss1 = "select Distinct month2_ from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container">
<%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}	%>







<td valign="top"><h4>Location</h4>


<%sss1 = "select Distinct location from context  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>
	<%}	%>





<tr><td valign="top"><h4>&lambda;3</h4>
<%sss1 = "select Distinct lamda3 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}	%>


	
<td valign="top"><h4>&lambda;2</h4>
<%sss1 = "select Distinct lamda2 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>

<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}	%>

	
<td valign="top"><h4>&lambda;1</h4>
<%sss1 = "select Distinct lamda1 from context2  where user_='"+session.getAttribute("email")+"'  ";

	 rs=st1.executeQuery(sss1);
	while(rs.next())
	{
%>
<label class="container"><%=rs.getString(1)%>
<input type="checkbox" name="id"  onclick="checkBox()" value="<%=rs.getString(1)%>">
<span class="checkmark">
</span>
</label>

	<%}	%>


<%
}catch(Exception e){}

%>



</table>

<script>
function checkBox() {
var id = document.forms[0];
var txt = "";
var i;
for (i = 0; i < id.length; i++) {
if (id[i].checked) {
txt = txt + id[i].value + "; ";
}
}
if(txt.length>0)
	{
	document.getElementById("ids").value =  txt;
}

}
</script>
<script>
function validate() {
    submitFlag = true;
    if(document.form2.ids.value.length<8)  {
        submitFlag=false;
        alert("Choose some Context Options");
    }
	
	
    return submitFlag;
}
</script>
</form>


<br><br><br><br><br><br>
<%@ include  file="footer.jsp"%>