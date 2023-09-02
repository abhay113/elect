<%@page import="java.sql.*"%>
<%@page import="Conn.Connect"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@include file='unavbar.jsp' %>
<%@include file='../css/CSS.jsp' %>

<style>
    .non{
        pointer-events : none
    }
</style>
<%
     HttpSession s = request.getSession(false);
     String n = (String) session.getAttribute("meter");

     try {
          Connection conn = Connect.getConn();
          Statement st = conn.createStatement();
          ResultSet rs = st.executeQuery("select * from customer where meter = '" + n + "' ");
          if (rs.next()) {
               String name = rs.getString(2);
               String address = rs.getString(3);
               String city = rs.getString(4);
               String email = rs.getString(5);
               String phone = rs.getString(6);

%>
<div class="container"> 
    <br>
    <h2>Update Info </h2>
    <hr>
    <form action = "../update" method="post">
        <div class="row">
            <div class="col mb-3">
                <label>Meter no.</label>
                <input type="text" class="form-control non" value=" <%= n%>" name="meter">
            </div>
            <div class="col mb-3">
                <label>Name </label>
                <input type="text" class="form-control"  placeholder="Enter Name"  value="<%= name%> " name="name">
            </div>
        </div>

        <div class="row">
            <div class="col mb-3">
                <label>Address</label>
                <input type="text" class="form-control" placeholder="Enter address"  value="<%= address%> " name="address">
            </div>
            <div class="col mb-3">
                <label>City</label>
                <input type="text" class="form-control" placeholder="Enter city"   value="<%= city%> " name="city">
            </div>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label>Phone No.</label>
                <input type="text" class="form-control" placeholder="Enter phone no"  value="<%= phone%> " name="phone">
            </div>
            <div class="col mb-3">
                <label>Email</label>
                <input type="text" class="form-control" placeholder="Enter email"  value="<%= email%> " name="email">
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-success offset">Update</button>
        </div>
        <% }
             } catch (Exception e) {
                  e.printStackTrace();
             }%>
    </form>
</div>


<br>
<br>
<br>
<br>
<br>
<br>
<br>


<jsp:include page="../Footer.jsp"/>

