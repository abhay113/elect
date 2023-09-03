<%@page import="elect.Connect"%>
<%@include file='anavbar.jsp'%>
<%@include file='../css/CSS.jsp'%>

<body>
	<div class="container mt-5">
		<h2 class="text-center">Add New Customer</h2>
		<form action="/elect/AddCustomerServlet" method="post">

			<div class="form-row">
				<div class="col-md-6 form-group">
					<label for="meter">Meter Number:</label> <input type="text"
						class="form-control" id="meter" name="meter"
						placeholder="Enter Meter Number" required>
				</div>
				<div class="col-md-6 form-group">
					<label for="name">Name:</label> <input type="text"
						class="form-control" id="name" name="name"
						placeholder="Enter Name" required>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6 form-group">
					<label for="address">Address:</label> <input type="text"
						class="form-control" id="address" name="address"
						placeholder="Enter Address" required>
				</div>
				<div class="col-md-6 form-group">
					<label for="city">City:</label> <input type="text"
						class="form-control" id="city" name="city"
						placeholder="Enter City" required>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6 form-group">
					<label for="phone">Phone Number:</label> <input type="text"
						class="form-control" id="phone" name="phone"
						placeholder="Enter Phone Number" required>
				</div>
				<div class="col-md-6 form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="Enter Email" required>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success">Add</button>
			</div>
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

</body>