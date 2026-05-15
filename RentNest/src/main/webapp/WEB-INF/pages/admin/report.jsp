<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Reports</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">

			<div class="Page-Heading">
				<h1>Reports and Analysis</h1>
			</div>

			<div class="box-container">
				<div class="box box1">
					<i class="fa fa-users fa-2x"></i>
					<div class="text">
						<p>TOTAL USERS</p>
						<h2>${totalUsers}</h2>
					</div>
				</div>

				<div class="box box2">
					<i class="fa fa-file-text-o fa-2x"></i>
					<div class="text">
						<p>TOTAL BOOKINGS</p>
						<h2>${totalBookings}</h2>
					</div>
				</div>

				<div class="box box3">
					<i class="fa fa-home fa-2x"></i>
					<div class="text">
						<p>TOTAL PROPERTIES</p>
						<h2>${totalProperties}</h2>
					</div>
				</div>

				<div class="box box4">
					<i class="fa fa-envelope fa-2x"></i>
					<div class="text">
						<p>TOTAL MESSAGES</p>
						<h2>${totalContacts}</h2>
					</div>
				</div>
			</div>

			<div class="report-container">

				<h2>Property Report</h2>
				<table class="admin-table">
					<tr>
						<th>Property Status</th>
						<th>Total</th>
					</tr>
					<tr>
						<td>Available Properties</td>
						<td>${availableProperties}</td>
					</tr>
					<tr>
						<td>Booked Properties</td>
						<td>${bookedProperties}</td>
					</tr>
					<tr>
						<td>Approved Properties</td>
						<td>${approvedProperties}</td>
					</tr>
					<tr>
						<td>Pending Properties</td>
						<td>${pendingProperties}</td>
					</tr>
				</table>

				<h2>Booking Report</h2>
				<table class="admin-table">
					<tr>
						<th>Booking Status</th>
						<th>Total</th>
					</tr>
					<tr>
						<td>Total Bookings</td>
						<td>${totalBookings}</td>
					</tr>
				</table>

				<h2>System Report</h2>
				<table class="admin-table">
					<tr>
						<th>Report Name</th>
						<th>Total</th>
					</tr>
					<tr>
						<td>Total Users</td>
						<td>${totalUsers}</td>
					</tr>
					<tr>
						<td>Total Contact Messages</td>
						<td>${totalContacts}</td>
					</tr>
				</table>

			</div>

		</div>
	</div>

</body>
</html>