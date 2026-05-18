<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Register - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth/auth.css">
</head>

<body>

	<header class="auth-logo">
		<a href="${pageContext.request.contextPath}/home">RentNest</a>
	</header>

	<main class="auth-page">
		<section class="auth-card register-card">

			<div class="form-header">
				<h2>Create Account</h2>
				<p>Register to find and book rental properties easily</p>
			</div>

			<c:if test="${not empty errorMessage}">
				<p class="auth-error">${errorMessage}</p>
			</c:if>

			<c:if test="${not empty successMessage}">
				<p class="auth-success">${successMessage}</p>
			</c:if>

			<form action="${pageContext.request.contextPath}/register"
				method="post" enctype="multipart/form-data">

				<div class="form-grid">

					<div class="form-group">
						<label>Full Name</label> <input type="text" name="fullName"
							placeholder="Enter full name" required>
					</div>

					<div class="form-group">
						<label>Email Address</label> <input type="email" name="email"
							placeholder="Enter email address" required>
					</div>

					<div class="form-group">
						<label>Phone Number</label> <input type="text" name="phone"
							placeholder="Enter phone number" required>
					</div>

					<div class="form-group">
						<label>Address</label> <input type="text" name="address"
							placeholder="Enter address" required>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password" name="password"
							placeholder="Enter password" required>
					</div>

					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							name="confirmPassword" placeholder="Confirm password" required>
					</div>

					<div class="form-group full">
						<label>Profile Image</label> <input type="file" name="image"
							accept="image/*">
					</div>

				</div>

				<button type="submit">Register</button>
			</form>

			<div class="form-footer">
				Already have an account? <a
					href="${pageContext.request.contextPath}/login">Login</a>
			</div>

		</section>
	</main>

</body>
</html>