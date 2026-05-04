<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Bookings</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar2.jsp">
		<jsp:param name="title" value="Admin Dashboard" />
	</jsp:include>



	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Bookings</h1>
					<button class="view">Add Booking</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Status</label> <select>
							<option>All</option>
							<option>Pending</option>
							<option>Confirmed</option>
							<option>Cancelled</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Property Type</label> <select>
							<option>All</option>
							<option>House</option>
							<option>Apartment</option>
							<option>Room</option>
							<option>Flat</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Booking Date</label> <input type="date" />
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>Property</th>
								<th>Tenant</th>
								<th>Owner</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Status</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="b" items="${bookings}">
								<tr>
									<td>${b.propertyTitle}</td>
									<td>${b.tenantName}</td>
									<td>${b.ownerName}</td>
									<td>${b.startDate}</td>
									<td>${b.endDate}</td>
									<td>${b.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
