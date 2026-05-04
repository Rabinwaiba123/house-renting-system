<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Owner Add Property</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar2.jsp">
		<jsp:param name="title" value="Owner Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/owner-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<form action="${pageContext.request.contextPath}/add-property"
				method="post" enctype="multipart/form-data">

				<input type="text" name="title" placeholder="Property Title"
					required> <select name="type" required>
					<option value="">Select Type</option>
					<option value="Room">Room</option>
					<option value="Flat">Flat</option>
					<option value="House">House</option>
					<option value="Apartment">Apartment</option>
				</select> <input type="text" name="location" placeholder="Location" required>

				<input type="number" name="price" placeholder="Monthly Rent"
					required> <input type="number" name="rooms"
					placeholder="Number of Rooms" required>

				<textarea name="description" placeholder="Property Description"></textarea>

				<input type="file" name="image" required>

				<button type="submit">Add Property</button>

			</form>

			<p style="color: green">${success}</p>
			<p style="color: red">${error}</p>
		</div>
	</div>

</body>
</html>
