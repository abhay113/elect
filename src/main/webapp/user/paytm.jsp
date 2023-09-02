<%@page import="java.sql.*"%>
<%@page import="Conn.Connect"%>
<%@include file="../css/CSS.jsp" %>
<jsp:include page="unavbar.jsp"/>
<style>
    .non{
        pointer-events : none
    }
</style>
<br>
<%
     HttpSession s = request.getSession(false);
     String n = (String) session.getAttribute("meter");
     String month = request.getParameter("month");
%>

<div class="container"> 
    <h2>Pay Bill</h2>
    <hr>

    <form action = "paytm2.jsp" method="post">
        <div class="row">
            <div class="col mb-3">
                <b>Meter No.</b>
                <input type="text" class="form-control  non" value=" <%= n%>" name="meter">
            </div>
            <div class="col mb-3">
                <b>Month</b>
                <select class="form-select non" aria-label="Default select example" name="month">
                    <option selected><%= month%></option>
                </select>
            </div>
        </div>


        <%
             try {
                  Connection conn = Connect.getConn();
                  Statement stmt = conn.createStatement();
                  ResultSet rs = stmt.executeQuery("select * from bill where meter =  '" + n + "' and month = '" + month + "' ");
                  if (rs.next()) {
                       String units = rs.getString(3);
                       String total = rs.getString(4);
                       String pending = rs.getString(5);
        %>
        <table class="table" >
            <tr >
                <td>Units Consumed</td>
                <td><%=units%></td>
            </tr>
            <tr >
                <td>Total Bill </td>
                <td><%=total%></td>
            </tr>
            <tr >
                <td >Status</td>
                <td ><%= pending%></td>
            </tr>
        </table>
        <%  if (pending.equals("not paid")) {
        %>
        <!--        <a href="paytm2.jsp">-->
        <button class='btn btn-primary' type="submit">Pay Now</button>
        <!--</a>-->
        <% } else {
                            out.println(" <span class='btn btn-success'>No Pending Bills</span>");
                       }

                  } else {
                       out.println(" <span class='btn btn-danger'>No Bills Found</span>");
                  }

             } catch (Exception e) {
                  e.printStackTrace();
             }%>
    </form>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <jsp:include page="../Footer.jsp"/>