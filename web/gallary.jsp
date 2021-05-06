<%-- 
    Document   : gallary
    Author     : Rahul
--%>

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
      <a class="active">Gallary</a>
      <a href="administrator.jsp">Admin</a>
      <a href="touroperator.jsp">Tour Operator</a>
      <a href="customertourist.jsp">Customer</a>
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
      <div style="text-align: right;">
            <form action="logout.jsp" method="post">
                <span style="font-size: 25px;">
                    <%  
                        try {
                            if(session.getAttribute("id").toString().equals(null)) {}
                            else { out.print(session.getAttribute("id").toString()); }     
                        } catch(Exception e) {  }
                    %>
                </span>
                <% try {
                    if(session.getAttribute("id").toString().equals(null)) {}
                    else { %><input type="submit" value="logout" /> <% }
                } catch(Exception expx) {} %>
            </form>
        </div>
                <hr>    
      <div class="body-container">
                  
        <h1 class="green">
          ITTS - Gallery
        </h1>
          <table width="100%" margin="10px">
              <tr>
                  <td width="50%"><image src="1.jpg" width="100%"></td>
                  <td><image src="2.jpg" width="100%"></td></tr>
              <tr><td><image src="3.jpg" width="100%"></td>
                  <td><image src="4.jpg" width="100%"></td></tr>
              <tr><td><image src="5.jpg" width="100%"></td>
                  <td><image src="6.jpg" width="100%"></td></tr>
              <tr><td><image src="7.jpg" width="100%"></td>
                  <td><image src="8.jpg" width="100%"></td></tr>
          </table>
          
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