<%
session.invalidate();%>

  <%
    String mm=request.getParameter("id");
  if(mm!=null && mm.equalsIgnoreCase("exp"))
    {
     out.println("<script type=text/javascript>alert('Sorry, your session expired, login again '); </script>");
     }
                                                       String m=request.getParameter("id");
                                                       if(m!=null && m.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<table><tr><td><font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Login Fail   !! </blink></font></h3></table>");
                                                       }
%>

													  <%
                                                      String title="User Login";
													  %>
													  <%@ include  file="header.jsp"%>

  <div class="container">
    <form method="post" action="ulogin.jsp" class="form-signin">
        <h3 class="form-signin-heading">User Login</h3>          
          <label for="inputEmail" class="sr-only">Email</label>
          <input type="text" name="uid" id="inputEmail" class="form-control" placeholder="Email address" onfocus="this.value = '';"  required="autofocus"><br>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" name="pwd" placeholder="Password" id="inputPassword" class="form-control" onfocus="this.value = '';"  required="" >
          <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
    </form>
    </div> <!-- /container -->
  </body>
</html>

													  <%@ include   file="footer.jsp"%>
