<%@include file="/css/CSS.jsp"%>
<link rel="stylesheet" href="css/login.css">
<title>Register | ElectroNet</title>
<style>
.input {
	width: 100%;
	padding: 10px 0;
	margin: 2px 0;
	border-bottom: 1px solid #999;
	outline: none;
	letter-spacing: 2px;
	padding-left: 10px;
	border-radius: 10px
}

.logo {
	margin-top: 0px;
}

.logo-name {
	display: inline-block;
	margin-top: 11px;
}
</style>
<body background="./img/bg.png">


	<%
	String ls = request.getParameter("success");
	if ("true".equals(ls)) {
	%>
	<div class=" container alert alert-success alert-dismissible fade show"
		role="alert">
		Registration Successfull ! now <Strong><a href="index.jsp">Login
				Here</a></Strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
}

if ("false".equals(ls)) {
%>
	<div class=" container alert alert-danger alert-dismissible fade show"
		role="alert">
		Registration Failed you are not Authorized User !
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%}%>


	<div class="loginform">
		<div class="logo">
			<img class="logo-img" src="./img/logo.png" alt="">
			<p class="logo-name">ElectroNet.in</p>
		</div>
		<form id="user" class="register" action="register" method="post">
			<input type="text" class="input mb-2"
				placeholder="Enter Meter Number" name="meter" required=""> <input
				type="text" class="input mb-2" placeholder="Enter Full Name"
				name="fullname" required=""> <input type="text"
				class="input mb-2" placeholder="Enter Username" name="uname"
				required=""> <input type="text" class="input mb-2"
				placeholder="Create a Password" name="upass" required=""> <span
				style="margin-top: 20px; font-size: larger;">already user ? <a
				href="index.jsp"> Login here </a>
			</span><br> <input type="submit" class="btnsubp" value=REGISTER>
		</form>
	</div>
</body>