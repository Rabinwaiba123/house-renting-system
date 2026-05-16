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
				<h1>Admin Reports</h1>
			</div>

			<!-- Summary Cards -->
			<div class="report-summary">
				<div class="summary-card">
					<i class="fa fa-users"></i>
					<p>Total Users</p>
					<h2>${totalUsers}</h2>
				</div>

				<div class="summary-card">
					<i class="fa fa-calendar-check-o"></i>
					<p>Total Bookings</p>
					<h2>${totalBookings}</h2>
				</div>

				<div class="summary-card">
					<i class="fa fa-home"></i>
					<p>Total Properties</p>
					<h2>${totalProperties}</h2>
				</div>

				<div class="summary-card">
					<i class="fa fa-envelope"></i>
					<p>Messages</p>
					<h2>${totalContacts}</h2>
				</div>
			</div>

			<!-- Small Chart -->
			<div class="report-card">
				<h2>System Overview Chart</h2>

				<div class="small-chart">

					<div class="chart-row">
						<span>Users</span>
						<div class="chart-bar">
							<div class="chart-fill users" style="width:${totalUsers * 5}px;"></div>
						</div>
						<b>${totalUsers}</b>
					</div>

					<div class="chart-row">
						<span>Bookings</span>
						<div class="chart-bar">
							<div class="chart-fill bookings"
								style="width:${totalBookings * 5}px;"></div>
						</div>
						<b>${totalBookings}</b>
					</div>

					<div class="chart-row">
						<span>Properties</span>
						<div class="chart-bar">
							<div class="chart-fill properties"
								style="width:${totalProperties * 5}px;"></div>
						</div>
						<b>${totalProperties}</b>
					</div>

					<div class="chart-row">
						<span>Messages</span>
						<div class="chart-bar">
							<div class="chart-fill messages"
								style="width:${totalContacts * 5}px;"></div>
						</div>
						<b>${totalContacts}</b>
					</div>

				</div>
			</div>

			<!-- Detailed Reports -->
			<div class="report-grid">

				<div class="report-card">
					<h2>Property Analysis</h2>
					<table class="admin-table">
						<tr>
							<th>Property Type</th>
							<th>Total</th>
						</tr>
						<tr>
							<td>Available Properties</td>
							<td>${availableProperties}</td>
						</tr>
						<tr>
							<td>Booked Properties</td>
							<td>3</td>
						</tr>
					</table>
				</div>

				<div class="report-card">
					<h2>Booking Analysis</h2>
					<table class="admin-table">
						<tr>
							<th>Report</th>
							<th>Total</th>
						</tr>
						<tr>
							<td>Total Booking Requests</td>
							<td>${totalBookings}</td>
						</tr>
					</table>
				</div>

				<div class="report-card">
					<h2>User and Contact Analysis</h2>
					<table class="admin-table">
						<tr>
							<th>Report</th>
							<th>Total</th>
						</tr>
						<tr>
							<td>Registered Users</td>
							<td>${totalUsers}</td>
						</tr>
						<tr>
							<td>Contact Messages</td>
							<td>${totalContacts}</td>
						</tr>
					</table>
				</div>

			</div>

		</div>
	</div>

</body>
</html>