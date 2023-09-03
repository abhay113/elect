<%@page import="java.sql.*"%>
<%@include file='anavbar.jsp' %>
<%@include file='../css/CSS.jsp' %>
<title>Electronet | Meter Info</title>
<body>
<%
     String ameter = request.getParameter("meter");
%>
<div class="container">
    <h2>Add Meter Details</h2>
    <form action="/elect/AddMeterServlet" method="post">
        <div class="form-row">
            <div class="col-md-6 form-group">
                <input type="text" class="form-control" value="<%= ameter %>" name="meter">
            </div>
            <div class="col-md-6 form-group">
                <select class="form-select" aria-label="Default select example" name="location">
                    <option selected>Select Meter Location</option>
                    <option value="outside">Outside</option>
                    <option value="inside">Inside</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-6 form-group">
                <select class="form-select" aria-label="Default select example" name="type">
                    <option selected>Select Meter Type</option>
                    <option value="electric">Electric</option>
                    <option value="smart">Smart</option>
                    <option value="solar">Solar</option>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <select class="form-select" aria-label="Default select example" name="phasecode">
                    <option selected>Select Phase Code</option>
                    <option value="001">001</option>
                    <option value="002">002</option>
                    <option value="003">003</option>
                    <option value="004">004</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 form-group">
                <select class="form-select" aria-label="Default select example" name="billtype">
                    <option selected>Select Bill Type</option>
                    <option value="normal">Normal</option>
                    <option value="industrial">Industrial</option>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <select class="form-select" aria-label="Default select example" name="days">
                    <option selected>Select Days</option>
                    <option value="30">30</option>
                </select>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-success r">Submit</button>
        </div>
    </form>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../Footer.jsp"/>


</body>
