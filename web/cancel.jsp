<%-- 
    Document   : cancel
    Author     : Rahul
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%
    String status = session.getAttribute("userid").toString();
    String location = request.getParameter("oldlocation");
    String name = request.getParameter("name");
    String to = request.getParameter("to");
    String date = request.getParameter("date");
    
    Class.forName("com.mysql.jdbc.Driver"); 
    java.sql.Connection con = 
    DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
    Statement st= con.createStatement();
    
    String sql1 = "update tourist set t_reserv_status = 'cancel' where t_id = '" + name + "'";
    st.executeUpdate(sql1);
    
    String sql = "update reservation set r_status = 'cancel' where rt_name = '" + name + "' and r_date = '" + date + "'"   ;
    int i = st.executeUpdate(sql);
    if(i > 0) {
        out.print("<script>alert('sucessfully Cancel'); window.location = operator-dashboard.jsp;</script> ");
        response.sendRedirect("operator-dashboard.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    
%>
