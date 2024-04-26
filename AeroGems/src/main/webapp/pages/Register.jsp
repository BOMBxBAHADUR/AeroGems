<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AeroGem | Registration</title>
<link rel="stylesheet" href="../stylesheets/register.css"/>
  </head>
  <body>
      <div class="background">
          <div class="shape"></div>
          <div class="shape"></div>
      </div>
      <form>
          <h3>Register Here</h3>
          <label for="name">Name</label> 
          <input type="text" placeholder=" Enter your name" id="name" required>
  
          <label for="email">Email</label>
          <input type="email" placeholder="Email" id="email" required>
          <label for="gender"> Gender</label>
          <select name="gender" id="gender" >
            <option  value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
          </select>
          <label for="phone">Phone</label>
          <input type="tel" placeholder="Enter your phone number" id="phone" name="phone" required>

          <label for="address">Address</label>
          <input type="text" placeholder="Enter your address" id="address" name="address" required>
  
          <label for="password">Password</label>
          <input type="password" placeholder="Password" id="password" name="phone" required>

          <label for="retype-password">Retype-Password</label>
          <input type="password" placeholder=" Type your Password again" id="retype-password"  name= "retype-password" required> 
  
          <button>Sign Up</button>
          <div style="padding: 20px;">
            <p>Already have an account? <a href="login.jsp">Sign in</a></p>
         </div>
         
         
      </form>
     
     
  </body>
  </html>
  