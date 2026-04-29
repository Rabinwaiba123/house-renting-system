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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">
</head>

<body>

	<main class="auth auth--login">

		<section class="auth__visual auth__visual--login">
			<div class="auth__overlay"></div>

			<div class="auth__text auth__text--center">
				<h1>Find Your Dream Home</h1>
				<p>Step into a world of curated living spaces. Your journey to a
					more inspired sanctuary begins with a single click.</p>
			</div>
		</section>

		<section class="auth__panel">

			<div class="auth__card auth__card--login">

				<div class="auth__header auth__header--center">
					<h2>Welcome Back</h2>
					<p>Login to continue to RentNest</p>
				</div>

				<c:if test="${not empty errorMessage}">
					<p style="color: red; margin-bottom: 15px; text-align: center;">
						${errorMessage}</p>
				</c:if>

				<c:if test="${param.success == 'registered'}">
					<p style="color: green; margin-bottom: 15px; text-align: center;">
						Registration successful. Please login.</p>
				</c:if>

				<form class="form" action="${pageContext.request.contextPath}/login"
					method="post">

					<div class="form__group">
						<label>Email</label> <input type="email" name="email"
							placeholder="Enter your email">
					</div>

					<div class="form__group">
						<label>Password</label> <input type="password" name="password"
							placeholder="Enter your password">
					</div>

					<div class="form__row form__row--between">
						<label class="checkbox"> <input type="checkbox"
							name="remember"> Remember me
						</label> <a href="#" class="text-link">Forgot password?</a>
					</div>

					<button type="submit" class="btn btn--primary btn--full">
						Login <span class="arrow-right">→</span>
					</button>

				</form>

				<div class="auth__footer">
					Don't have an account? <a
						href="${pageContext.request.contextPath}/register"
						class="text-link"> Register </a>
				</div>

			</div>

		</section>

	</main>

</body>
</html>