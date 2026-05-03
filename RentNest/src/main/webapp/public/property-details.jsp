<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>RentNest Properties</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #eeeeee;
	color: #111;
}

.property-details-page {
	padding: 40px 30px;
}

.property-container {
	max-width: 1180px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 2.2fr 1fr;
	gap: 24px;
}

.left-section, .right-section {
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.property-image-card, .property-info-card, .review-card, .booking-card {
	background: #f8f8f8;
	border-radius: 18px;
}

.property-image-card {
	overflow: hidden;
}

.property-image-card img {
	width: 100%;
	height: 360px;
	object-fit: cover;
	display: block;
}

.property-info-card {
	padding: 26px 24px;
	min-height: 250px;
}

.property-info-card h2 {
	font-size: 20px;
	margin-bottom: 20px;
	font-weight: 700;
}

.property-info-card p {
	font-size: 15px;
	color: #666;
	line-height: 1.9;
}

.review-card {
	padding: 22px;
}

.review-card h3 {
	font-size: 18px;
	margin-bottom: 16px;
}

.review-box {
	background: #f2f2f2;
	border-radius: 12px;
	padding: 16px;
	margin-bottom: 24px;
}

.review-box textarea {
	width: 100%;
	height: 110px;
	border: none;
	outline: none;
	resize: none;
	background: #ffffff;
	border-radius: 10px;
	padding: 14px;
	font-size: 14px;
	color: #555;
}

.rating-stars {
	font-size: 34px;
	color: #111;
	margin: 16px 0;
	letter-spacing: 2px;
}

.review-btn {
	width: 100%;
	height: 48px;
	border: none;
	border-radius: 30px;
	background: #ef742f;
	color: #fff;
	font-size: 17px;
	cursor: pointer;
}

.review-btn:hover {
	background: #d96221;
}

.reviews-list h4 {
	font-size: 18px;
	margin-bottom: 22px;
}

.reviews-list p {
	color: #666;
	font-size: 15px;
	padding-left: 14px;
}

.booking-card {
	padding: 28px 22px;
	min-height: 100%;
}

.booking-card h3 {
	font-size: 18px;
	margin-bottom: 8px;
	margin-top: 55px;
}

.booking-card p {
	font-size: 15px;
	color: #777;
	margin-bottom: 24px;
	line-height: 1.6;
}

.book-btn, .wishlist-btn {
	width: 100%;
	height: 50px;
	border-radius: 28px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 18px;
}

.book-btn {
	background: #ef742f;
	border: none;
	color: #fff;
}

.book-btn:hover {
	background: #d96221;
}

.wishlist-btn {
	background: transparent;
	border: 1.5px solid #ef742f;
	color: #7a7a7a;
}

.wishlist-btn:hover {
	background: #fff3ec;
}

@media ( max-width : 900px) {
	.property-container {
		grid-template-columns: 1fr;
	}
	.booking-card h3 {
		margin-top: 0;
	}
}

@media ( max-width : 600px) {
	.property-details-page {
		padding: 20px 14px;
	}
	.property-image-card img {
		height: 240px;
	}
	.property-info-card, .review-card, .booking-card {
		padding: 18px;
	}
	.rating-stars {
		font-size: 28px;
	}
}
</style>
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar.jsp" />

	<c:choose>
		<c:when test="${property == null}">
			<section class="property-details-page">
				<h2>Property not found</h2>
				<a href="${pageContext.request.contextPath}/property?action=list">Back
					to Properties</a>
			</section>
		</c:when>

		<c:otherwise>
			<section class="property-details-page">
				<div class="property-container">
					<div class="left-section">

						<div class="property-image-card">
							<c:choose>
								<c:when test="${not empty property.image}">
									<img src="${pageContext.request.contextPath}/${property.image}"
										alt="${property.title}">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/property1.jpg"
										alt="Property Image">
								</c:otherwise>
							</c:choose>
						</div>

						<div class="property-info-card">
							<h2>${property.title}</h2>

							<p>
								<strong>Location:</strong> ${property.location}
							</p>
							<p>
								<strong>Type:</strong> ${property.type}
							</p>
							<p>
								<strong>Rooms:</strong> ${property.rooms}
							</p>
							<p>
								<strong>Price:</strong> Rs. ${property.price} / month
							</p>
							<p>
								<strong>Availability:</strong> ${property.availability}
							</p>
							<p>
								<strong>Description:</strong> ${property.description}
							</p>
						</div>

					</div>

					<div class="right-section">
						<div class="booking-card">
							<h3>Book This Property</h3>
							<p>Interested in this property? Proceed to booking.</p>

							<a
								href="${pageContext.request.contextPath}/booking?action=book&propertyId=${property.propertyId}">
								<button class="book-btn">Book Now</button>
							</a> <a
								href="${pageContext.request.contextPath}/wishlist?action=add&propertyId=${property.propertyId}">
								<button class="wishlist-btn">Save To Wishlist</button>
							</a>
						</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>

	<!-- ================= FOOTER ================= -->
	<jsp:include page="/include/footer.jsp" />

</body>
</html>
