<%-- 
    Document   : updateadmin
    Created on : 27 Dec, 2020, 7:53:56 PM
    Author     : Rahul
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%
    try{
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String oldpass = request.getParameter("oldpass");
        
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
        Statement st= con.createStatement();
        ResultSet rs;
        
        String sql = "update administrator set a_name = '" + name + "', a_email = '" + email + "', a_pass = '" + pass + "' where a_id = '" + id + "'";
        
        int i = st.executeUpdate(sql);
        
        if(i > 0 )
            out.print("<script>alert('successfully update!!');window.location = admin-dashboard.jsp;</script>");
        else 
            out.print("<script>alert('something went wrong!!'); window.location = admin-dashboard.jsp;</script>");
    } catch(Exception exp ){}
    %>