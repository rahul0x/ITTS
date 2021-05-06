<%-- 
    Document   : tourist-dashboard
    Author     : Rahul
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("userid") == null) {
        response.sendRedirect("touroperator.jsp");
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
   
  </head>
  <body>

    <!--Menu's -->
    <div class="topnav">
      <a href="index.jsp">Home</a>
      <a href="gallary.jsp">Gallary</a>
      <a href="administrator.jsp">Admin</a>
      <a class="active">Tour Operator</a>
      <a href="customertourist.jsp">Customer</a>
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
                            if(session.getAttribute("userid").toString().equals(null)) {}
                            else { out.print(session.getAttribute("userid").toString()); }     
                        } catch(Exception e) {  }
                    %>
                </span>
                <input type="submit" value="logout" />
            </form>
        </div>
                
         <div class="body-container">
             <hr>
                <a href="tourist-dashboard.jsp"><button class="logout">Home </button></a>
                <a href="#reserv"><button class="logout">Reservation </button></a>
                <a href="#fdbk"><button class="logout">Feedback </button></a>
                <hr>
        <h1> Agency Dashboard </h1>
        
            <hr color="orange">
            <hr color="green">
        <!-- Change Details -->
        <%
    try {
        String id = session.getAttribute("userid").toString();
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from touroperator where to_id = '"+ id + "'";
        rs = st.executeQuery(sql);
        try {
            String location;
            while(rs.next()) {
                String changeid =  rs.getString("to_id");
                String changename = rs.getString("to_name");
                String changeaddress = rs.getString("to_address");
                String changecontact = rs.getString("to_cont_no");
                String changeemail = rs.getString("to_email");
                String changelocation = rs.getString("to_location");
                location = changelocation;
                %>
                <div class="reg-form">
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="operator.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="ProcessOperatorRegister.jsp" method="post">
                    <fieldset>
                    <legend>Update Details</legend>
                    <label for="name">Name</label><br>
                    <input type="text" name="name" value="<%out.print(changename);%>" required />
                    <br>
                    <label for="userid">UserName (ID)</label><br>
                    <input type="text" disabled name="id" value="<%out.print(changeid);%>" required />
                    <br>
                    <lable for="contact"> Contact Number <small>(9999999999)</small></lable><br>
                    <input type="tel" name="contact" value="<%out.print(changecontact);%>" pattern="[0-9]{10}" required />
                    <br>
                    <label for="address">Address </label><br>
                    <input type="text" name="address" value="<%out.print(changeaddress);%>" required />
                    <br>
                    <label for="address">Email </label><br>
                    <input type="text" name="email" value="<%out.print(changeemail);%>" required />
                    <br>
                    <label for="location">Old Tour Location </label><br>
                    <input type="text" disabled name="oldlocation" value="<%out.print(changelocation);%>" required />
                    <br>
                    <label for="location">New Tour Location </label><br>
                    <select name="location" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" required>
                        <option value="India Gate" >India Gate </option>
                        <option value="Kutub Minar" >Kutub Minar</option>
                        <option value="Lal Quila" >Lal Quila</option>
                        <option value="Humau Tomb" >Humau Tomb </option>
                        <option value="Akshardham Mndr" >Akshardham Mandir</option>
                        <option value="Kalkaji Mandir" >Kalkaji Mandir</option>
                        <option value="Jama Masjid" >Jama Masjid </option>
                        <option value="Science Museum" >Science Museum</option>
                        <option value="Raj Ghat" >Raj Ghat</option>
                        <option value="ChidiyaGhar-zoo" >ChidiyaGhar (zoo) </option>
                    </select>
                    <br>
                <input type="submit" value="Update" />
                      </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>
                    <hr color="orange"><hr color="green">
                    <h1 id="reserv"> Reservation Requests</h1>
                    <hr width="25%" align="left" color="orange">
                    <hr width="30%" align="left" color="green">
        <p> </p>
          
        <%      
            
        String sql2 = "SELECT * FROM reservation where rj_to = '" + changelocation + "' and r_status = 'pending'";
        rs = st.executeQuery(sql2);
        try {
            out.print("<table width='100%'> ");
            int i = 0;
            while(rs.next()) {
                out.print("<tr><form action='confirm.jsp' method='post'>");
                String name =  rs.getString("rt_name");
                String to = rs.getString("rj_to");
                String date = rs.getString("r_date");
                i++;
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> want to go <b>" + to + "</b> on dated <b>" + date + "</b></p></td>");
                    %>
                    <form action="confirm.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input type="submit" value="Confirm" />  
                </td> 
                </form>
                    
                    <form action="cancel.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input type="submit" value="Cancel" />  
                </td> </tr>
                </form>
            <%
            }
            if(i==0) %><h3>No new requests</h3><%
            out.print("</table>");
        } catch(Exception ex) {}
        
        %>
        <h1>Reservation Confirmed </h1>
        <hr width="25%" align="left" color="orange">
        <hr width="30%" align="left" color="green">
        <%
                
        String sql3 = "SELECT * FROM reservation where rj_to = '" + changelocation + "' and r_status = '" + id + "'";
        rs = st.executeQuery(sql3);
        try {
            out.print("<table width='100%'> ");
            int j=0;
            while(rs.next()) {
                out.print("<tr>");
                String name =  rs.getString("rt_name");
                String to = rs.getString("rj_to");
                String date = rs.getString("r_date");
                j++;
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> want to go <b>" + to + "</b> on dated <b>" + date + "</b></p></td>");
                out.print("<td width='15%'></td>");
                %>
                <form action="cancel.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input type="submit" value="Cancel" />  
                </td> </tr>
                </form>
                
                <%
               
            }
            if(j==0)%><h3>No new Confirmed booking </h3><%
            out.print("</table>");
        } catch(Exception ex) {}

        %>
        <h1>Cancelled</h1>
        <hr width="25%" align="left" color="orange">
        <hr width="30%" align="left" color="green">
        <%
        String sql4 = "SELECT * FROM reservation where rj_to = '" + changelocation + "' and r_status = 'cancel'";
        rs = st.executeQuery(sql4);
        try {
            out.print("<table width='100%'> ");
            int j=0;
            while(rs.next()) {
                out.print("<tr>");
                String name =  rs.getString("rt_name");
                String to = rs.getString("rj_to");
                String date = rs.getString("r_date");
                j++;
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> want to go <b>" + to + "</b> on dated <b>" + date + "</b></p></td>");
                out.print("<td width='15%'></td>");
                %>
                <form action="pending.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                    <input type="submit" value="Re-Request" />  </td></tr>
                </form>
                
                <%
               
                
            }
            if(j==0)%><h3>No new Cancelled booking </h3><%
            out.print("</table>");
        } catch(Exception ex) {}
            
            %>
            <h1 id="fdbk">FeedBack </h1>
            <hr color="orange">
            <hr color="green">
            <p> What your client says </p>
            <%
                String sql5 = "select Feedback.Name, Feedback.Email_Id, Feedback.Feedback, reservation.rj_to"
                        + " from Feedback INNER JOIN reservation on Feedback.Name = reservation.rt_name where"
                        + " reservation.rj_to = '" + changelocation + "' group by Feedback.Name";
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
            }
            
        }catch(Exception e) {}
    }catch(Exception ex){ }
        %>
        
        
        <br><br><br><br><br>    
               
      
        
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