<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="entity.Customer" %>
<%@ page import="elect.Connect" %>

<%@ page import="java.util.*" %>
<%@ include file="unavbar.jsp" %>
<%@ include file="../css/CSS.jsp" %>



<title>Electronet | MyInfo</title>
<style>
    table, th, td {
        border: none;
        border-collapse: collapse;
        width: 500px;
    }
    th, td {
        width: 150px;
        height: 50px;
        text-align: center;
        font-size: larger;
    }
</style>
<title>My Info</title>
<div class="container">
    <% HttpSession sessiona = request.getSession(false);
       String meter = (String) sessiona.getAttribute("meter");
       
       try {
           Session hibernateSession = Connect.getFactory().openSession();
           
           Query<Customer> query = hibernateSession.createQuery("FROM Customer WHERE meterNumber = :meter", Customer.class);
           query.setParameter("meter", me);
           
           List<Customer> customers = query.getResultList();
           if (!customers.isEmpty()) {
               Customer customer = customers.get(0);
    %>
    <br>
    <h1>My Info</h1>
    <hr>
    <table class="table">
        <tr>
            <td class="text-warning"><b>Meter No.</b></td>
            <td><%=customer.getMeterNumber()%></td>
        </tr>
        <tr>
            <td class="text-warning"><b>Full Name</b></td>
            <td><%=customer.getName()%></td>
        </tr>
        <tr>
            <td class="text-warning"><b>Address</b></td>
            <td><%=customer.getAddress()%></td>
        </tr>
        <tr>
            <td class="text-warning"><b>City</b></td>
            <td><%=customer.getCity()%></td>
        </tr>
        <tr>
            <td class="text-warning"><b>Email</b></td>
            <td><%=customer.getEmail()%></td>
        </tr>
        <tr>
            <td class="text-warning"><b>Phone No.</b></td>
            <td><%=customer.getPhoneNumber()%> </td>
        </tr>
    </table>
    <%
           }
           hibernateSession.close();
       } catch (Exception e) {
           e.printStackTrace();
       }
    %>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../Footer.jsp" />
