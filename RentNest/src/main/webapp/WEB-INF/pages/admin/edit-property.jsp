<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Tag Library -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<!-- Character Encoding -->
<meta charset="UTF-8">

<!-- Page Title -->
<title>Edit Property</title>

<!-- Admin CSS -->
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

			<!-- Success Message -->
			<c:if test="${not empty successMessage}">
				<div class="form-message success">${successMessage}</div>
			</c:if>

			<!-- Error Message -->
			<c:if test="${not empty errorMessage}">
				<div class="form-message error">${errorMessage}</div>
			</c:if>

			<!-- ================= EDIT PROPERTY FORM ================= -->

			<form action="${pageContext.request.contextPath}/admin/edit-property"
				method="post" enctype="multipart/form-data">

				<!-- Hidden Property ID -->
				<input type="hidden" name="propertyId"
					value="${property.propertyId}">

				<!-- Property Title -->
				<div class="form-group">

					<label>Property Title</label>

					<input type="text" name="title"
						value="${property.title}" required>

				</div>

				<!-- Property Type -->
				<div class="form-group">

					<label>Property Type</label>

					<select name="type" required>

						<option value="">Select Type</option>

						<!-- Room Option -->
						<option value="Room"
							${property.type == 'Room' ? 'selected' : ''}>
							Room
						</option>

						<!-- Flat Option -->
						<option value="Flat"
							${property.type == 'Flat' ? 'selected' : ''}>
							Flat
						</option>

						<!-- House Option -->
						<option value="House"
							${property.type == 'House' ? 'selected' : ''}>
							House
						</option>

						<!-- Apartment Option -->
						<option value="Apartment"
							${property.type == 'Apartment' ? 'selected' : ''}>
							Apartment
						</option>

					</select>

				</div>

				<!-- Property Location -->
				<div class="form-group">

					<label>Location</label>

					<input type="text" name="location"
						value="${property.location}" required>

				</div>

				<!-- Monthly Rent -->
				<div class="form-group">

					<label>Monthly Rent</label>

					<input type="number" name="price"
						value="${property.price}" required>

				</div>

				<!-- Number of Rooms -->
				<div class="form-group">

					<label>Rooms</label>

					<input type="number" name="rooms"
						value="${property.rooms}" required>

				</div>

				<!-- Number of Bathrooms -->
				<div class="form-group">

					<label>Bathrooms</label>

					<input type="number" name="bathrooms"
						value="${property.bathrooms}" required>

				</div>

				<!-- Area in Square Feet -->
				<div class="form-group">

					<label>Area (Sqft)</label>

					<input type="number" name="areaSqft"
						value="${property.areaSqft}">

				</div>

				<!-- Property Description -->
				<div class="form-group">

					<label>Description</label>

					<textarea name="description">${property.description}</textarea>

				</div>

				<!-- Property Availability -->
				<div class="form-group">

					<label>Availability</label>

					<select name="availability" required>

						<!-- Available Option -->
						<option value="true"
							${property.availability ? 'selected' : ''}>
							Available
						</option>

						<!-- Not Available Option -->
						<option value="false"
							${!property.availability ? 'selected' : ''}>
							Not Available
						</option>

					</select>

				</div>

				<!-- Property Approval Status -->
				<div class="form-group">

					<label>Status</label>

					<select name="status" required>

						<!-- Approved Option -->
						<option value="true"
							${property.status ? 'selected' : ''}>
							Approved
						</option>

						<!-- Pending or Rejected Option -->
						<option value="false"
							${!property.status ? 'selected' : ''}>
							Pending / Rejected
						</option>

					</select>

				</div>

				<!-- Property Image Upload -->
				<div class="form-group">

					<label>Property Image</label>

					<!-- Upload New Image -->
					<input type="file" name="image">

					<!-- Show Existing Image if Available -->
					<c:if test="${not empty property.image}">

						<div class="preview-image">

							<img
								src="${pageContext.request.contextPath}/${property.image}"
								width="120">

						</div>

					</c:if>

				</div>

				<!-- Submit Button -->
				<button type="submit">Update Property</button>

			</form>

		</div>
	</div>

</body>
</html>