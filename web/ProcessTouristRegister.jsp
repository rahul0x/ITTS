<%-- 
    Document   : ProcessRegister
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
    String id = request.getParameter("id");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");
        
    String sql = "insert into tourist(t_name, t_id, t_cont_no, t_address) values ('" + name + "','" + id + "','" + contact + "','" + address + "')";
    int i = st.executeUpdate(sql);
    if(i > 0) {
        session.setAttribute("id",id);
        response.sendRedirect("tourist-dashboard.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
    }catch(Exception e) {}
    
    try{
    if(session.getAttribute("admin").toString() != null) {
        String id = request.getParameter("operator");
        String field = request.getParameter("field");
        String value = request.getParameter("value");
        
        if(field.equals("select"))
            out.print("<script>alert('please select field!');window.location='admin-dashboard.jsp';</script>");
        String sql = "update tourist set " + field + " = '" + value + "' where t_id = '" + id + "'";
        int i = st.executeUpdate(sql);
        if(i> 0)
            out.print("<script>alert('Update Successfully!');window.location='admin-dashboard.jsp';</script>");
        else out.print("<script>alert('Something went wrong!');window.location='admin-dashboard.jsp';</script>");
    }
    }catch(NullPointerException npe) {}
    
    try{
        String name = request.getParameter("name");
        String id = session.getAttribute("id").toString();
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        
        String sql = "update tourist set t_name = '" + name + "', t_cont_no ='" + contact +"',t_address = '" + address + "' where t_id = '" + id + "'";
        int i = st.executeUpdate(sql);
        if(i > 0){ 
            out.print("<script>alert('details updated');window.location='tourist-dashboard.jsp';</script>");
        }
    }catch(Exception exp ) {}
    
    try{
    if(session.getAttribute("id").toString() == null) {
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");
        
    String sql = "insert into tourist(t_name, t_id, t_cont_no, t_address) values ('" + name + "','" + id + "','" + contact + "','" + address + "')";
    int i = st.executeUpdate(sql);
    if(i > 0) {
        session.setAttribute("id",id);
        response.sendRedirect("tourist-dashboard.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
    }
    }catch(NullPointerException npe){}
%>    