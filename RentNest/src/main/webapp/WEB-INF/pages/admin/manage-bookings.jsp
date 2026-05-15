<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Bookings</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />



	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Bookings</h1>
				</div>


				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>S.N</th>
								<th>User ID</th>
								<th>Property ID</th>
								<th>Booking Date</th>
								<th>Move In Date</th>
								<th>Duration</th>
								<th>Action</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${empty bookings}">
									<tr>
										<td>No bookings found.</td>
									</tr>
								</c:when>

								<c:otherwise>
									<c:forEach var="booking" items="${bookings}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${booking.userId}</td>
											<td>${booking.propertyId}</td>
											<td>${booking.bookingDate}</td>
											<td>${booking.moveInDate}</td>
											<td>${booking.durationMonths}Months</td>
											<td class="actions"><form
													action="${pageContext.request.contextPath}/admin/manage-bookings"
													method="post">
													<input type="hidden" name="action" value="delete">
													<input type="hidden" name="bookingId"
														value="${booking.bookingId}">
													<button type="submit" class="delete-btn">Delete</button>
												</form></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
