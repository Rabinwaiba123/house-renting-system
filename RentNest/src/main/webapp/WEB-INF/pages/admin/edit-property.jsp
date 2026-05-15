<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

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

			<c:if test="${not empty successMessage}">
				<div class="form-message success">${successMessage}</div>
			</c:if>

			<c:if test="${not empty errorMessage}">
				<div class="form-message error">${errorMessage}</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/admin/edit-property"
				method="post" enctype="multipart/form-data">

				<input type="hidden" name="propertyId"
					value="${property.propertyId}">

				<div class="form-group">
					<label>Property Title</label> <input type="text" name="title"
						value="${property.title}" required>
				</div>

				<div class="form-group">
					<label>Property Type</label> <select name="type" required>

						<option value="">Select Type</option>

						<option value="Room" ${property.type == 'Room' ? 'selected' : ''}>
							Room</option>

						<option value="Flat" ${property.type == 'Flat' ? 'selected' : ''}>
							Flat</option>

						<option value="House"
							${property.type == 'House' ? 'selected' : ''}>House</option>

						<option value="Apartment"
							${property.type == 'Apartment' ? 'selected' : ''}>
							Apartment</option>

					</select>
				</div>

				<div class="form-group">
					<label>Location</label> <input type="text" name="location"
						value="${property.location}" required>
				</div>

				<div class="form-group">
					<label>Monthly Rent</label> <input type="number" name="price"
						value="${property.price}" required>
				</div>

				<div class="form-group">
					<label>Bedrooms</label> <input type="number" name="bedrooms"
						value="${property.bedrooms}" required>
				</div>

				<div class="form-group">
					<label>Bathrooms</label> <input type="number" name="bathrooms"
						value="${property.bathrooms}" required>
				</div>

				<div class="form-group">
					<label>Area (Sqft)</label> <input type="number" name="areaSqft"
						value="${property.areaSqft}">
				</div>

				<div class="form-group">
					<label>Description</label>

					<textarea name="description">${property.description}</textarea>
				</div>

				<div class="form-group">
					<label>Availability</label> <select name="availability" required>

						<option value="true" ${property.availability ? 'selected' : ''}>
							Available</option>

						<option value="false" ${!property.availability ? 'selected' : ''}>
							Not Available</option>

					</select>
				</div>

				<div class="form-group">
					<label>Status</label> <select name="status" required>

						<option value="true" ${property.status ? 'selected' : ''}>
							Approved</option>

						<option value="false" ${!property.status ? 'selected' : ''}>
							Pending / Rejected</option>

					</select>
				</div>

				<div class="form-group">

					<label>Property Image</label> <input type="file" name="image">

					<c:if test="${not empty property.image}">
						<div class="preview-image">

							<img src="${pageContext.request.contextPath}/${property.image}"
								width="120">

						</div>
					</c:if>

				</div>

				<button type="submit">Update Property</button>

			</form>

		</div>
	</div>

</body>
</html>