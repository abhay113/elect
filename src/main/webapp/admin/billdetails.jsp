<%@ page import="entity.Bill" %>
<%@include file='anavbar.jsp'%>
<%@include file='../css/CSS.jsp'%>

<style>
    .form-container {
        max-width: 500px;
        margin: 0 auto;
    }
    .form-group {
        margin-bottom: 20px;
    }
</style>

<script>
    function calculateAmount() {
        var units = parseFloat(document.getElementById("units").value);
        var amount = ((units * 9) + (units * 9 * 0.18)).toFixed(2); 
        document.getElementById("billAmount").value = amount; 
    }
</script>

<div class="container mt-4">
    <div class="form-container">
        <h2 class="text-center">Generate Bill</h2>
        <hr>
        <form action="../createBill" method="post">
            <div class="form-group">
                <label for="meterNumber">Meter Number</label>
                <input type="text" class="form-control" id="meterNumber" name="meterNumber" value="<%=request.getParameter("meterNumber")%>" readonly>
            </div>
            <div class="form-group">
                <label for="month">Month</label>
                <select class="form-select" id="month" name="month">
                    <option value="January">January</option>
                    <option value="February">February</option>
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
            <div class="form-group">
                <label for="units">Units</label>
                <input type="text" class="form-control" id="units" name="units" oninput="calculateAmount()">
            </div>
            <div class="form-group">
                <label for="billAmount">Bill Amount</label>
                <input type="text" class="form-control" id="billAmount" name="billAmount" readonly>
            </div>
            <div class="form-group">
            
              
                <label for="billAmount">Status</label>
                <input type="text" class="form-control" id="status" name="status" value="Unpaid" readonly>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Generate Bill</button>
            </div>
        </form>
    </div>
</div>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="../Footer.jsp" />
