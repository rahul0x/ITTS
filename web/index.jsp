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
        <a class="active">Home</a>
        <a href="gallary.jsp">Gallary</a>
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
      
      <div class="body-container">
        
        <h1 class="green">
          ITTS - INCREDIBLE TOUR & TRAVEL SERVICES
        </h1>
        <p style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: 20px;">
          India is an abode of diversity that depicts in its landscape, weather, religion, languages, festivals, tradition, 
          culture, cuisines, flora, fauna and many more. Your India tours will give you a blissful travel experience to 
          memorize it forever. Enjoy honeymoon tours in India with your soul mate and showcase some memorable 
          honeymoon moments at famous honeymoon destinations of India.  Spend holidays with family and friends at 
          exotic sea beaches, hill stations and lush areas of India.
        </p>
        
        <h2 class="green">
          ITTS - Services
        </h2>
        
        <embed src="card.jsp" width="100%" height="100%">
          
        
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