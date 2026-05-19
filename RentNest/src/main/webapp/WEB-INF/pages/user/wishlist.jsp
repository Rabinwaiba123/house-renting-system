<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Wishlist</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/Wishlist.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main class="wishlist-page">

		<div class="wishlist-container">

			<div class="wishlist-heading">
				<h1>My Wishlist</h1>
				<p>Your saved properties</p>
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
				<c:when test="${empty wishlist}">
					<div class="empty-box">
						<h2>No wishlist items found.</h2>
						<a href="${pageContext.request.contextPath}/property-list">Browse
							Properties</a>
					</div>
				</c:when>

				<c:otherwise>
					<div class="properties-grid">

						<c:forEach var="item" items="${wishlist}">
							<article class="property-card">

								<div class="property-image">
									<c:choose>
										<c:when test="${not empty item.image}">
											<img src="${pageContext.request.contextPath}/${item.image}"
												alt="${item.title}">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath}/images/photos/default-property.jpg"
												alt="Property">
										</c:otherwise>
									</c:choose>

									<span class="property-type">${item.type}</span>
								</div>

								<div class="card-body">

									<h3>${item.title}</h3>

									<p class="location">
										<i class="fa fa-map-marker"></i> ${item.location}
									</p>

									<div class="property-info">
										<span><i class="fa fa-bed"></i> ${item.rooms} Rooms</span> <span><i
											class="fa fa-bath"></i> ${item.bathrooms} Baths</span> <span><i
											class="fa fa-expand"></i> ${item.areaSqft} sqft</span>
									</div>

									<p class="price">Rs. ${item.price}</p>

									<div class="card-actions">
										<a
											href="${pageContext.request.contextPath}/property-detail?id=${item.propertyId}"
											class="card-btn">View Details</a>

										<form
											action="${pageContext.request.contextPath}/user/wishlist"
											method="post">
											<input type="hidden" name="action" value="delete"> <input
												type="hidden" name="wishlistId" value="${item.wishlistId}">
											<button type="submit" class="remove-btn">Remove</button>
										</form>
									</div>

								</div>

							</article>
						</c:forEach>

					</div>
				</c:otherwise>
			</c:choose>

		</div>

	</main>

</body>
</html>
