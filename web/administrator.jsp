<%-- 
    Document   : administrator
    Author     : Rahul
--%>

<%@page import="java.io.PrintWriter"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 

<% 
if(session.getAttribute("id") != null) {
        out.print("<script>"
                + "alert('Please logout as Traveller for using Admin Services!');"
                + "window.location = 'tourist-dashboard.jsp';"
                + "</script>");
        
    } 
    if(session.getAttribute("userid") != null) {
        out.print("<script>"
                + "alert('Please logout as Agency for using Admin Services!');"
                + "window.location = 'operator-dashboard.jsp';"
                + "</script>");
    }
    if(session.getAttribute("admin") != null) {
        response.sendRedirect("admin-dashboard.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>ITTS - A new way to enjoy your holidays</title>
    <link rel="stylesheet" href="slider.css" >
    <link rel="stylesheet" href="menu.css" >
    <link rel="stylesheet" href="body.css" >
    <link rel="stylesheet" href="footer.css" >
    <script src="slider.js"></script>
   
    <%
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    
    try {
    if(!(user.isEmpty() && pass.isEmpty())){
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from administrator where a_id = '"+ user + "' and  a_pass = '" + pass + "'";
        rs = st.executeQuery(sql);
        try {
            rs.next();
            if(rs.getString("a_id").equals(user) && rs.getString("a_pass").equals(pass)) {
                session.setAttribute("admin", user);
                Cookie login = new Cookie("login", user);
                login.setMaxAge(60*60*24);
                response.addCookie(login);
                response.sendRedirect("admin-dashboard.jsp");
            } 
        }catch(Exception e) {
            Cookie login = new Cookie("admin", "false");
            login.setMaxAge(60*60*24);
            response.addCookie(login);
            out.print("<script>alert('incorrect details'); </script>");
        }
    }
    }catch(Exception ex){ }
%>   

  </head>
  <body>

    <!--Menu's -->
    <div class="topnav">
      <a href="index.jsp">Home</a>
      <a href="gallary.jsp">Gallary</a>
      <a class="active">Admin</a>
      <a href="touroperator.jsp">Tour Operator</a>
      <a href="customertourist.jsp">Customer</a>
      <a href="reservation.jsp">Reservation</a>
      <a href="contactus.jsp">Contact Us</a>
      <a href="aboutus.jsp">About Us</a>
    </div> 

    <!-- Slider -->
    <div class="slideshow-container" style="height: 70%;">
      <div class="mySlides fade">
        <center>
          <img src="1.jpg" style="height: 100%;">
          <div class="text">
            ITTS - new way to book holidays
          </div>
        </center>
      </div>
    
      <div class="mySlides fade">
        <center>
          <img src="2.jpg" style="height: 100%;">
          <div class="text">
           ITTS - new way to book holidays
          </div>
        </center>
      </div>
      
      <div class="mySlides fade">
        <center> 
          <img src="3.jpg" style="height: 100%;">
          <div class="text">
            ITTS - new way to book holidays
          </div>
        </center>
      </div>
      
      <!-- Next and previous buttons -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>
    
    <br>
    <div class="body-container">
            
      <div class="reg-form">
      <h1>Login</h1>
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="login.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="#" method="post">
                    <fieldset>
                    <legend>Admin Login</legend>
                    <input type="text" name="error" value="Incorrect Details!" hidden>
                    <label for="user">UserName</label><br>
                    <input type="text" name="user" required />
                    <br>
                    <lable for="password"> Password </lable><br>
                    <input style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" type="password" name="pass" required />
                    <br>
                    <br>
                <input type="submit" value="Login" onClick=""/>
                </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>

    </div>
    <br>
    <br>
    <br>
    <!--Footer-->
    <div class="body-container">
      <center>
        <h2>
          &copy; All rights reserved by RAHUL
        </h2>
      </center>
    </div>
  </body>
</html>
