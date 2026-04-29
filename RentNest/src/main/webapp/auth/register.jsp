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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">
</head>

<body>

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
					<p style="color: red; margin-bottom: 15px;">${errorMessage}</p>
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
									<option value="user">User</option>
									<option value="owner">Owner</option>
								</select>
							</div>
						</div>

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
						<label>Profile Image</label> <input type="file" name="image">
					</div>

					<button type="submit" class="btn btn--primary btn--full">
						Register <span class="arrow-right">→</span>
					</button>

				</form>

				<div class="auth__footer auth__footer--small">
					Already have an account? <a
						href="${pageContext.request.contextPath}/login" class="text-link">
						Login </a>
				</div>

			</div>

		</section>

	</main>

</body>
</html>