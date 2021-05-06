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
      <a href="customertourist.jsp">Customer</a>
      <a href="reservation.jsp">Reservation</a>
      <a class="active">Contact Us</a>
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
        ITTS - Contact US
      </h1>
      <p style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: 20px;">
        ITTS is a leading tour & travel management company that offers a comprehensive suite of customized corporate
         travel management services to international clients and corporate customers. We believe that travel is all 
         about having an authentic experience, and it?s why Smile Travels- the most trusted tour and travel agency in 
         India, plans each & every travel with Extreme Care. 
      </p>
      <br>
      <br>
      <h2>Contact Details</h2>
      <center>
        <h3>Name: RAHUL</h3>
        <h3>Contact: +91 7838545389</h3>
        <h3>E-mail: zakzayak@gmail.com</h3>
        <h3>Address: Mohan Co-operative, new Delhi, India</h3>
        
      </center>


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