<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>RentNest Home</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main>

		<!-- ================= HERO SECTION ================= -->
		<section class="hero-section">
			<div class="container hero-container">

				<div class="hero-text">
					<h1>A Smarter Way to Rent Homes and Rooms</h1>
					<p>Find verified rooms, flats, apartments and houses easily
						with RentNest.</p>

					<a href="${pageContext.request.contextPath}/property-list"
						class="btn hero-btn">Explore Properties</a>
				</div>

				<div class="hero-image">
					<img
						src="${pageContext.request.contextPath}/images/photos/house-hero.jpg"
						alt="Modern rental house">
				</div>

			</div>
		</section>


		<!-- ================= LATEST PROPERTIES ================= -->
		<section class="latest-section" id="properties">
			<div class="container">

				<div class="section-heading">
					<h2>Latest Properties</h2>
					<p>Recently added available properties for rent.</p>
				</div>
				<c:choose>
					<c:when test="${not empty latestProperties}">
						<div class="property-grid">
							<c:forEach var="property" items="${latestProperties}">
								<article class="property-card">
									<div class="property-image">
										<c:choose>
											<c:when test="${not empty property.image}">
												<img
													src="${pageContext.request.contextPath}/${property.image}"
													alt="${property.title}">
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
													alt="Property">
											</c:otherwise>
										</c:choose>
										<span class="property-type">${property.type}</span>
									</div>
									<div class="card-body">
										<h3>${property.title}</h3>
										<p class="location">
											<i class="fa fa-map-marker"></i> ${property.location}
										</p>
										<div class="property-info">
											<span><i class="fa fa-bed"></i> ${property.rooms}
												Rooms</span> <span><i class="fa fa-bath"></i>
												${property.bathrooms} Baths</span> <span><i
												class="fa fa-expand"></i> ${property.areaSqft} sqft</span>
										</div>
										<p class="price">Rs. ${property.price}</p>

										<div class="card-actions">
											<a
												href="${pageContext.request.contextPath}/property-detail?id=${property.propertyId}"
												class="card-btn">View Details</a>
										</div>
									</div>
								</article>
							</c:forEach>
						</div>
						<div class="view-all-box">
							<a href="${pageContext.request.contextPath}/property-list"
								class="btn">View All Properties</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="empty-box">
							<h3>No latest properties found.</h3>
							<p>Please add available properties from the admin panel.</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</section>


		<!-- ================= WHY CHOOSE US ================= -->
		<section class="why-section">
			<div class="container">

				<div class="section-heading">
					<h2>Why Choose Us</h2>
					<p>Simple, fast and reliable rental property system.</p>
				</div>

				<div class="feature-grid">

					<div class="feature-card">
						<img
							src="${pageContext.request.contextPath}/images/icons/search_icon_125165.svg"
							class="why-img" alt="Search">
						<h3>Easy to Find</h3>
						<p>Search properties by location, type and budget easily.</p>
					</div>

					<div class="feature-card">
						<img
							src="${pageContext.request.contextPath}/images/icons/label_114874.svg"
							class="why-img" alt="Price">
						<h3>Affordable Prices</h3>
						<p>Find suitable rental properties within your budget.</p>
					</div>

					<div class="feature-card">
						<img
							src="${pageContext.request.contextPath}/images/icons/3507760-clock-history-iconoteka-time-watch_107692.svg"
							class="why-img" alt="Fast">
						<h3>Quick Process</h3>
						<p>View details and send booking requests quickly.</p>
					</div>

				</div>

			</div>
		</section>

	</main>

	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>