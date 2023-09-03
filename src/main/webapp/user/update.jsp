<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>

<%@page import="java.util.*"%>
<%@page import="elect.Connect"%>
<%@page import="entity.Customer"%>


<%@include file='unavbar.jsp'%>
<%@include file='../css/CSS.jsp'%>


<title>Electronet | Update Details</title>
<style>
.non {
	pointer-events: none;
}
</style>

<body>
<%
try {
	Session s1 = Connect.getFactory().openSession();
	s1.beginTransaction();

	String hql = "FROM Customer WHERE meterNumber = :meterNumber";
	Query<Customer> query = s1.createQuery(hql, Customer.class);
	query.setParameter("meterNumber", me);

	Customer customer = query.uniqueResult();

	if (customer != null) {
		String name = customer.getName();
		String address = customer.getAddress();
		String city = customer.getCity();
		String email = customer.getEmail();
		String phone = customer.getPhoneNumber();
%>
<div class="container">
	<br>
	<h2>Update Info</h2>
	<hr>
	<form action="../update" method="post">
		<div class="row">
			<div class="col mb-3">
				<label>Meter no.</label> <input type="text" class="form-control non"
					value="<%=me%>" name="meter">
			</div>
			<div class="col mb-3">
				<label>Name</label> <input type="text" class="form-control"
					placeholder="Enter Name" value="<%=name%>" name="name">
			</div>
		</div>

		<div class="row">
			<div class="col mb-3">
				<label>Address</label> <input type="text" class="form-control"
					placeholder="Enter address" value="<%=address%>" name="address">
			</div>
			<div class="col mb-3">
				<label>City</label> <input type="text" class="form-control"
					placeholder="Enter city" value="<%=city%>" name="city">
			</div>
		</div>
		<div class="row">
			<div class="col mb-3">
				<label>Phone No.</label> <input type="text" class="form-control"
					placeholder="Enter phone no" value="<%=phone%>" name="phone">
			</div>
			<div class="col mb-3">
				<label>Email</label> <input type="text" class="form-control"
					placeholder="Enter email" value="<%=email%>" name="email">
			</div>
		</div>
		<div class="text-center">
			<button type="submit" class="btn btn-success offset">Update</button>
		</div>
		<%
		}
		s1.getTransaction().commit();
		s1.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</form>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

<jsp:include page="../Footer.jsp" />

</body>