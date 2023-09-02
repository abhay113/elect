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
%>

<div class="container"> 
    <h2>Pay Bill</h2>
    <hr>

    <form action = "paytm.jsp" method="post">
        <div class="row">
            <div class="col mb-3">
                <label>Meter No. </label>
                <input type="text" class="form-control  non" value=" <%= n%>" name="meter">
            </div>
            <div class="col mb-3">
                <label>Month</label>
                <select class="form-select" aria-label="Default select example" name="month">
                    <option selected>Select Month</option>
                    <option value="January">January</option>
                    <option value="Febrary">February</option>
                    <option value="March">March</option>
                    <option value="April">April</option>
                    <option value="May">May</option>
                    <option value="June">June</option>
                    <option value="July">July</option>
                    <option value="August">August</option>
                    <option value="September">September</option>
                    <option value="October">October</option>
                    <option value="November">November</option>
                    <option value="December">December</option>
                </select>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-info ">Search</button>
        </div>
    </form>
                <% 
                %>

    <jsp:include page="../Footer.jsp"/>