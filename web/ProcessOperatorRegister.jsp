<%-- 
    Document   : ProcessOperatorRegister
    Author     : Rahul
--%>

<%@ page import="java.sql.*" %>
<%  
    
    Class.forName("com.mysql.jdbc.Driver"); 
    java.sql.Connection con = 
    DriverManager.getConnection("jdbc:mysql://localhost:3306/ITTS", "root","");  
    Statement st= con.createStatement();
    
    try{
    String name = request.getParameter("name");
    String userid = request.getParameter("userid");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String location = request.getParameter("location");
    
    
    String sql = "insert into touroperator(to_name, to_id, to_cont_no, to_address, to_email, to_location) values ('" + name + "','" + userid + "','" + contact + "','" + address + "','" + email + "','" + location + "')";
    int i = st.executeUpdate(sql);
    if(i > 0) {
        session.setAttribute("userid",userid);
        response.sendRedirect("operator-dashboard.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
    }catch(NullPointerException npe) {}
    
    try{
    if(session.getAttribute("admin").toString() != null) {
        String id = request.getParameter("operator");
        String field = request.getParameter("field");
        String value = request.getParameter("value");
        
        if(field.equals("select"))
            out.print("<script>alert('please select field!');window.location=admin-dashboard.jsp;</script>");
        String sql = "update touroperator set " + field + " = '" + value + "' where to_id = '" + id + "'";
        int i = st.executeUpdate(sql);
        if(i> 0)
            out.print("<script>alert('Update Successfully!');window.location='admin-dashboard.jsp';</script>");
        else out.print("<script>alert('Something went wrong!');window.location='admin-dashboard.jsp';</script>");
    }
    }catch(NullPointerException npe) {}
    
    try{
        String name = request.getParameter("name");
        String userid = session.getAttribute("userid").toString();
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        
        String sql = "update touroperator set to_name = '" + name + "', to_cont_no ='" + contact +"',to_address = '" + address + "', to_email = '" + email + "', to_location = '" + location + "' where to_id = '" + userid + "'";
        int i = st.executeUpdate(sql);
        if(i > 0){ 
            out.print("<script>alert('details updated');window.location='operator-dashboard.jsp';</script>");
        }
    }catch(Exception exp ) {}
    
    
%>    
