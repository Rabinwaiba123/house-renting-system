<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Book Property</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>

	<jsp:include page="/include/navbar.jsp" />

	<h2>Send Booking Request</h2>

	<form action="${pageContext.request.contextPath}/booking" method="post">
		<input type="hidden" name="action" value="sendRequest">
		<input type="hidden" name="propertyId" value="${propertyId}">

		<label>Start Date</label>
		<input type="date" name="startDate" required>

		<label>End Date</label>
		<input type="date" name="endDate" required>

		<label>Message</label>
		<textarea name="message" placeholder="Write message to owner"></textarea>

		<button type="submit">Send Request</button>
	</form>

</body>
</html>