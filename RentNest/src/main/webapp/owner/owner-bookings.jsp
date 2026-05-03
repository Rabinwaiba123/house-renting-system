<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Owner Booking Requests</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar2.jsp">
		<jsp:param name="title" value="Owner Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/include/owner-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<div class="box-container">
				<div class="box box1">
					<i class="fa fa-calendar fa-2x"></i>
					<div class="text">
						<p>TOTAL REQUESTS</p>
						<h2>18</h2>
					</div>
				</div>

				<div class="box box2">
					<i class="fa fa-clock-o fa-2x" style="color: grey"></i>
					<div class="text">
						<p>PENDING</p>
						<h2>6</h2>
					</div>
				</div>

				<div class="box box3">
					<i class="fa fa-check-circle fa-2x" style="color: green"></i>
					<div class="text">
						<p>APPROVED</p>
						<h2>9</h2>
					</div>
				</div>

				<div class="box box4">
					<i class="fa fa-times-circle fa-2x" style="color: red"></i>
					<div class="text">
						<p>REJECTED</p>
						<h2>3</h2>
					</div>
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Booking Requests</h1>
					<button class="view">Export</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Status</label> <select>
							<option>All</option>
							<option>Pending</option>
							<option>Approved</option>
							<option>Rejected</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Property</label> <select>
							<option>All</option>
							<option>Sunrise Apartment</option>
							<option>Green Valley House</option>
							<option>City Room Rental</option>
							<option>Lakeview Villa</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Move In Date</label> <input type="date" />
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>Property</th>
								<th>Tenant</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Message</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="b" items="${bookings}">
								<tr>
									<td>${b.propertyTitle}</td>
									<td>${b.tenantName}</td>
									<td>${b.startDate}</td>
									<td>${b.endDate}</td>
									<td>${b.message}</td>
									<td>${b.status}</td>
									<td><c:if test="${b.status == 'pending'}">
											<a
												href="${pageContext.request.contextPath}/booking?action=approve&id=${b.bookingId}">Approve</a>
						|
						<a
												href="${pageContext.request.contextPath}/booking?action=reject&id=${b.bookingId}">Reject</a>
										</c:if></td>
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
