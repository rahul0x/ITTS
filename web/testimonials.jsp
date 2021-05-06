<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
      <a href="aboutus.jsp">About Us</a>
      <a class="active">Testimonials</a>
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
          ITTS - Testimonials
        </h1>
          <%
              try{
              Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
                String sql5 = " select Feedback.Name, Feedback.Email_Id, "
                        + "Feedback.Feedback from Feedback INNER JOIN reservation"
                        + " on Feedback.Name = reservation.rt_name where "
                        + "reservation.rt_name=Feedback.Name  group by Feedback.Name";
                rs = st.executeQuery(sql5);
                out.print("<table width='100%'>");
                while(rs.next()) {
                    out.print("<tr>");
                    try {
                        String name = rs.getString("name");
                        String email = rs.getString("email_id");
                        String feedback = rs.getString("feedback");
                        out.print("<td width='70%'><h4>" + feedback + "</h4></td><td></td></tr>");
                        out.print("<tr><td></td><td>" + name + " (" + email + ")</td></tr>");
                    }catch(Exception expxss) {}
                }
                out.print("</table>");
            }catch(Exception ex){}
          %>
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