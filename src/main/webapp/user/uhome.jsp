<%@include file="../css/CSS.jsp"%>
<title>Electronet | Home</title>

<body>
	<jsp:include page="unavbar.jsp" />
	<br>

	<%
	String ls = request.getParameter("loginSuccess");
	if ("true".equals(ls)) {
	%>
	<div class=" container alert alert-success alert-dismissible fade show"
		role="alert">
		Login Successfull !
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
}
%>

	<%@include file="content.jsp"%>
	<jsp:include page="../Footer.jsp" />
</body>