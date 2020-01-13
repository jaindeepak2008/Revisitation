<%
session.invalidate();%>
	                  <%
                                                       String id=request.getParameter("id");
                                                       if(id!=null && id.equalsIgnoreCase("exp"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Sorry, your session expired, login again '); </script>");
                                                       }

			
	           
                                                       String m=request.getParameter("m");
                                                       if(m!=null && m.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Login Fail   !! </blink></font></h3>");
                                                       }
%>
  <%
                                                      String title="Admin Login";
													  %>
													  <%@ include  file="header.jsp"%>

    <div class="container">
		<form method="post" action="alogin.jsp" class="form-signin">
    		<h3 class="form-signin-heading">Admin Login</h3>		
      		<label for="inputEmail" class="sr-only">User ID</label>
			<input type="text" name="uid" id="inputEmail" class="form-control" placeholder="User ID" onfocus="this.value = '';"  required="autofocus"><br>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" name="pwd" placeholder="Password" id="inputPassword" class="form-control" onfocus="this.value = '';"  required="" ><br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
		</form>
    </div> <!-- /container -->
  </body>
</html>
													  <%@ include  file="footer.jsp"%>
