<%@ include file="../css/CSS.jsp"%>
<title>Electronet | Home</title>


<script>
	// Check for the 'success' query parameter
	const urlParams = new URLSearchParams(window.location.search);
	const successParam = urlParams.get('success');

	// If 'success=true', display the Bootstrap alert
	if (successParam === 'true') {
		// Use JavaScript to create and show the Bootstrap alert
		const alertDiv = document.createElement('div');
		alertDiv.classList.add('alert', 'alert-success', 'mt-3');
		alertDiv.innerHTML = '<strong>Success!</strong> Customer added successfully!';
		document.body.insertBefore(alertDiv, document
				.querySelector('.container'));

		// Remove the 'success' query parameter from the URL to avoid showing the alert repeatedly
		history.replaceState({}, document.title, window.location.pathname);
	}
</script>



<jsp:include page="anavbar.jsp" />
<br>
<%@ include file="content.jsp"%>
<jsp:include page="../Footer.jsp" />

</html>
