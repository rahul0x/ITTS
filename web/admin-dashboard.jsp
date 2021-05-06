<%-- 
    Document   : admin-dashboard
    Author     : Rahul
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("admin") == null) {
        response.sendRedirect("administrator.jsp");
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
      <a class="active">Admin</a>
      <a href="touroperator.jsp">Tour Operator</a>
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
    <div class="body-container">
        <div style="text-align: right;">
            <form action="logout.jsp" method="post">
                <span style="font-size: 25px;">
                    <%  
                        try {
                            if(session.getAttribute("admin").toString().equals(null)) {}
                            else { out.print(session.getAttribute("admin").toString()); }     
                        } catch(Exception e) {  }
                    %>
                </span>
                <input type="submit" value="logout" />
            </form>
        </div>
                <hr>
                <a href="admin-dashboard.jsp"><button class="logout">Home </button></a>
                <a href="#optr"><button class="logout">Update Operator </button></a>
                <a href="#trst"><button class="logout">Update Tourist </button></a>
                <a href="#reserv"><button class="logout">Reservation </button></a>
                <a href="#fdbk"><button class="logout">Feedback </button></a>
                
                <hr>
                
        <h1> Admin Dashboard </h1>
        <hr color="orange">
            <hr color="green">
        <!-- Change Details -->
        <%
    try {
        String id = session.getAttribute("admin").toString();
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        ResultSet rs;
        String sql = "select * from administrator where a_id = '"+ id + "'";
        rs = st.executeQuery(sql);
        try {
            String location;
            while(rs.next()) {
                String changeid =  rs.getString("a_id");
                String changename = rs.getString("a_name");
                String changeemail = rs.getString("a_email");
                String changepass = rs.getString("a_pass");
                %>
                <div class="reg-form">
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="register.jpg" width="100%">
              </td>
              <td width="60%">
                  <form action="updateadmin.jsp" method="post">
                    <fieldset>
                    <legend>Update Details</legend>
                    <label for="name">Name</label><br>
                    <input type="text"  name="name" value="<%out.print(changename);%>" required />
                    <br>
                    <label for="userid">UserName (ID)</label><br>
                    <input type="text" disabled name="id" value="<%out.print(changeid);%>" required />
                    <br>
                    <label for="address">Email </label><br>
                    <input type="text" name="email" value="<%out.print(changeemail);%>" required />
                    <br>
                    <label for="location">New password </label><br>
                    <input type="password" name="pass" required />
                    <br>
                    <br>
                <input type="submit" value="Update" />
                      </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>
                     <hr color="orange">
                    <hr color="green">
                    <h1 id="optr">Update Agency </h1>
                    <hr width=25% color="orange" align="left">
                    <hr width="30%" color="green" align="left">
                    <br><br>
                    <form action="ProcessOperatorRegister.jsp" method="post" >
                        <legend border="2">Update Agency Details</legend>
                        <h4>Select Agency</h4>
                    <%
                    try {
                        String operator = "Select * from touroperator";
                        rs = st.executeQuery(operator);
                        %>
                        <select name="operator" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required>
                        <%
                        while(rs.next()) {
                         out.print("<option value='"+ rs.getString("to_id") + "'>"+ rs.getString("to_id") + "</option>");
                        }
                        %></select><%
                    } catch(Exception expxs){}
                    %>
                    <h4>Update Field</h4>
                    <select name="field" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required>
                        <option value="select">--Select--</option>
                        <option value="to_location">Location</option>
                        <option value="to_name">Name</option>
                        <option value="to_address">Address</option>
                        <option value="to_cont_no">Contact </option>
                        <option value="to_email">Email</option>
                    </select>
                    <h4>New Detail</h4>
                    <input type="text" name="value" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required/><br>
                    <input type="submit" value="update">
                    </form>
                    <hr color="orange">
                    <hr color="green">
                    <h1 id="trst">Update Tourist </h1>
                    <hr width=25% color="orange" align="left">
                    <hr width="30%" color="green" align="left">
                    <br><br>
                    <form action="ProcessTouristRegister.jsp" method="post" >
                        <legend border="2">Update Tourist Details</legend>
                        <h4>Select Tourist</h4>
                    <%
                    try {
                        String tourist = "Select * from tourist";
                        rs = st.executeQuery(tourist);
                        %>
                        <select name="operator" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required>
                        <%
                        while(rs.next()) {
                         out.print("<option value='"+ rs.getString("t_id") + "'>"+ rs.getString("t_id") + "</option>");
                        }
                        %></select><%
                    } catch(Exception expxs){}
                    %>
                    <h4>Update Field</h4>
                    <select name="field" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required>
                        <option value="select">--Select--</option>
                        <option value="t_name">Name</option>
                        <option value="t_address">Address</option>
                        <option value="t_cont_no">Contact </option>
                    </select>
                    <h4>New Detail</h4>
                    <input type="text" name="value" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 40%;
                                margin-bottom: 10px;" required/><br>
                    <input type="submit" value="update">
                    </form>
                    
                    <hr color="orange"><hr color="green">
                    <h1 id="reserv"> Reservation Requests</h1>
                    <hr width="25%" align="left" color="orange">
                    <hr width="30%" align="left" color="green">
        <p> </p>
          
        <%      
            
        String sql2 = "SELECT * FROM reservation where r_status = 'pending'";
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
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> want to go <b>" + to + "</b> on dated <b>" + date + "</b> is <b>pending</b></p></td>");
                    %>
                    <form action="confirm.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input hidden type="submit" value="Confirm" disabled/>  
                </td> 
                </form>
                    
                    <form action="cancel.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input hidden type="submit" value="Cancel" disabled/>  
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
                
        String sql3 = "SELECT * FROM reservation WHERE not r_status = 'pending' and not r_status = 'cancel'";
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
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> will be go <b>" + to + "</b> on dated <b>" + date + "</b> is <b> Confirmed</b> </p></td>");
                out.print("<td width='15%'></td>");
                %>
                <form action="cancel.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                <input hidden type="submit" value="Cancel" disabled/>  
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
        String sql4 = "SELECT * FROM reservation where r_status = 'cancel'";
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
                out.print("<td width='70%'><p class='reservation-status'><b>" + name + "</b> tour with <b>" + to + "</b> on dated <b>" + date + "</b> is <b>cancelled</b></p></td>");
                out.print("<td width='15%'></td>");
                %>
                <form action="pending.jsp" method="post">
                <input type="text" hidden name="name" value="<%out.print(name);%>" hidden >
                <input type="text" name="to" value="<%out.print(to);%>" hidden >
                <input type="text" name="date" value="<%out.print(date);%>" hidden >
                <td>
                    <input hidden type="submit" value="Re-Request" disabled/>  </td></tr>
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
            }
            
        }catch(Exception e) {}
    }catch(Exception ex){ }
        %>
        
        
        <br><br><br><br><br>    
        

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
