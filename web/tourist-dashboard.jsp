<%-- 
    Document   : tourist-dashboard
    Author     : Rahul
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("id") == null) {
        response.sendRedirect("customertourist.jsp");
    }
%>

<%
    
%>
    
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
                <input type="submit" value="logout" />
            </form>
        </div>
                
         <div class="body-container">
             <hr>
                <a href="tourist-dashboard.jsp"><button class="logout">Home </button></a>
                <a href="reservation.jsp"><button class="logout">Reservation </button></a>
                <a href="feedback.jsp"><button class="logout">Feedback </button></a>
                <hr>
        <h1> Tourist Dashboard </h1>
        <hr>
        
        <!-- Change Details -->
        <%
    
    try {
        String id = session.getAttribute("id").toString();
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from tourist where t_id = '"+ id + "'";
        rs = st.executeQuery(sql);
        try {
            while(rs.next()) {
                String changeid = rs.getString("t_id");
                String changename = rs.getString("t_name");
                String changeaddress = rs.getString("t_address");
                String changecontact = rs.getString("t_cont_no");
                %>
                <div class="reg-form">
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="register.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="ProcessTouristRegister.jsp" method="post">
                    <fieldset>
                    <legend>Update Details</legend>
                    <label for="name">Name</label><br>
                    <input type="text" name="name" value="<%out.print(changename);%>" required />
                    <br>
                    <label for="userid">UserName (ID)</label><br>
                    <input type="text" name="id" disabled value="<%out.print(changeid);%>" required />
                    <br>
                    <lable for="contact"> Contact Number <small>(9999999999)</small></lable><br>
                    <input type="tel" name="contact" value="<%out.print(changecontact);%>" pattern="[0-9]{10}" required />
                    <br>
                    <label for="address">Address </label><br>
                    <input type="text" name="address" value="<%out.print(changeaddress);%>" required />
                    <br>
                <input type="submit" value="Update" />
                      </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>
                <%
            } 
        }catch(Exception e) {}
    }catch(Exception ex){ }
        %>
        
        <hr>
        
        <h1> Reservation </h1>
        <p>A reservation is a confirmation of the type of accommodation held by a passenger on a flight. Some fares offered by air carriers will allow you to make a reservation and hold a space on board a flight for a specified period without payment to allow you to make a decision to travel or not.</p>
        <a href="reservation.jsp" ><button class="logout">  Book Now </button></a>
        
        <hr>
        <h1>Feedback</h1>
        <p> will be recommending your tour and I will also be taking another in the future - Thank you for a wonderful journey! " "I was so pleased with the trip. Our guide and driver were outstanding : knowledgeable, friendly, safety-conscious, and had great sense of humor.</p>
        <a href="feedback.jsp"><button class="logout"> Feedback </button></a>
        
        <hr>
        
         </div>
    <br>
    <br>
    <hr>
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