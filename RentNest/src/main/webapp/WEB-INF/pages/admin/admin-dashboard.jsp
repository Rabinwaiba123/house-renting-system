<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar2.jsp">
		<jsp:param name="title" value="Admin Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>
			<div class="Page-Heading">
				<h1>Welcome back, Admin!</h1>
			</div>
			<div class="box-container">
				<div class="box box1">
					<i class="fa fa-users fa-2x"></i>
					<div class="text">
						<p>TOTAL USERS</p>
						<h2>12</h2>
					</div>
				</div>

				<div class="box box2">
					<i class="fa fa-users fa-2x"></i>
					<div class="text">
						<p>TOTAL OWNERS</p>
						<h2>24</h2>
					</div>
				</div>

				<div class="box box3">
					<i class="fa fa-file-text-o fa-2x"></i>
					<div class="text">
						<p>TOTAL BOOKINGS</p>
						<h2>8</h2>
					</div>
				</div>

				<div class="box box4">
					<i class="fa fa-home fa-2x"></i>
					<div class="text">
						<p>TOTAL PROPERTIES</p>
						<h2>423</h2>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>
