<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Transaction"%>
<%@ page import="entity.Bill"%>
<%@ page import="elect.Connect"%>


<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Transaction"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="entity.Bill"%>
<%@ page import="elect.Connect"%>

<%@ include file='unavbar.jsp'%>
<%@ include file='../css/CSS.jsp'%>

<div class="container">
	<h2>Payment Status</h2>
	<hr>
	<%
	int bid = Integer.parseInt(request.getParameter("billId"));
	boolean isUpdated = false;
	try {
		Session s1 = Connect.getFactory().openSession();
		Transaction tx = s1.beginTransaction();

		String hql = "FROM Bill WHERE bid = :bid AND status = 'Unpaid'";
		Query<Bill> query = s1.createQuery(hql, Bill.class);
		query.setParameter("bid", bid);

		Bill bill = query.uniqueResult();

		if (bill != null) {
			bill.setStatus("Paid");
			s1.update(bill);
			tx.commit();
			isUpdated = true;
		}

		s1.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<%
	if (isUpdated) {
	%>
	<div class="alert alert-success" role="alert">Bill has been
		successfully paid! You will be redirected to the home page.</div>
	<%
	} else {
	%>
	<div class="alert alert-danger" role="alert">Error occurred while
		processing the payment. Please try again or contact support.</div>
	<%
	}
	%>
</div>

<!-- Redirect to the home page after a brief delay -->
<script>
	setTimeout(function() {
		window.location.href = "uhome.jsp";
	}, 3000); // Redirect after 3 seconds (adjust as needed)
</script>

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
