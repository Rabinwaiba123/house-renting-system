<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- Page Title -->
<title>Admin Dashboard</title>

<!-- Main Admin CSS -->
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

			<!-- Search Bar Section -->
			<div class="searchbar2">

				<!-- Search Input -->
				<input type="text" name="" id="" placeholder="Search" />

				<!-- Search Button -->
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>

			</div>

			<!-- Dashboard Heading -->
			<div class="Page-Heading">
				<h1>Welcome back, Admin!</h1>
			</div>

			<!-- Dashboard Statistics Boxes -->
			<div class="box-container">

				<!-- Total Users Box -->
				<div class="box box1">

					<!-- User Icon -->
					<i class="fa fa-users fa-2x"></i>

					<div class="text">
						<p>TOTAL USERS</p>

						<!-- Display Total Users Count -->
						<h2>${totalUsers}</h2>
					</div>

				</div>

				<!-- Total Bookings Box -->
				<div class="box box2">

					<!-- Booking Icon -->
					<i class="fa fa-file-text-o fa-2x"></i>

					<div class="text">
						<p>TOTAL BOOKINGS</p>

						<!-- Display Total Bookings Count -->
						<h2>${totalBookings}</h2>
					</div>

				</div>

				<!-- Total Properties Box -->
				<div class="box box3">

					<!-- Property Icon -->
					<i class="fa fa-home fa-2x"></i>

					<div class="text">
						<p>TOTAL PROPERTIES</p>

						<!-- Display Total Properties Count -->
						<h2>${totalProperties}</h2>
					</div>

				</div>

				<!-- Total Messages Box -->
				<div class="box box4">

					<!-- Message Icon -->
					<i class="fa fa-envelope fa-2x"></i>

					<div class="text">
						<p>TOTAL MESSAGES</p>

						<!-- Display Total Contact Messages Count -->
						<h2>${totalContacts}</h2>
					</div>

				</div>

			</div>

		</div>
	</div>

</body>
</html>