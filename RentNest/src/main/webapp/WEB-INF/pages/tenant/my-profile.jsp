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
	href="${pageContext.request.contextPath}/css/user/Profile.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>

<body>

	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<section class="profile-page">

		<div class="profile-container">

			<div class="profile-sidebar">

				<div class="profile-image-box">

					<c:choose>
						<c:when test="${not empty user.image}">
							<img src="${pageContext.request.contextPath}/${user.image}"
								alt="Profile">
						</c:when>

						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/icons/default-user.jpg"
								alt="Profile">
						</c:otherwise>
					</c:choose>

				</div>

				<h2>${user.fullName}</h2>

				<p class="profile-role">${user.role}</p>

				<div class="profile-menu">

					<a href="${pageContext.request.contextPath}/user/profile"
						class="active"> My Profile </a> <a
						href="${pageContext.request.contextPath}/user/my-bookings">My
						Bookings</a><a href="${pageContext.request.contextPath}/user/wishlist">Wishlist</a>
					<a href="${pageContext.request.contextPath}/logout"> Logout </a>

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

					<form action="${pageContext.request.contextPath}/user/profile"
						method="post" enctype="multipart/form-data">

						<div class="form-grid">

							<div class="form-group">
								<label>Full Name</label> <input type="text" name="fullName"
									value="${user.fullName}" required>
							</div>

							<div class="form-group">
								<label>Email</label> <input type="email" name="email"
									value="${user.email}" readonly>
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
								<label>Profile Image</label> <input type="file" name="image">
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