<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>My Bookings</title>
</head>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f5f5f5;
	color: #222;
}

.booking-page {
	max-width: 1100px;
	margin: 40px auto;
	background: #fff;
	padding: 30px;
	border-radius: 16px;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
}

.booking-page h1 {
	margin-bottom: 25px;
	color: #222;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 14px;
	border-bottom: 1px solid #ddd;
	text-align: left;
	font-size: 14px;
}

th {
	background: #ef742f;
	color: white;
}

.empty {
	text-align: center;
	padding: 30px;
	color: #777;
}

.status {
	padding: 7px 12px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: bold;
}

.status.Pending {
	background: #fff3cd;
	color: #856404;
}

.status.Approved {
	background: #d4edda;
	color: #155724;
}

.status.Rejected {
	background: #f8d7da;
	color: #721c24;
}

@media ( max-width : 700px) {
	.booking-page {
		margin: 20px;
		padding: 18px;
		overflow-x: auto;
	}
	table {
		min-width: 700px;
	}
}
</style>
<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<h2>My Bookings</h2>

	<table border="1" cellpadding="10">
		<tr>
			<th>Property</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Message</th>
			<th>Status</th>
		</tr>

		<c:forEach var="b" items="${bookings}">
			<tr>
				<td>${b.propertyTitle}</td>
				<td>${b.startDate}</td>
				<td>${b.endDate}</td>
				<td>${b.message}</td>
				<td>${b.status}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>