<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Register - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css?v=50">
</head>
<body>

	<div class="auth-logo">
		<a href="${pageContext.request.contextPath}/">RentNest</a>
	</div>

	<main class="auth auth--register">

		<section class="auth__visual auth__visual--register">
			<div class="auth__overlay"></div>

			<div class="auth__text auth__text--center">
				<h1>Join RentNest</h1>
				<p>Create your account and begin your journey to finding
					comfortable and trusted rental homes.</p>
			</div>
		</section>

		<section class="auth__panel">

			<div class="auth__card auth__card--register">

				<div class="auth__header auth__header--left">
					<h2>Create Account</h2>
					<p>Register your RentNest account</p>
				</div>

				<c:if test="${not empty errorMessage}">
					<p class="auth-error">${errorMessage}</p>
				</c:if>

				<form class="form"
					action="${pageContext.request.contextPath}/register" method="post"
					enctype="multipart/form-data">

					<div class="form__grid">

						<div class="form__group">
							<label>Full Name</label> <input type="text" name="fullName"
								placeholder="Enter full name">
						</div>

						<div class="form__group">
							<label>Email</label> <input type="email" name="email"
								placeholder="Enter email">
						</div>

					</div>

					<div class="form__grid">

						<div class="form__group">
							<label>Phone</label> <input type="text" name="phone"
								placeholder="Enter phone number">
						</div>

						<div class="form__group">
							<label>Role</label>
							<div class="select-wrap">
								<select name="role">
									<option value="tenant">Tenant</option>

								</select>
							</div>
						</div>

					</div>

					<div class="form__group">
						<label>Address</label> <input type="text" name="address"
							placeholder="Enter address">
					</div>

					<div class="form__grid">

						<div class="form__group">
							<label>Password</label> <input type="password" name="password"
								placeholder="Enter password">
						</div>

						<div class="form__group">
							<label>Confirm Password</label> <input type="password"
								name="confirmPassword" placeholder="Confirm password">
						</div>

					</div>

					<div class="form__group">
						<label>Profile Image</label> <input type="file" name="image"
							accept="image/*">
					</div>

					<button type="submit" class="btn btn--primary btn--full">
						Register <span class="arrow-right">→</span>
					</button>

				</form>

				<div class="auth__footer">
					Already have an account? <a
						href="${pageContext.request.contextPath}/login" class="text-link">
						Login </a>
				</div>

			</div>

		</section>

	</main>

</body>
</html>