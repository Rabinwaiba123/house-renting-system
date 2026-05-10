<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Owner Add Property</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<style>
.main form {
	max-width: 700px;
	margin: 30px auto;
	background: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	display: flex;
	flex-direction: column;
	gap: 18px;
}

.main form input, .main form select, .main form textarea {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
	outline: none;
}

.main form input:focus, .main form select:focus, .main form textarea:focus
	{
	border-color: #4CAF50;
	box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.15);
}

.main form textarea {
	min-height: 100px;
	resize: vertical;
}

.main form input[type="file"] {
	border: none;
	padding: 5px;
}

.main form button {
	padding: 12px;
	background: #4CAF50;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
}

.main form button:hover {
	background: #43a047;
}

.message {
	max-width: 700px;
	margin: 15px auto;
	padding: 12px;
	border-radius: 8px;
	text-align: center;
	font-weight: 500;
}

.success {
	background: #d4edda;
	color: #155724;
}

.error {
	background: #f8d7da;
	color: #721c24;
}

@media ( max-width : 768px) {
	.main form {
		padding: 20px;
	}
}
</style>

<body>

	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">

			<div class="searchbar2">
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<c:if test="${not empty successMessage}">
				<div class="message success">${successMessage}</div>
			</c:if>

			<c:if test="${not empty errorMessage}">
				<div class="message error">${errorMessage}</div>
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