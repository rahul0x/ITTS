<%-- 
    Document   : reservation
    Author     : Rahul
--%>

<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 

<%if(session.getAttribute("userid") != null) {
        response.sendRedirect("OperatorLogin.jsp");
    }
%>


<% if(session.getAttribute("id") == null) {
        out.print("<script>alert('Please Login for using reservation system!'); "
                + "window.location='TouristLogin.jsp';</script>");
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
    try{       
    String name = session.getAttribute("id").toString();
    }catch(Exception ex) {}
    String date = request.getParameter("date");
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String sex = request.getParameter("sex");
    String age = request.getParameter("age");
    String remark = request.getParameter("remark");
    
    try {
    if(!(date.isEmpty() && from.isEmpty())){
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement(); 
        try{
           String name = session.getAttribute("id").toString();
           String sql1 = "update tourist set t_date = '" + date + "' where t_id = '" + name + "'";
            st.executeUpdate(sql1);
           String sql = "insert into reservation(rt_name, r_date, rj_from, rj_to, rt_sex, rt_age, r_status, rt_remarks) values('" + name + "','" + date + "','" + from + "','" + to + "','" + sex + "','" + age + "','pending','"+remark +"')";
      
        int i = st.executeUpdate(sql);
        if(i > 0) {
            out.print("<script>alert('Reservation request submitted!');</script>");
        } else {
            out.print("<script>alert('Something went wrong!');</script>");
        }
        }catch(Exception ex) {}
    }
    }catch(Exception e) {
        
    }
    
%>   
    
  </head>
  <body>

    <!--Menu's -->
    <div class="topnav">
      <a href="index.jsp">Home</a>
      <a href="gallary.jsp">Gallary</a>
      <a href="administrator.jsp">Admin</a>
      <a href="touroperator.jsp">Tour Operator</a>
      <a href="customertourist.jsp">Customer</a>
      <a class="active">Reservation</a>
      <a href="contactus.jsp">Contact Us</a>
      <a href="aboutus.jsp">About Us</a>
      <a href="testimonials.jsp">Testimonials</a>
      
    </div> 

    <!-- Slider -->
    <div class="slideshow-container" style="height: 70%;">
      <div class="mySlides fade">
        <center>
          <img src="reservation.jpg" style="height: 100%;">
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
        
        <div class="reg-form">
      <h1>Reservation </h1>
      <table width="100%">
          <tr>
              <td width="40%">
                  <img src="reservation.jpg" width="100%">
                  
              </td>
              <td width="60%">
                  <form action="#" method="post">
                    <fieldset>
                    <legend>Reservation</legend>
                    <label for="name">Name</label><br>
                    <input type="text" name="name" value="<%try{out.print(session.getAttribute("id").toString());}catch(Exception expc){}%>" required disabled/>
                    <br>
                    <label for="date">Date</label><br>
                    <input type="date" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" name="date"  required />
                    <br>
                    <lable for="from"> From <small>(pickup Address)</small></lable><br>
                    <input type="text" name="from" required />
                    <br>
                    <label for="to">To <small>(Travel place)</small> </label><br>
                    <select name="to" style="border-radius: 5px;
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
                    </select><br>
                    <label for="sex">Gender </label><br>
                    <select name="sex" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" required>
                        <option value="male"> Male </option>
                        <option value="female"> Female </option>
                        <option value="none"> Rather not say </option>
                    </select>
                    <br>
                    <label for="age">Age </label><br>
                    <input type="number" style="border-radius: 5px;
                                border-color: green;
                                padding: 5px;
                                width: 80%;
                                margin-bottom: 10px;" name="age" min="1" max="100" required />
                    <br>
                    <label for="remark">Remark</label> <br>
                    <input type="text" name ="remark" > <br>
                <input type="submit" value="Reserve" />
                </fieldset>
                </form>
              </td>
          </tr>
      </table>
      </div>
                    <hr>
                    <h1> Reservation's </h1>
                    <%  try {  
                        String statusname = session.getAttribute("id").toString();
                        Class.forName("com.mysql.jdbc.Driver"); 
                        java.sql.Connection con = 
                        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
                        Statement st= con.createStatement(); 
                        ResultSet rs;
                        String sql = "select * from reservation where rt_name = '"+ statusname + "'";
                        rs = st.executeQuery(sql);
                        try {
                            out.print("<table>");
                            while(rs.next()){
                                out.print("<tr>");
                                if(rs.getString("rt_name").equals(statusname)) {
                                    String statusto = rs.getString("rj_to");
                                    String statusdate = rs.getString("r_date");
                                    String statusstatus = rs.getString("r_status");
                                    String statusremark = rs.getString("rt_remarks");
                                    String status =  "<b>" + statusname +   "</b> your tour for <b>" + statusto + "</b> is scheduled on <b>" + statusdate + "</b>";
                                    out.print("<td> <h2><font  color='green'>" + status + "</font></h2></td>");
                                    if(!(statusstatus.equals("pending") || statusstatus.equals("cancel")))
                                        out.print("<tr><td><center><h3> Confirmed by: " + statusstatus + "</h3></center></td></tr>");
                                    else 
                                        out.print("<tr><td><center><h3> Status: " + statusstatus + "</h3></center></td></tr>");
                                } 
                                out.print("</tr>");
                            }
                            out.print("</table>");
                        }catch(Exception e) {
                        }
                    }catch(NullPointerException npe) {}
                  %>
        
        
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
