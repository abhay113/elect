<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ElectroNet | Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

.navbar .btn-primary {
	background-color: transparent;
	border: none; 
	color: #fff; 
}
</style>


</head>
<body>

    <%String me =  (String)session.getAttribute("meterNumber"); %>
	<nav class="navbar navbar-expand-lg py-3 navbar-dark shadow-sm">
		<div class="container">
			<a href="uhome.jsp" class="navbar-brand"> <img
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
							Details </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="myinfo.jsp">View
									Details </a></li>
							<li><a class="dropdown-item" href="update.jsp">Update
									details</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="btn btn-primary dropdown-toggle ml-3" href="#"
						role="button" data-toggle="dropdown" aria-expanded="false">
							Bill </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="viewbill.jsp">view
									Bill</a></li>
							<li><a class="dropdown-item" href="paybill.jsp">Pay Bill</a></li>
						</ul></li>
					<li class="nav-item ml-3"><a href="complaint.jsp"
						class="nav-link">Complaints</a></li>
					<li class="nav-item ml-3"><a href="../index.jsp"
						class="nav-link">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html>
