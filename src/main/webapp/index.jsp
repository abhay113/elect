<!DOCTYPE html>
<html lang="en">
<head>
<title>Login | ElectroNet</title>
<%@include file="css/CSS.jsp"%><link
	rel="stylesheet" href="css/login.css">
<style>
.logo-name {
	display: inline-block;
	margin-top: 11px;
}

span {
	font-size: large;
}
</style>
</head>
<body background="./img/bg.png">
	<div class="loginform">
		<div class="logo">
			<img class="logo-img" src="./img/logo.png" alt="">
			<p class="logo-name">ElectroNet.in</p>
		</div>
		<div class="upperbutton">
			<div id="b1"></div>
			<button type="button" class="btn" onclick="Admin()">Admin</button>
			<button type="button" class="btn" onclick="User()">User</button>
		</div>
		<form id="admin" class="inputgroup" action="Login" method="post">
			<input type="text" class="input" placeholder=" Username" name="aname"
				required=""> <input type="password" class="input"
				placeholder=" Enter password" name="apass" required=""> <br>
			<br> <input type="submit" class="btnsubp" value="LOG-IN">
		</form>

		<form id="user" class="inputgroup" action="userLogin"
			method="post">
			<input type="text" class="input" placeholder=" Username" name="uname"
				required=""> <input type="password" class="input"
				placeholder=" Enter password" name="upass" required=""> <br>
			<br> <span>forget password<a href="#"> Password</a></span><br>
			<span>new user ? <a href="register.jsp"> register now</a></span><br>
			<br> <input type="submit" class="btnsubp" value=LOG-IN>
		</form>
	</div>

	<script>
		var x = document.getElementById("admin");
		var y = document.getElementById("user");
		var z = document.getElementById("b1");
		function User() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";

		}
		function Admin() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0px";
		}
	</script>

</body>
</html>