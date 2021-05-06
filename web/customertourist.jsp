<%-- 
    Document   : customertourist
    Author     : Rahul
--%>

<% if(session.getAttribute("id") != null) {
        response.sendRedirect("tourist-dashboard.jsp");
    }  
    if(session.getAttribute("admin") != null) {
        out.print("<script>"
                + "alert('Please logout for security reason!');"
                + "window.location = 'admin-dashboard.jsp';"
                + "</script>");
    }
    if(session.getAttribute("userid") != null) {
        out.print("<script>"
                + "alert('Logout as Agency for using Tourist Services');"
                + "window.location = 'operator-dashboard.jsp';"
                + "</script>");
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
   
  </head>
  <body>

    <!--Menu's -->
    <div class="topnav">
      <a href="index.jsp">Home</a>
      <a href="gallary.jsp">Gallary</a>
      <a href="administrator.jsp">Admin</a>
      <a href="touroperator.jsp">Tour Operator</a>
      <a class="active">Customer</a>
      <a href="reservation.jsp">Reservation</a>
      <a href="contactus.jsp">Contact Us</a>
      <a href="aboutus.jsp">About Us</a>
      <a href="testimonials.jsp">Testimonials</a>
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
      <h1>Register Tourist</h1>
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="register.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="ProcessTouristRegister.jsp" method="post">
                    <fieldset>
                    <legend>Tourist Registration</legend>
                    <label for="name">Name</label><br>
                    <input type="text" name="name" required />
                    <br>
                    <label for="userid">UserName (ID)</label><br>
                    <input type="text" name="id" required />
                    <br>
                    <lable for="contact"> Contact Number <small>(9999999999)</small></lable><br>
                    <input type="tel" name="contact"  pattern="[0-9]{10}" required />
                    <br>
                    <label for="address">Address </label><br>
                    <input type="text" name="address" required />
                    <br>
                <input type="submit" value="Register" />
                Already have an account?<a href="TouristLogin.jsp" style="text-decoration: none; font-weight: bold;"> Login</a>
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