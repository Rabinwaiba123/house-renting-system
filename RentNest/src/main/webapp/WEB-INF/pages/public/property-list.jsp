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
	href="${pageContext.request.contextPath}/css/property-list.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main class="property-page">

		<section class="property-list-section">

			<div class="property-header">
				<h1>Available Properties</h1>
				<p>Find rooms, flats, houses and apartments that match your
					budget.</p>
			</div>

			<div class="search-wrapper">
				<form class="search-form"
					action="${pageContext.request.contextPath}/property-list"
					method="get">

					<input type="text" name="keyword" value="${param.keyword}"
						placeholder="Search by title or location..." /> <select
						name="type">
						<option value="">All Types</option>
						<option value="room" ${param.type == 'room' ? 'selected' : ''}>Room</option>
						<option value="house" ${param.type == 'house' ? 'selected' : ''}>House</option>
						<option value="flat" ${param.type == 'flat' ? 'selected' : ''}>Flat</option>
						<option value="apartment"
							${param.type == 'apartment' ? 'selected' : ''}>Apartment</option>
					</select> <input type="number" name="maxPrice" value="${param.maxPrice}"
						placeholder="Max Price" />

					<button type="submit">
						<i class="fa fa-search"></i> Search
					</button>

				</form>
			</div>

			<c:if test="${empty properties}">
				<div class="empty-result">
					<h2>No properties found</h2>
					<p>Try another location, type, or price.</p>
					<a href="${pageContext.request.contextPath}/property-list">View
						all properties</a>
				</div>
			</c:if>

			<c:if test="${not empty properties}">
				<div class="property-grid">

					<c:forEach var="property" items="${properties}">
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

									<span> <i class="fa fa-bed"></i> ${property.rooms} Rooms
									</span> <span> <i class="fa fa-bath"></i> ${property.bathrooms}
										Baths
									</span> <span> <i class="fa fa-expand"></i>
										${property.areaSqft} sqft
									</span>

								</div>

								<p class="price">Rs. ${property.price}</p>

								<div class="card-actions">

									<a
										href="${pageContext.request.contextPath}/property-detail?id=${property.propertyId}"
										class="card-btn"> View Details </a>

								</div>

							</div>

						</article>
					</c:forEach>

				</div>
			</c:if>

		</section>

	</main>

	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>