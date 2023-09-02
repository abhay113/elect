<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entity.Complaint"%>
<%@page import="elect.Connect"%>
<%@page import="java.util.*"%>
<%@include file="../css/CSS.jsp"%>
<jsp:include page="anavbar.jsp" />

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	width: 350px;
	text-align: center;
}
</style>
<div class="container">
	<%
	try {
		// Get a Hibernate session
		Session s1 = Connect.getFactory().openSession();

		String hql = "FROM Complaint";
		Query<Complaint> query = s1.createQuery(hql, Complaint.class);

		List<Complaint> complaints = query.list();

		// Close the Hibernate session
		s1.close();
	%>
	<br>
	<h1>Recent Complaints</h1>
	<hr>
	<table class="table table-stripped">
		<tr border="1" class="bg-primary">
			<th>Name</th>
			<th>Description</th>
		</tr>
		<%
		for (Complaint complaint : complaints) {
			String name = complaint.getUsername();
			String description = complaint.getDescription();
		%>
		<tr>
			<td><%=name%></td>
			<td><%=description%></td>
		</tr>
		<%
		}
		} catch (Exception e) {
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
