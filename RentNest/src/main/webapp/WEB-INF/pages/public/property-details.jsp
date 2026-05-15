<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${property.title}-RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/property-details.css">
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f4f4f4;
	color: #222;
}

.property-detail-page {
	padding: 40px 24px;
}

.property-detail-container {
	max-width: 1180px;
	margin: auto;
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 25px;
}

.property-left, .property-right {
	display: flex;
	flex-direction: column;
	gap: 22px;
}

.property-image-box, .property-info-box, .review-box, .booking-card {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

.property-image-box img {
	width: 100%;
	height: 380px;
	object-fit: cover;
	display: block;
}

.property-info-box, .review-box, .booking-card {
	padding: 24px;
}

.property-info-box h1 {
	font-size: 28px;
	margin-bottom: 14px;
	color: #222;
}

.property-meta {
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
	margin-bottom: 20px;
}

.property-meta span {
	background: #fff3ec;
	color: #ef742f;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
}

.property-features {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 14px;
	margin: 22px 0;
}

.property-features div {
	background: #f7f7f7;
	padding: 16px;
	border-radius: 12px;
	text-align: center;
}

.property-features strong {
	font-size: 22px;
	color: #ef742f;
}

.property-features p {
	margin-top: 5px;
	color: #666;
	font-size: 14px;
}

.property-info-box h3, .review-box h2, .booking-card h2 {
	margin-bottom: 12px;
	color: #222;
}

.description {
	line-height: 1.7;
	color: #555;
	margin-bottom: 18px;
}

.availability {
	display: inline-block;
	background: #e9f8ee;
	color: #238b45;
	padding: 8px 14px;
	border-radius: 20px;
	font-weight: bold;
}

.booking-card {
	position: sticky;
	top: 90px;
}

.booking-card p {
	color: #666;
	margin-bottom: 18px;
	line-height: 1.6;
}

.review-form, .booking-card form {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

label {
	font-weight: bold;
	font-size: 14px;
}

input, select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 10px;
	outline: none;
	font-size: 14px;
}

textarea {
	min-height: 100px;
	resize: vertical;
}

input:focus, select:focus, textarea:focus {
	border-color: #ef742f;
}

button {
	border: none;
	border-radius: 25px;
	padding: 13px;
	font-size: 15px;
	cursor: pointer;
}

.review-form button, .book-btn {
	background: #ef742f;
	color: white;
}

.review-form button:hover, .book-btn:hover {
	background: #d96120;
}

.wishlist-btn {
	margin-top: 14px;
	background: white;
	color: #ef742f;
	border: 1px solid #ef742f;
	width: 100%;
}

.wishlist-btn:hover {
	background: #fff3ec;
}

.review-list {
	margin-top: 25px;
}

.single-review {
	background: #f7f7f7;
	padding: 15px;
	border-radius: 12px;
	margin-bottom: 12px;
}

.stars {
	color: #ef742f;
	font-size: 18px;
	margin-bottom: 6px;
}

.alert {
	max-width: 1180px;
	margin: 0 auto 20px;
	padding: 12px 18px;
	border-radius: 10px;
}

.success {
	background: #e9f8ee;
	color: #238b45;
}

.error {
	background: #ffe9e9;
	color: #c62828;
}

@media ( max-width : 900px) {
	.property-detail-container {
		grid-template-columns: 1fr;
	}
	.booking-card {
		position: static;
	}
}

@media ( max-width : 600px) {
	.property-detail-page {
		padding: 24px 14px;
	}
	.property-image-box img {
		height: 240px;
	}
	.property-features {
		grid-template-columns: 1fr;
	}
	.property-info-box h1 {
		font-size: 22px;
	}
}
</style>
<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<c:choose>
		<c:when test="${property == null}">
			<section class="property-detail-page">
				<h2>Property not found</h2>
				<a href="${pageContext.request.contextPath}/property-list">Back
					to Properties</a>
			</section>
		</c:when>

		<c:otherwise>
			<section class="property-detail-page">

				<c:if test="${not empty success}">
					<p class="alert success">${success}</p>
				</c:if>

				<c:if test="${not empty error}">
					<p class="alert error">${error}</p>
				</c:if>

				<div class="property-detail-container">

					<div class="property-left">

						<div class="property-image-box">
							<c:choose>
								<c:when test="${not empty property.image}">
									<img src="${pageContext.request.contextPath}/${property.image}"
										alt="${property.title}">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
										alt="Property">
								</c:otherwise>
							</c:choose>
						</div>

						<div class="property-info-box">
							<h1>${property.title}</h1>

							<div class="property-meta">
								<span>${property.type}</span> <span>${property.location}</span>
								<span>Rs. ${property.price} / month</span>
							</div>

							<div class="property-features">
								<div>
									<strong>${property.bedrooms}</strong>
									<p>Bedrooms</p>
								</div>

								<div>
									<strong>${property.bathrooms}</strong>
									<p>Bathrooms</p>
								</div>

								<div>
									<strong>${property.areaSqft}</strong>
									<p>Sq. Ft</p>
								</div>
							</div>

							<h3>Description</h3>
							<p class="description">${property.description}</p>

							<p class="availability">
								<c:choose>
									<c:when test="${property.availability}">
									Available
								</c:when>
									<c:otherwise>
									Not Available
								</c:otherwise>
								</c:choose>
							</p>
						</div>

						<div class="review-box">
							<h2>Reviews</h2>

							<form action="${pageContext.request.contextPath}/review"
								method="post" class="review-form">
								<input type="hidden" name="propertyId"
									value="${property.propertyId}"> <label>Rating</label> <select
									name="rating" required>
									<option value="">Select rating</option>
									<option value="5">★★★★★ 5</option>
									<option value="4">★★★★ 4</option>
									<option value="3">★★★ 3</option>
									<option value="2">★★ 2</option>
									<option value="1">★ 1</option>
								</select> <label>Your Review</label>
								<textarea name="comment" placeholder="Write your review..."
									required></textarea>

								<button type="submit">Submit Review</button>
							</form>

							<div class="review-list">
								<c:choose>
									<c:when test="${empty reviews}">
										<p>No reviews yet.</p>
									</c:when>

									<c:otherwise>
										<c:forEach var="review" items="${reviews}">
											<div class="single-review">
												<p class="stars">
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
						</div>

					</div>

					<div class="property-right">

						<div class="booking-card">
							<h2>Book Property</h2>
							<p>Send a booking request to the property owner.</p>

							<form action="${pageContext.request.contextPath}/booking"
								method="post">
								<input type="hidden" name="propertyId"
									value="${property.propertyId}"> <input type="date"
									name="moveInDate" required> <select
									name="durationMonths" required>
									<option value="1">1 Month</option>
									<option value="3">3 Months</option>
									<option value="6">6 Months</option>
									<option value="12">12 Months</option>
								</select>

								<textarea name="message" placeholder="Message"></textarea>

								<button type="submit">Book Now</button>
							</form>

							<form action="${pageContext.request.contextPath}/wishlist"
								method="post">
								<input type="hidden" name="action" value="add"> <input
									type="hidden" name="propertyId" value="${property.propertyId}">
								<button type="submit" class="wishlist-btn">Add To
									Wishlist</button>
							</form>
						</div>

					</div>

				</div>
			</section>
		</c:otherwise>
	</c:choose>

	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>