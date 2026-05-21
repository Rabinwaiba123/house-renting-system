<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${property.title}- RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/property-details.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<c:choose>

		<c:when test="${property == null}">
			<main class="property-detail-page">
				<div class="not-found-card">
					<h2>Property not found</h2>
					<p>The property you are looking for is not available.</p>
					<a href="${pageContext.request.contextPath}/property-list">Back
						to Properties</a>
				</div>
			</main>
		</c:when>

		<c:otherwise>

			<main class="property-detail-page">

				<c:if test="${not empty sessionScope.success}">
					<p class="alert success">${sessionScope.success}</p>
					<c:remove var="success" scope="session" />
				</c:if>

				<c:if test="${not empty sessionScope.error}">
					<p class="alert error">${sessionScope.error}</p>
					<c:remove var="error" scope="session" />
				</c:if>

				<section class="detail-card">

					<div class="detail-top">

						<div class="detail-image">
							<c:choose>
								<c:when test="${not empty property.image}">
									<img src="${pageContext.request.contextPath}/${property.image}"
										alt="${property.title}" class="property-main-img">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
										alt="Property" class="property-main-img">
								</c:otherwise>
							</c:choose>
						</div>

						<div class="detail-info">

							<h1>${property.title}</h1>

							<p class="detail-location">
								<i class="fa fa-map-marker"></i> ${property.location}
							</p>

							<p class="detail-price">Rs. ${property.price} / month</p>

							<div class="detail-meta">

								<div class="meta-box">
									<strong>${property.type}</strong> <span>Type</span>
								</div>

								<div class="meta-box">
									<strong>${property.rooms}</strong> <span>Rooms</span>
								</div>

								<div class="meta-box">
									<strong>${property.bathrooms}</strong> <span>Bathrooms</span>
								</div>

								<div class="meta-box">
									<strong>${property.areaSqft}</strong> <span>Sq. Ft</span>
								</div>

							</div>

							<c:choose>
								<c:when test="${property.availability}">
									<span class="status available">Available</span>
								</c:when>
								<c:otherwise>
									<span class="status unavailable">Not Available</span>
								</c:otherwise>
							</c:choose>

						</div>

					</div>

					<div class="detail-section">
						<h2>Description</h2>
						<p>${property.description}</p>
					</div>

				</section>

				<section class="review-section">
					<h2>Reviews</h2>

					<form action="${pageContext.request.contextPath}/review"
						method="post" class="review-form">

						<input type="hidden" name="propertyId"
							value="${property.propertyId}"> <select name="rating"
							required>
							<option value="">Select Rating</option>
							<option value="5">★★★★★ 5</option>
							<option value="4">★★★★ 4</option>
							<option value="3">★★★ 3</option>
							<option value="2">★★ 2</option>
							<option value="1">★ 1</option>
						</select>

						<textarea name="comment" placeholder="Write your review..."
							required></textarea>

						<button type="submit">Submit Review</button>
					</form>

					<div class="review-list">
						<c:choose>
							<c:when test="${empty reviews}">
								<div class="review-box">
									<p>No reviews yet.</p>
								</div>
							</c:when>

							<c:otherwise>
								<c:forEach var="review" items="${reviews}">
									<div class="review-box">
										<strong>${review.username}</strong>

										<p class="review-stars">
											<c:forEach begin="1" end="${review.rating}">
												★
											</c:forEach>
										</p>

										<p>${review.comment}</p>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</section>

				<section class="booking-card">
					<h2>Book Property</h2>
					<p class="booking-text">Send a booking request to the property
						owner.</p>

					<c:choose>
						<c:when test="${not property.availability}">
							<button type="button" class="book-btn disabled-btn" disabled>
								Property Not Available</button>
						</c:when>

						<c:when test="${alreadyBooked}">
							<button type="button" class="book-btn disabled-btn" disabled>
								Already Booked</button>
						</c:when>

						<c:otherwise>
							<form action="${pageContext.request.contextPath}/booking"
								method="post" class="booking-form">

								<input type="hidden" name="propertyId"
									value="${property.propertyId}">

								<div class="form-group">
									<label>Move In Date</label> <input type="date"
										name="moveInDate" required>
								</div>

								<div class="form-group">
									<label>Duration</label> <select name="durationMonths" required>
										<option value="">Select Duration</option>
										<option value="1">1 Month</option>
										<option value="3">3 Months</option>
										<option value="6">6 Months</option>
										<option value="12">12 Months</option>
									</select>
								</div>

								<div class="form-group full-width">
									<label>Message</label>
									<textarea name="message" placeholder="Write your message"></textarea>
								</div>

								<button type="submit" class="book-btn">Book Now</button>
							</form>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${alreadyWishlisted}">
							<button type="button" class="wishlist-btn disabled-btn" disabled>
								Already in Wishlist</button>
						</c:when>

						<c:otherwise>
							<form action="${pageContext.request.contextPath}/user/wishlist"
								method="post" class="wishlist-form">

								<input type="hidden" name="action" value="add"> <input
									type="hidden" name="propertyId" value="${property.propertyId}">

								<button type="submit" class="wishlist-btn">Add To
									Wishlist</button>
							</form>
						</c:otherwise>
					</c:choose>
				</section>

			</main>

		</c:otherwise>

	</c:choose>
<%-- Include Footer Section --%>
	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>