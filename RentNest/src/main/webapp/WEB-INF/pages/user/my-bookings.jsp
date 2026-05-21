<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/MyBooking.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main class="booking-page">

		<div class="booking-container">

			<div class="booking-heading">
				<h1>My Bookings</h1>
				<p>Manage your booked properties.</p>
			</div>

			<c:if test="${not empty sessionScope.success}">
				<p class="alert success">${sessionScope.success}</p>
				<c:remove var="success" scope="session" />
			</c:if>

			<c:if test="${not empty sessionScope.error}">
				<p class="alert error">${sessionScope.error}</p>
				<c:remove var="error" scope="session" />
			</c:if>

			<c:choose>

				<c:when test="${empty bookings}">

					<div class="empty-box">
						<h2>No bookings found.</h2>

						<p>You have not booked any properties yet.</p>

						<a href="${pageContext.request.contextPath}/property-list">
							Browse Properties </a>
					</div>

				</c:when>

				<c:otherwise>

					<div class="booking-grid">

						<c:forEach var="b" items="${bookings}">

							<div class="booking-card">

								<div class="booking-image">

									<c:choose>

										<c:when test="${not empty b.image}">

											<img src="${pageContext.request.contextPath}/${b.image}"
												alt="${b.title}">

										</c:when>

										<c:otherwise>

											<img
												src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
												alt="Property">

										</c:otherwise>

									</c:choose>

								</div>

								<div class="booking-content">

									<span class="property-type">${b.type}</span>

									<h2>${b.title}</h2>

									<p class="location">
										<i class="fa fa-map-marker"></i> ${b.location}
									</p>

									<div class="property-info">

										<span>${b.rooms} Rooms</span> <span>${b.bathrooms}
											Baths</span> <span>${b.areaSqft} sqft</span>

									</div>

									<h3>Rs. ${b.price}</h3>

									<div class="booking-details">

										<p>
											<strong>Booking Date:</strong> ${b.bookingDate}
										</p>

										<p>
											<strong>Move In:</strong> ${b.moveInDate}
										</p>

										<p>
											<strong>Duration:</strong> ${b.durationMonths} Months
										</p>

										<c:if test="${not empty b.message}">
											<p>
												<strong>Message:</strong> ${b.message}
											</p>
										</c:if>

									</div>

									<div class="booking-actions">

										<a
											href="${pageContext.request.contextPath}/property-detail?id=${b.propertyId}"
											class="view-btn"> View Property </a>

									</div>

								</div>

							</div>

						</c:forEach>

					</div>

				</c:otherwise>

			</c:choose>

		</div>

	</main>

</body>
</html>