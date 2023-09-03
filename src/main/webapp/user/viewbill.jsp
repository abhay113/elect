<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="entity.Bill"%>
<%@ page import="java.util.*"%>
<%@ page import="elect.Connect"%>

<%@ include file='unavbar.jsp'%>
<%@ include file='../css/CSS.jsp'%>

<div class="container">
	<h2>Your Bills</h2>
	<hr>
	<table class="table table-bordered">
		<thead class="bg-primary">
			<tr class="text-center">
				<th>Bill ID</th>
				<th>Meter Number</th>
				<th>Month</th>
				<th>Units</th>
				<th>Bill Amount</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				Session s1 = Connect.getFactory().openSession();
				s1.beginTransaction();
				String hql = "FROM Bill WHERE meterNumber = :meter";
				Query<Bill> query = s1.createQuery(hql, Bill.class);
				query.setParameter("meter", me);

				List<Bill> bills = query.list();

				s1.getTransaction().commit();
				s1.close();

				for (Bill bill : bills) {
			%>
			<tr class="text-center">
				<td><%=bill.getBid()%></td>
				<td><%=bill.getMeterNumber()%></td>
				<td><%=bill.getMonth()%></td>
				<td><%=bill.getUnits()%></td>
				<td><%=bill.getBillAmount()%></td>
				<td <%if ("Unpaid".equals(bill.getStatus())) {%>
					style="color: red; font-weight: 600" <%}%>><%=bill.getStatus()%>
					<%
					if ("Unpaid".equals(bill.getStatus())) {
					%> <br> <a href="paybill.jsp?billId=<%=bill.getBid()%>" class="btn btn-danger btn-sm">Pay
						Now</a> <%
 }
 %>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>
	</table>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<jsp:include page="../Footer.jsp" />
