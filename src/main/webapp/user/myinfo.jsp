<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="entity.Customer"%>
<%@ page import="elect.Connect"%>

<%@ page import="java.util.*"%>
<%@ include file="unavbar.jsp"%>
<%@ include file="../css/CSS.jsp"%>



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





<%
String ls = request.getParameter("success");
if ("true".equals(ls)) {
%>
<div class=" container alert alert-success alert-dismissible fade show"
	role="alert">
	Updated Details!
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
}

if ("false".equals(ls)) {
%>
<div class=" container alert alert-danger alert-dismissible fade show"
	role="alert">
	Update data Failed !
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%}%>



<div class="container">
	<%
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
			<td><%=customer.getPhoneNumber()%></td>
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
