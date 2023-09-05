<%@include file="../css/CSS.jsp"%>
<title>Electronet | Complaints</title>
<jsp:include page="unavbar.jsp" />
<br>

<body>
<div class="container">
	<h2>Make a Complaint</h2>
	<hr>

	<form action="../complaint" method="post">

		<input type="text" class="form-control  non"
			placeholder="enter your name" style="width: 350px;" name="name">

		<br>
		<textarea rows="5" cols="50" name="desc"
			placeholder="give a short description about it "></textarea>
		<br> <br>
		<button type="submit" class="btn btn-warning ">Submit</button>
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