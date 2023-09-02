<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="entity.Customer"%>
<%@ page import="org.hibernate.HibernateException"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="elect.Connect"%>
<%@ page import="java.util.*"%>
<%@ include file='anavbar.jsp'%>
<%@ include file='../css/CSS.jsp'%>

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	width: auto;
}

th, td {
	width: 150px;
	text-align: center;
}
</style>

<div class="container">
	<%
	try {

		SessionFactory sessionFactory = Connect.getFactory();
		Session s1 = sessionFactory.openSession();

		String hql = "FROM Customer";
		Query<Customer> query = s1.createQuery(hql, Customer.class);

		List<Customer> customers = query.list();

		s1.close();
	%>

	<br>
	<h1>All Customers</h1>
	<hr>
	<table class="table table-stripped">
		<tr border="1" class="bg-primary">
			<th>Meter no.</th>
			<th>Name</th>
			<th>Address</th>
			<th>City</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>
		<%
		for (Customer customer : customers) {
			String meter = customer.getMeterNumber();
			String name = customer.getName();
			String address = customer.getAddress();
			String city = customer.getCity();
			String email = customer.getEmail();
			String phone = customer.getPhoneNumber();
		%>
		<tr>
			<td><%=meter%></td>
			<td><%=name%></td>
			<td><%=address%></td>
			<td><%=city%></td>
			<td><%=email%></td>
			<td><%=phone%></td>
		</tr>
		<%
		}
		} catch (HibernateException e) {
		e.printStackTrace();
		
		}
		%>
	</table>
</div>

<br>
<br>
<br>
<br>
<br>
<jsp:include page="../Footer.jsp" />
