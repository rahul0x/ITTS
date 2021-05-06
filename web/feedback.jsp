<%-- 
    Document   : feedback
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
    

<html>
  <head>
    <title>ITTS - A new way to enjoy your holidays</title>
    <link rel="stylesheet" href="slider.css" >
    <link rel="stylesheet" href="menu.css" >
    <link rel="stylesheet" href="body.css" >
    <link rel="stylesheet" href="footer.css" >
    <script src="slider.js"></script>
    
    <% 
        try{
    String name = session.getAttribute("id").toString();
    String feedback  = request.getParameter("feedback");
    String contact = request.getParameter("contact");
    String email = request.getParameter("email");
    
    try {
    if(!feedback.isEmpty()){
    Class.forName("com.mysql.jdbc.Driver"); 
    java.sql.Connection con = 
    DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
    Statement st= con.createStatement();
    String sql = "insert into feedback(name, contact_no, email_id, feedback) values ('" + name + "','" + contact + "','" + email + "','" + feedback + "')";
    int i = st.executeUpdate(sql);
    if(i > 0) {
        out.print("<script>alert('successfull submitted');</script>");
    } 
    }
    } catch(NullPointerException ex) { }
        }catch(NullPointerException expxs){}
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
        <h1> Feedback </h1>
        <hr>
        
        <!-- Change Details -->
        <div class="reg-form">
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="feedback.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="#" method="post">
                    <fieldset>
                    <legend>Tourist Feedback</legend>
                    <label for="name">Name</label><br>
                    <input type="text" name="name" value="<%try{out.print(session.getAttribute("id").toString());}catch(Exception expx){}%>" disabled required />
                    <br>
                    <lable for="contact"> Contact Number <small>(9999999999)</small></lable><br>
                    <input type="tel" name="contact"  pattern="[0-9]{10}" required />
                    <br>
                    <label for="email">Email </label><br>
                    <input type="email" name="email" required />
                    <br>
                    <label for="feedback">Feeback </label><br>
                    <textarea required style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" name="feedback" rows="5" cols="50" >Nice Service Provided by ITTS
                    </textarea>
                    <br>
                <input type="submit" value="Submit" />
                      </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>
                    
                    <hr>
                    <h2> Recent Feedback </h2>
                    <%
                        try {
                            String recentname = session.getAttribute("id").toString();
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from feedback where name = '"+ recentname + "'";
        rs = st.executeQuery(sql);
        try {
            out.print("<table width='100%'");
            while(rs.next()) {
                out.print("<tr>");
                out.print("<td width='70%'><p class='green'>" + rs.getString("feedback") + "</p></td><td></td></tr>");
                out.print("<tr><td></td><td>" + recentname + "</td></tr>");
            }         
            out.print("</table>");
        }catch(Exception e) {}
      }catch(Exception ex){ }
                        %>
        
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