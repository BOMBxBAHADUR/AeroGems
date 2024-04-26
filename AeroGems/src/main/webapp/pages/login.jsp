
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AeroGem | Login</title>
    <link rel="stylesheet" href="../stylesheets/login.css"/>
    
    
</head>
<body>
    <div class="background">
    <%
  	String errorMessage = (String) request.getAttribute("errorMessage");
  	if (errorMessage != null && !errorMessage.isEmpty() ){
  	%>
  	<p class="errormesage"> <%=errorMessage %>  </p>
  	<%
  	}
  	%>
  
  			
  			
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <form>
        <h3>Login Here</h3>

        <label for="email">Email</label>
        <input type="email" placeholder="Enter your Email" id="username" required>

        <label for="password">Password</label>
        <input type="password" placeholder="Enter your Password" id="password" required>

        <button>Log In</button>
        
        
        
   <div style="padding: 20px;">
            <p>Don't have an account? <a href="Register.jsp">Sign Up</a></p>
         </div>
         
   
    </form>
</body>
</html>
