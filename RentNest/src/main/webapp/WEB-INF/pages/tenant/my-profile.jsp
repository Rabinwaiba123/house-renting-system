<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/profile.css">

</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f5f5f5;
	color: #222;
}

.profile-page {
	padding: 40px 20px;
}

.profile-container {
	max-width: 1200px;
	margin: auto;
	display: grid;
	grid-template-columns: 300px 1fr;
	gap: 25px;
}

.profile-sidebar {
	background: white;
	border-radius: 18px;
	padding: 30px 20px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	text-align: center;
	height: fit-content;
}

.profile-image-box {
	width: 140px;
	height: 140px;
	margin: auto;
	border-radius: 50%;
	overflow: hidden;
	border: 4px solid #ef742f;
}

.profile-image-box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile-sidebar h2 {
	margin-top: 18px;
	font-size: 24px;
}

.profile-role {
	color: #777;
	margin-top: 6px;
	margin-bottom: 24px;
}

.profile-menu {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.profile-menu a {
	text-decoration: none;
	padding: 13px;
	border-radius: 10px;
	background: #f7f7f7;
	color: #222;
	font-weight: 500;
	transition: 0.3s;
}

.profile-menu a:hover, .profile-menu a.active {
	background: #ef742f;
	color: white;
}

.profile-content {
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.profile-card {
	background: white;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
}

.profile-card h1, .profile-card h2 {
	margin-bottom: 24px;
	color: #222;
}

.form-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	margin-bottom: 8px;
	font-weight: 600;
	font-size: 14px;
}

.form-group input {
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 10px;
	font-size: 14px;
	outline: none;
}

.form-group input:focus {
	border-color: #ef742f;
}

.update-btn {
	margin-top: 25px;
	padding: 14px 20px;
	border: none;
	border-radius: 30px;
	background: #ef742f;
	color: white;
	font-size: 15px;
	cursor: pointer;
	transition: 0.3s;
}

.update-btn:hover {
	background: #d85f1d;
}

.account-info {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 18px;
}

.account-info div {
	background: #f7f7f7;
	padding: 20px;
	border-radius: 14px;
	text-align: center;
}

.account-info h4 {
	color: #555;
	margin-bottom: 10px;
}

.account-info p {
	font-size: 22px;
	font-weight: bold;
	color: #ef742f;
}

.alert {
	padding: 14px 18px;
	border-radius: 10px;
	font-size: 14px;
}

.success {
	background: #e9f8ee;
	color: #238b45;
}

.error {
	background: #ffe8e8;
	color: #c62828;
}

@media ( max-width : 900px) {
	.profile-container {
		grid-template-columns: 1fr;
	}
	.form-grid {
		grid-template-columns: 1fr;
	}
	.account-info {
		grid-template-columns: 1fr;
	}
}

@media ( max-width : 600px) {
	.profile-page {
		padding: 25px 12px;
	}
	.profile-card {
		padding: 20px;
	}
	.profile-sidebar {
		padding: 25px 16px;
	}
}
</style>
<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<section class="profile-page">

		<div class="profile-container">

			<div class="profile-sidebar">

				<div class="profile-image-box">

					<c:choose>
						<c:when test="${not empty user.profileImage}">
							<img
								src="${pageContext.request.contextPath}/${user.profileImage}"
								alt="Profile">
						</c:when>

						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/photos/default-user.png"
								alt="Profile">
						</c:otherwise>
					</c:choose>

				</div>

				<h2>${user.fullName}</h2>

				<p class="profile-role">${user.role}</p>

				<div class="profile-menu">

					<a href="${pageContext.request.contextPath}/my-profile"
						class="active"> My Profile </a> <a
						href="${pageContext.request.contextPath}/my-bookings"> My
						Bookings </a> <a href="${pageContext.request.contextPath}/wishlist">
						Wishlist </a> <a href="${pageContext.request.contextPath}/logout">
						Logout </a>

				</div>

			</div>

			<div class="profile-content">

				<c:if test="${not empty success}">
					<p class="alert success">${success}</p>
				</c:if>

				<c:if test="${not empty error}">
					<p class="alert error">${error}</p>
				</c:if>

				<div class="profile-card">

					<h1>My Profile</h1>

					<form action="${pageContext.request.contextPath}/update-profile"
						method="post" enctype="multipart/form-data">

						<div class="form-grid">

							<div class="form-group">
								<label>Full Name</label> <input type="text" name="fullName"
									value="${user.fullName}" required>
							</div>

							<div class="form-group">
								<label>Email</label> <input type="email" name="email"
									value="${user.email}" required>
							</div>

							<div class="form-group">
								<label>Phone Number</label> <input type="text" name="phone"
									value="${user.phone}" required>
							</div>

							<div class="form-group">
								<label>Address</label> <input type="text" name="address"
									value="${user.address}">
							</div>

							<div class="form-group">
								<label>Profile Image</label> <input type="file"
									name="profileImage">
							</div>

							<div class="form-group">
								<label>New Password</label> <input type="password"
									name="password" placeholder="Leave empty if unchanged">
							</div>

						</div>

						<button type="submit" class="update-btn">Update Profile</button>

					</form>

				</div>

				<div class="profile-card">

					<h2>Account Information</h2>

					<div class="account-info">

						<div>
							<h4>Member Since</h4>
							<p>${user.createdAt}</p>
						</div>

						<div>
							<h4>Total Bookings</h4>
							<p>${bookingCount}</p>
						</div>

						<div>
							<h4>Wishlist Items</h4>
							<p>${wishlistCount}</p>
						</div>

					</div>

				</div>

			</div>

		</div>

	</section>

	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>