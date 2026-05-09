<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">
</head>

<body>

	<div class="auth-logo">
		<a href="${pageContext.request.contextPath}/">RentNest</a>
	</div>

	<main class="auth auth--login">

		<section class="auth__visual auth__visual--login">
			<div class="auth__overlay"></div>

			<div class="auth__text auth__text--bottom">
				<h1>Find Your Dream Home</h1>
				<p>Discover trusted rental homes and manage your property
					journey with RentNest.</p>
			</div>
		</section>

		<section class="auth__panel">

			<div class="auth__card auth__card--login">

				<div class="auth__header auth__header--center">
					<h2>Welcome Back</h2>
					<p>Login to continue to your account</p>
				</div>

				<c:if test="${not empty errorMessage}">
					<p class="auth-error">${errorMessage}</p>
				</c:if>

				<c:if test="${not empty successMessage}">
					<p class="auth-success">${successMessage}</p>
				</c:if>


				<form class="form" action="${pageContext.request.contextPath}/login"
					method="post">

					<div class="form__group">
						<label>Email</label> <input type="email" name="email"
							placeholder="Enter email" value="${cookie.rememberEmail.value}"
							required>
					</div>

					<div class="form__group">
						<label>Password</label> <input type="password" name="password"
							placeholder="Enter password" required>
					</div>

					<div class="form__group">
						<label> <input type="checkbox" name="remember"
							<c:if test="${not empty cookie.rememberEmail.value}">checked</c:if>>
							Remember me
						</label>
					</div>

					<button type="submit" class="btn btn--primary btn--full">
						Login <span class="arrow-right">→</span>
					</button>

				</form>

				<div class="auth__footer">
					Do not have an account? <a
						href="${pageContext.request.contextPath}/register"
						class="text-link"> Register </a>
				</div>

			</div>

		</section>

	</main>

</body>
</html>