<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Tag Library -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Property</title>

<!-- External CSS file for admin panel styling -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<!-- Font Awesome icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<!-- Include Admin Navigation Bar -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

		<!-- Include Admin Sidebar -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">

			<!-- Search Bar Section -->
			<div class="searchbar2">

				<!-- Search input -->
				<input type="text" placeholder="Search" />

				<!-- Search button with icon -->
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<!-- Display success message if available -->
			<c:if test="${not empty successMessage}">
				<div class="form-message success">${successMessage}</div>
			</c:if>

			<!-- Display error message if available -->
			<c:if test="${not empty errorMessage}">
				<div class="form-message error">${errorMessage}</div>
			</c:if>

			<!-- Property Add Form -->
			<form action="${pageContext.request.contextPath}/admin/add-property"
				method="post" enctype="multipart/form-data">

				<!-- Property Title -->
				<input type="text" name="title" placeholder="Property Title"
					value="${property.title}" required>

				<!-- Property Type Dropdown -->
				<select name="type" required>
					<option value="">Select Type</option>
					<option value="Room">Room</option>
					<option value="Flat">Flat</option>
					<option value="House">House</option>
					<option value="Apartment">Apartment</option>
				</select>

				<!-- Property Location -->
				<input type="text" name="location" placeholder="Location"
					value="${property.location}" required>

				<!-- Monthly Rent Price -->
				<input type="number" name="price"
					placeholder="Monthly Rent"
					value="${property.price}" required>

				<!-- Number of Rooms -->
				<input type="number" name="rooms"
					placeholder="Number of rooms"
					value="${property.rooms}" required>

				<!-- Number of Bathrooms -->
				<input type="number" name="bathrooms"
					placeholder="Number of Bathrooms"
					value="${property.bathrooms}" required>

				<!-- Area in Square Feet -->
				<input type="number" name="areaSqft"
					placeholder="Area Sqft"
					value="${property.areaSqft}">

				<!-- Property Description -->
				<textarea name="description"
					placeholder="Property Description">${property.description}</textarea>

				<!-- Upload Property Image -->
				<input type="file" name="image">

				<!-- Submit Button -->
				<button type="submit">Add Property</button>

			</form>

		</div>
	</div>

</body>
</html>