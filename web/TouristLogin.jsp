<%-- 
    Document   : touristlogin
    Author     : Rahul
--%>

<%@page import="java.io.PrintWriter"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 

<% if(session.getAttribute("id") != null) {
        //out.print("<script>alert('Login for using reservation system!");
        response.sendRedirect("tourist-dashboard.jsp");
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
    String id = request.getParameter("id");
    String contact = request.getParameter("contact");
    
    try {
    if(!(id.isEmpty() && contact.isEmpty())){
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from tourist where t_id = '"+ id + "' and  t_cont_no = '" + contact + "'";
        rs = st.executeQuery(sql);
        try {
            rs.next();
            if(rs.getString("t_id").equals(id) && rs.getString("t_cont_no").equals(contact)) {
                session.setAttribute("id", id);
                Cookie login = new Cookie("login", id);
                login.setMaxAge(60*60*24);
                response.addCookie(login);
                response.sendRedirect("tourist-dashboard.jsp");
            } 
        }catch(Exception e) {
            Cookie login = new Cookie("login", "false");
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
      <h1>Login</h1>
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="login.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="TouristLogin.jsp" method="post">
                    <fieldset>
                    <legend>Tourist Login</legend>
                    <input type="text" name="error" value="Incorrect Details!" hidden>
                    <label for="userid">ID</label><br>
                    <input type="text" name="id" required />
                    <br>
                    <lable for="contact"> Contact Number <small>(9999999999)</small></lable><br>
                    <input type="tel" name="contact" placeholder="Phone number" pattern="[0-9]{10}" required />
                    <br>
                    <br>
                <input type="submit" value="Login" onClick=""/>
                Don't have an account?<a href="customertourist.jsp" style="text-decoration: none; font-weight: bold;"> Register</a>
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