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
      <a href="contactus.jsp">Contact Us</a>
      <a class="active">About Us</a>
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
          ITTS - ABOUT US
        </h1>

        <p style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: 20px;">
          Incredible Delhi tour & travel services could be a web
          based platform for tour in operation corporations also as their client. The most aim of this project is to assist 
          the business enterprise companies to manage their customers, hotels, vehicles and agents. It makes all 
          operations of the tour company simple and correct. The web platform makes business enterprise management 
          simple by handling client requests and providing services for the customers placed at totally different parts of 
          the world. Even This on-line platform is additionally useful to user purpose of view. User will simply search 
          several choices on this web portal. They will search hotel, find their address and call no, book it and do more 
          as per their demand. Totally different modules are incorporated during this project to handle different parts 
          and sectors of the tour management field.
        </p>
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