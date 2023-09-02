<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entity.Customer"%>
<%@ page import="elect.Connect"%>
<%@ page import="java.util.*"%>
<%@include file='anavbar.jsp'%>
<%@include file='../css/CSS.jsp'%>

<style>
select {
	width: 400px;
}
</style>

<div class="container">
	<h2>Generate Bill</h2>
	<hr>
	<form action="generateBill" method="post">

		<select style="width: 300px; display: inline; margin-right: 60px;"
			class="form-select" aria-label="Default select example" name="type">
			<option selected>Select Meter no</option>
			<%
			try {
				// Get a Hibernate session
				Session s1 = Connect.getFactory().openSession();

				// Create an HQL query to fetch meter numbers from the Customer entity
				String hql = "SELECT DISTINCT meterNumber FROM Customer";
				Query<String> query = s1.createQuery(hql, String.class);

				// Execute the query and fetch the results
				List<String> meterNumbers = query.list();

				// Close the Hibernate session
				s1.close();

				for (String meterNumber : meterNumbers) {
			%>
			<option value="<%=meterNumber%>"><%=meterNumber%></option>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</select>
		<button type="button" class="btn btn-info">Add</button>
	</form>
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
