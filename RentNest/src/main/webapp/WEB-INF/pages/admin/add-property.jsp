<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Property</title>

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
						src="${pageContext.request.contextPath}/images/icons/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<c:if test="${not empty successMessage}">
				<div class="form-message success">${successMessage}</div>
			</c:if>

			<c:if test="${not empty errorMessage}">
				<div class="form-message error">${errorMessage}</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/admin/add-property"
				method="post" enctype="multipart/form-data">

				<input type="text" name="title" placeholder="Property Title"
					value="${property.title}" required> <select name="type"
					required>
					<option value="">Select Type</option>
					<option value="Room">Room</option>
					<option value="Flat">Flat</option>
					<option value="House">House</option>
					<option value="Apartment">Apartment</option>
				</select> <input type="text" name="location" placeholder="Location"
					value="${property.location}" required> <input type="number"
					name="price" placeholder="Monthly Rent" value="${property.price}"
					required> <input type="number" name="bedrooms"
					placeholder="Number of Bedrooms" value="${property.bedrooms}"
					required> <input type="number" name="bathrooms"
					placeholder="Number of Bathrooms" value="${property.bathrooms}"
					required> <input type="number" name="areaSqft"
					placeholder="Area Sqft" value="${property.areaSqft}">

				<textarea name="description" placeholder="Property Description">${property.description}</textarea>

				<input type="file" name="image">

				<button type="submit">Add Property</button>

			</form>

		</div>
	</div>

</body>
</html>