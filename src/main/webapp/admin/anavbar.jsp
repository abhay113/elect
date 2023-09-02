<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ElectroNet | Home</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Add your custom CSS here -->

<style>
.navbar {
	background-color: #902bf5;
	transition: background-color 0.3s ease-in-out;
}

.navbar a.navbar-brand .logo1 {
	border: 2px solid #902bf5;
	border-radius: 60%;
	padding: 2px;
}

.navbar a.navbar-brand .font-weight-bold {
	color: #fff;
	font-size: 1.5rem;
	text-decoration: none;
}

.navbar a.nav-link {
	color: #fff;
	transition: color 0.3s ease-in-out;
}

.navbar a.nav-link:hover {
	color: #0dcaf0;
}

.dropdown-menu a.dropdown-item {
	color: #000;
	transition: color 0.3s ease-in-out;
}

.dropdown-menu a.dropdown-item:hover {
	color: #0dcaf0;
}

/* Override the background color for the "Customer" and "Bill" buttons */
.navbar .btn-primary {
	background-color: transparent; /* Remove blue background */
	border: none; /* Remove button border */
	color: #fff; /* Set text color to white */
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg py-3 navbar-dark shadow-sm">
		<div class="container">
			<a href="ahome.jsp" class="navbar-brand"> <img
				src="../img/logo.png" width="45" alt=""
				class="logo1 d-inline-block align-middle mr-2"> <span
				class="font-weight-bold">ElectroNet</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbarSupportedContent" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="btn btn-primary ml-2 dropdown-toggle ml-3" href="#"
						role="button" data-toggle="dropdown" aria-expanded="false">
							Customer </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="addcust.jsp">New
									Customer</a></li>
							<li><a class="dropdown-item" href="viewcustomer.jsp">Customer
									details</a></li>
							<li><a class="dropdown-item" href="status.jsp">Status</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="btn btn-primary dropdown-toggle ml-3" href="#"
						role="button" data-toggle="dropdown" aria-expanded="false">
							Bill </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="generatebill.jsp">Generate
									Bill</a></li>
							<li><a class="dropdown-item" href="paybill.jsp">Pay Bill</a></li>
						</ul></li>
					<li class="nav-item ml-3"><a href="complaint.jsp" class="nav-link">Complaints</a>
					</li>
					<li class="nav-item ml-3"><a href="../index.jsp" class="nav-link">Log
							Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
