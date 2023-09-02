<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conn.Connect"%>
<%@include file='unavbar.jsp' %>
<%@include file='../css/CSS.jsp' %>

<style>
    table, th, td {
        border: none;
        border-collapse: collapse;
        width: 500px;
    }
    th,td{
        width : 150px;
        height: 50px;
        text-align: center;
        font-size: larger;
    }

</style>
<title> My Info </title>
<div class="container">
    <%HttpSession s = request.getSession(false);
         String n = (String) session.getAttribute("meter");

         try {
              Connection conn = Connect.getConn();
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery("select * from customer where meter =  '" + n + "'  ");

    %>
    <br>
    <h1> My Info </h1>
    <hr>
    <table class="table">
        <%     if (rs.next()) {
                  String name = rs.getString(2);
                  String address = rs.getString(3);
                  String city = rs.getString(4);
                  String email = rs.getString(5);
                  String phone = rs.getString(6);
        %>
        <tr >
            <td class="text-warning"><b>Meter No.</b></td>
            <td><%=n%></td>

        </tr>
        <tr >

            <td class="text-warning"><b>Full Name</b></td>
            <td><%=name%></td>

        </tr>
        <tr >

          <td class="text-warning"><b>Address</b></td>
          
            <td><%=address%></td>

        </tr>
        <tr >
<td class="text-warning"><b>City</b></td>
            <td><%=city%></td>

        </tr>
        <tr >

          <td class="text-warning"><b>Email</b></td>
            <td><%=email%></td>

        </tr>
        <tr >

      <td class="text-warning"><b>Phone No.</b></td>
            <td><%=phone%></td>
        </tr>
        <%}%>
    </table>
    <%  } catch (Exception e) {
              e.printStackTrace();
         }%>

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../Footer.jsp"/>
