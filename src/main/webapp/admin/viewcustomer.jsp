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

<%
String ls = request.getParameter("success");
if ("false".equals(ls)) {
%>
<div class=" container alert alert-danger alert-dismissible fade show"
	role="alert">
	Login Failed !
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
}

else if ("true".equals(ls)) {
%>
<div class=" container alert alert-success alert-dismissible fade show"
	role="alert">
	Deleted Customer
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
}
%>

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
	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th>Meter no.</th>
				<th>Name</th>
				<th>Address</th>
				<th>City</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
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
				<td>

					<form action="../Delete" method="post">
						<input type="hidden" name="meter" value="<%=meter%>">
						<button class="btn btn-sm btn-danger" type="submit">Delete</button>
					</form>
				</td>
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
<jsp:include page="../Footer.jsp" />
