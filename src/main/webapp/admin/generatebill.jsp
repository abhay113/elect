<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entity.Customer"%>
<%@ page import="elect.Connect"%>
<%@ page import="java.util.*"%>
<%@include file='anavbar.jsp'%>
<%@include file='../css/CSS.jsp'%>
<title>Electronet | Generate Bill</title>
<style>
select {
	width: 400px;
}
</style>
<body>

	<%
	String ls = request.getParameter("success");
	if ("true".equals(ls)) {
	%>
	<div class=" container alert alert-success alert-dismissible fade show"
		role="alert">
		Bill Generated Successfull !
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
}

if ("false".equals(ls)) {
%>
	<div class=" container alert alert-danger alert-dismissible fade show"
		role="alert">
		Bill Generation Failed !
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%}%>




	<div class="container mt-4">
		<h2>Generate Bill</h2>
		<hr>
		<form action="billdetails.jsp" method="post">

			<select style="width: 300px; display: inline; margin-right: 60px;"
				class="form-select" aria-label="Default select example"
				name="meterNumber">
				<option selected>Select Meter no</option>
				<%
				try {
					Session s1 = Connect.getFactory().openSession();
					String hql = "SELECT meterNumber FROM Customer";
					Query<String> query = s1.createQuery(hql, String.class);
					List<String> meterNumbers = query.list();
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
			<button type="submit" class="btn btn-info">Add</button>
		</form>
	</div>
	<br>
	<br>

	<jsp:include page="../Footer.jsp" />
</body>