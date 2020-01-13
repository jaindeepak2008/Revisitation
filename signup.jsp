<%@ page   import="databaseconnection.*" %>
<%@ page import="java.io.*,java.sql.*"%>
<%
                                                       String m=request.getParameter("m");
                                                      String title="NEW USER REGISTRATION";
													  %>
													  <%@ include  file="header.jsp"%>
	<%
                                                       if(m!=null && m.equalsIgnoreCase("dup"))
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Duplicate Email  !! </blink></font></h3>");
                                                       }
%>
 <form name="reg" action="signup1.jsp" method="get"   name="pwForm" >
					                  <%
                                                       String id=request.getParameter("id");
                                                       if(id!=null&&!id.equals("fail") )
                                                       {
                                                               out.println("<blink><h2>Registration Success ! <br> <font color=orange size=+2>Your User Id:: <font color=#009900>"+id+" </blink></font></font></font></h2><br>");
                                                       }
													   else {%>
												
                                               <%}%>


	<table ALIGN="CENTER" id="tab"><tr><td>
		<!--strong>First Name</strong><BR>-->
						<div class="opinion">
						<input type="text"  name="name" id = "name" placeholder="First Name"   required ></div>
						<tr><td>
		<!--<strong>Name</strong><BR>-->
						<input type="text"  name="lname" id = "lname" placeholder="Last Name"   required >
						<tr><td>
		<!--<strong>Address</strong><br>-->
						<input type="text" name="addr" id = "addr"  placeholder="Address" required >
						<tr><td>
		<!--<strong>City</strong><br>-->
						<input type="text" name="city" id = "addr"   placeholder="City" required >
						<tr><td>
		<!--<strong>Zip</strong><br>-->
						<input type="text" 	pattern="[0-9]*" minlength="6" maxlength="6" id="zip" placeholder="Zip Code"   required   name="zip">
						<tr><td>
		<!--<strong>Country</strong><br>-->
						<input type="text" 	 required   placeholder="Country" name="country">
						<tr><td>
		<!--<strong>Email</strong><br>-->
						<input type="email" name="email" id="email"  placeholder="Email address" required >
						<tr><td>

						<select name="">
							<option value="Male" selected>Male
							<option value="Female">Female
						</select>
						
<tr><td><br>
		<!--<strong>Contact no</strong><br>-->
						<input type="text" name="tele"   placeholder="Phone No"	pattern="[0-9]*" minlength="10" maxlength="10"   required >
						<tr><td>
		<!--<strong>Password</strong><br>-->
						<input type="password" name="pwd" id="pwd" placeholder="Password"  required  > 
						<tr><td><br>
		<CENTER><button class="btn btn-lg btn-primary btn-block" type="submit">Register</button></CENTER>
					<!--'opinion?'-->
			</form>
		</table>
	</div>
			


				
<%@ include  file="footer.jsp"%>
