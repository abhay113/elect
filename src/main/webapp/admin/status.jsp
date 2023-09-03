<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="entity.Bill"%>
<%@ page import="entity.Customer"%>

<%@ page import="elect.Connect"%>
<%@ page import="java.util.*"%>

<%@ include file='anavbar.jsp'%>
<%@ include file='../css/CSS.jsp'%>

<div class="container">
	<h2>Bill and Customer Data</h2>
	<hr>
	<table class="table table-bordered">
		<thead class="bg-primary">
			<tr class="text-center">
				<th>Bill ID</th>
				<th>Meter Number</th>

				<th>Customer Name</th>
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

				String hql = "SELECT b.bid, b.meterNumber, b.month, b.units, b.billAmount, b.status, c.name FROM Bill b JOIN Customer c ON b.meterNumber = c.meterNumber";
				Query<Object[]> query = s1.createQuery(hql);

				List<Object[]> results = query.list();

				s1.getTransaction().commit();
				s1.close();

				for (Object[] row : results) {
			%>
			<tr class="text-center">
				<td><%=row[0]%></td>
				<td><%=row[1]%></td>
				<td><%=row[6]%></td>
				<td><%=row[2]%></td>
				<td><%=row[3]%></td>
				<td><%=row[4]%></td>
				<td <%if ("Unpaid".equals(row[5])) {%>
					style="color: red; font-weight: 600" <%}%>><%=row[5]%></td>

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
