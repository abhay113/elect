
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conn.Connect"%>
<%@include file='unavbar.jsp' %>
<%@include file='../css/CSS.jsp' %>

<%     HttpSession s = request.getSession(false);
     String n = (String) session.getAttribute("meter");
     try {
          Connection conn = Connect.getConn();
          Statement st = conn.createStatement();

          ResultSet rs = st.executeQuery("select * from customer where meter = '" + n + "' ");

          String name = rs.getString(2);
          String address = rs.getString(3);
          String city = rs.getString(4);
          String email = rs.getString(5);
          String phone = rs.getString(6);

//          Statement st2 = conn.createStatement();
//
//          ResultSet rs2 = st2.executeQuery("select * from meter_info where meter = '" + n + "' ");
//
//          String location = rs2.getString(2);
//          String type = rs2.getString(3);
//          String phasecode = rs2.getString(4);
//          String billtype = rs2.getString(5);
//          String days = rs2.getString(5);
//
//          Statement st3 = conn.createStatement();
//
//          ResultSet rs3 = st3.executeQuery("select * from bill where meter = '" + n + "' ");
//
//          String month = rs3.getString(2);
//          String units = rs3.getString(3);
//          String total = rs3.getString(4);
//          String status = rs3.getString(5);
//
//          Statement st4 = conn.createStatement();
//          ResultSet rs4 = st4.executeQuery("select * from tax ");
//          String cost = rs4.getString(1);
//          String rent = rs4.getString(2);
//          String service = rs4.getString(3);
//          String service_charge = rs4.getString(4);
//          String gst = rs4.getString(5);
//          String swachha_bharat_cess = rs4.getString(6);
          out.println(name);
%>
<table>

    <tr>
        <td><%=  n%></td>
        <td><%=  name%></td>
        <td><%= address%></td>
        <td><%= city%></td>
        <td><%= email%></td>
        <td><%= phone%></td>  
    </tr>


</table>

<%               } catch (Exception e) {
          e.printStackTrace();
     }
%>