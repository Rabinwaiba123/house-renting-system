<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Tag Library -->
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<!-- Page Title -->
<title>Admin Bookings</title>

<!-- Admin Dashboard CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<!-- Include Admin Navbar -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

		<!-- ================= SIDEBAR ================= -->

		<!-- Include Admin Sidebar -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<!-- ================= MAIN CONTENT ================= -->

		<div class="main">

			<!-- Search Bar -->
			<div class="searchbar2">

				<!-- Search Input -->
				<input type="text" placeholder="Search" />

				<!-- Search Button -->
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>

			</div>

			<!-- ================= BOOKINGS TABLE ================= -->

			<div class="table-container">

				<!-- Table Header -->
				<div class="table-header">

					<h1 class="table-heading">Bookings</h1>

				</div>

				<!-- Table Body -->
				<div class="table-body">

					<table class="users-table">

						<!-- Table Column Headers -->
						<thead>

							<tr>

								<th>S.N</th>
								<th>Tenant</th>
								<th>Property Title</th>
								<th>Booking Date</th>
								<th>Move In Date</th>
								<th>Duration</th>
								<th>Action</th>

							</tr>

						</thead>

						<!-- Table Data -->
						<tbody>

							<!-- Check if bookings list is empty -->
							<c:choose>

								<!-- If no bookings available -->
								<c:when test="${empty bookings}">

									<tr>

										<td colspan="7">No bookings found.</td>

									</tr>

								</c:when>

								<!-- If bookings exist -->
								<c:otherwise>

									<!-- Loop through all bookings -->
									<c:forEach var="booking"
										items="${bookings}"
										varStatus="status">

										<tr>

											<!-- Serial Number -->
											<td>${status.count}</td>

											<!-- Tenant Username -->
											<td>${booking.username}</td>

											<!-- Property Title -->
											<td>${booking.title}</td>

											<!-- Booking Date -->
											<td>${booking.bookingDate}</td>

											<!-- Move In Date -->
											<td>${booking.moveInDate}</td>

											<!-- Duration in Months -->
											<td>${booking.durationMonths} Months</td>

											<!-- Action Buttons -->
											<td class="actions">

												<!-- Delete Booking Form -->
												<form
													action="${pageContext.request.contextPath}/admin/manage-bookings"
													method="post">

													<!-- Action Type -->
													<input type="hidden"
														name="action"
														value="delete">

													<!-- Booking ID -->
													<input type="hidden"
														name="bookingId"
														value="${booking.bookingId}">

													<!-- Delete Button -->
													<button type="submit"
														class="delete-btn">
														Delete
													</button>

												</form>

											</td>

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