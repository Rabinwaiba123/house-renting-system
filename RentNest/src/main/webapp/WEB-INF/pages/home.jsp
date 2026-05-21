<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!-- JSTL Core Tag Library -->
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>

<!-- Character Encoding -->
<meta charset="UTF-8">

<!-- Responsive Viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Page Title -->
<title>RentNest Home</title>

<!-- Common CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<!-- Navbar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<!-- Home Page CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<!-- Include Navigation Bar -->
	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main>

		<!-- ================= HERO SECTION ================= -->

		<section class="hero-section">

			<div class="container hero-container">

				<!-- Hero Text Content -->
				<div class="hero-text">

					<h1>A Smarter Way to Rent Homes and Rooms</h1>

					<p>
						Find verified rooms, flats, apartments and houses easily
						with RentNest.
					</p>

					<!-- Explore Properties Button -->
					<a href="${pageContext.request.contextPath}/property-list"
						class="btn hero-btn">

						Explore Properties

					</a>

				</div>

				<!-- Hero Image -->
				<div class="hero-image">

					<img
						src="${pageContext.request.contextPath}/images/photos/house-hero.jpg"
						alt="Modern rental house">

				</div>

			</div>

		</section>

		<!-- ================= LATEST PROPERTIES SECTION ================= -->

		<section class="latest-section" id="properties">

			<div class="container">

				<!-- Section Heading -->
				<div class="section-heading">

					<h2>Latest Properties</h2>

					<p>
						Recently added available properties for rent.
					</p>

				</div>

				<!-- Check if latest properties exist -->
				<c:choose>

					<!-- If Properties Exist -->
					<c:when test="${not empty latestProperties}">

						<div class="property-grid">

							<!-- Loop Through Latest Properties -->
							<c:forEach var="property"
								items="${latestProperties}">

								<!-- Single Property Card -->
								<article class="property-card">

									<!-- Property Image -->
									<div class="property-image">

										<c:choose>

											<!-- If Property Image Exists -->
											<c:when test="${not empty property.image}">

												<img
													src="${pageContext.request.contextPath}/${property.image}"
													alt="${property.title}">

											</c:when>

											<!-- Default Image -->
											<c:otherwise>

												<img
													src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
													alt="Property">

											</c:otherwise>

										</c:choose>

										<!-- Property Type -->
										<span class="property-type">
											${property.type}
										</span>

									</div>

									<!-- Property Details -->
									<div class="card-body">

										<!-- Property Title -->
										<h3>${property.title}</h3>

										<!-- Property Location -->
										<p class="location">

											<i class="fa fa-map-marker"></i>
											${property.location}

										</p>

										<!-- Property Information -->
										<div class="property-info">

											<!-- Number of Rooms -->
											<span>

												<i class="fa fa-bed"></i>
												${property.rooms} Rooms

											</span>

											<!-- Number of Bathrooms -->
											<span>

												<i class="fa fa-bath"></i>
												${property.bathrooms} Baths

											</span>

											<!-- Property Area -->
											<span>

												<i class="fa fa-expand"></i>
												${property.areaSqft} sqft

											</span>

										</div>

										<!-- Property Price -->
										<p class="price">

											Rs. ${property.price}

										</p>

										<!-- Card Action Button -->
										<div class="card-actions">

											<a
												href="${pageContext.request.contextPath}/property-detail?id=${property.propertyId}"
												class="card-btn">

												View Details

											</a>

										</div>

									</div>

								</article>

							</c:forEach>

						</div>

						<!-- View All Properties Button -->
						<div class="view-all-box">

							<a href="${pageContext.request.contextPath}/property-list"
								class="btn">

								View All Properties

							</a>

						</div>

					</c:when>

					<!-- If No Properties Exist -->
					<c:otherwise>

						<div class="empty-box">

							<h3>No latest properties found.</h3>

							<p>
								Please add available properties from the admin panel.
							</p>

						</div>

					</c:otherwise>

				</c:choose>

			</div>

		</section>

		<!-- ================= WHY CHOOSE US SECTION ================= -->

		<section class="why-section">

			<div class="container">

				<!-- Section Heading -->
				<div class="section-heading">

					<h2>Why Choose Us</h2>

					<p>
						Simple, fast and reliable rental property system.
					</p>

				</div>

				<!-- Feature Cards -->
				<div class="feature-grid">

					<!-- Easy Search Feature -->
					<div class="feature-card">

						<img
							src="${pageContext.request.contextPath}/images/icons/search_icon_125165.svg"
							class="why-img"
							alt="Search">

						<h3>Easy to Find</h3>

						<p>
							Search properties by location, type and budget easily.
						</p>

					</div>

					<!-- Affordable Price Feature -->
					<div class="feature-card">

						<img
							src="${pageContext.request.contextPath}/images/icons/label_114874.svg"
							class="why-img"
							alt="Price">

						<h3>Affordable Prices</h3>

						<p>
							Find suitable rental properties within your budget.
						</p>

					</div>

					<!-- Quick Process Feature -->
					<div class="feature-card">

						<img
							src="${pageContext.request.contextPath}/images/icons/3507760-clock-history-iconoteka-time-watch_107692.svg"
							class="why-img"
							alt="Fast">

						<h3>Quick Process</h3>

						<p>
							View details and send booking requests quickly.
						</p>

					</div>

				</div>

			</div>

		</section>

	</main>

	<!-- ================= FOOTER ================= -->

	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>