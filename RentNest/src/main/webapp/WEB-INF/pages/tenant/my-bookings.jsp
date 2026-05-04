<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>My Bookings</title>
</head>
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