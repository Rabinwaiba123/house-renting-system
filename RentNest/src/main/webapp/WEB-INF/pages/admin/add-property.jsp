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
<style>
/* ================= FORM CONTAINER ================= */
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

/* ================= INPUTS ================= */
.main form input, .main form select, .main form textarea {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
	transition: all 0.3s ease;
	outline: none;
}

/* Focus Effect */
.main form input:focus, .main form select:focus, .main form textarea:focus
	{
	border-color: #4CAF50;
	box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.15);
}

/* ================= TEXTAREA ================= */
.main form textarea {
	min-height: 100px;
	resize: vertical;
}

/* ================= FILE INPUT ================= */
.main form input[type="file"] {
	border: none;
	padding: 5px;
}

/* ================= BUTTON ================= */
.main form button {
	padding: 12px;
	background: #4CAF50;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s;
}

/* Hover */
.main form button:hover {
	background: #43a047;
	transform: translateY(-1px);
}

/* ================= SUCCESS / ERROR ================= */
.main p {
	text-align: center;
	font-weight: 500;
	margin-top: 10px;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 768px) {
	.main form {
		padding: 20px;
	}
}
</style>
<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

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
