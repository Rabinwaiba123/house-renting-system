<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth/auth.css">
</head>

<body>

	<header class="auth-logo">
		<a href="${pageContext.request.contextPath}/home">RentNest</a>
	</header>

	<main class="auth-page">
		<section class="auth-card login-card">

			<div class="form-header">
				<h2>Welcome Back</h2>
				<p>Login to continue using RentNest</p>
			</div>

			<c:if test="${not empty errorMessage}">
				<p class="auth-error">${errorMessage}</p>
			</c:if>

			<c:if test="${not empty successMessage}">
				<p class="auth-success">${successMessage}</p>
			</c:if>

			<form action="${pageContext.request.contextPath}/login" method="post">

				<div class="form-group">
					<label>Email Address</label> <input type="email" name="email"
						placeholder="Enter your email"
						value="${cookie.rememberEmail.value}" required>
				</div>

				<div class="form-group">
					<label>Password</label> <input type="password" name="password"
						placeholder="Enter your password" required>
				</div>

				<label class="remember-box"> <input type="checkbox"
					name="remember"
					<c:if test="${not empty cookie.rememberEmail.value}">checked</c:if>>
					Remember me
				</label>

				<button type="submit">Login</button>
			</form>

			<div class="form-footer">
				Don't have an account? <a
					href="${pageContext.request.contextPath}/register">Register</a>
			</div>

		</section>
	</main>

</body>
</html>