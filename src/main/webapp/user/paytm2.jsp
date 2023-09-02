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
 
    <%         try {
              Connection conn = Connect.getConn();
              PreparedStatement pst = conn.prepareStatement("update bill set status = 'paid' where meter = '" + n + "' and month = '" + month + "' ");
              int i = pst.executeUpdate();
              if (i > 0) {
                   out.print("Bill Paid Successfully");
              }

         } catch (Exception e) {
              e.printStackTrace();
         }%>
    <jsp:include page="../Footer.jsp"/>