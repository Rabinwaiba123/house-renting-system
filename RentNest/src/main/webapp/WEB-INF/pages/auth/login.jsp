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
	href="${pageContext.request.contextPath}/css/auth/auth.css">
</head>

<body>

	<header class="logo">
		<a href="${pageContext.request.contextPath}/">RentNest</a>
	</header>

	<table class="main-table">

		<tr>
			<td class="image-section"><img
				src="${pageContext.request.contextPath}/images/photos/login.jpg"
				alt="Login Image" class="side-image">
				<section class="image-text">
					<h1>Welcome Back</h1>
					<p>Login to continue exploring trusted rental homes with
						RentNest.</p>
				</section></td>
			<td class="form-section">
				<section class="form-card login-card">
					<header class="form-header">
						<h2>Login</h2>
						<p>Access your RentNest account</p>
					</header>
					<c:if test="${not empty errorMessage}">
						<p class="auth-error">${errorMessage}</p>
					</c:if>

					<c:if test="${not empty successMessage}">
						<p class="auth-success">${successMessage}</p>
					</c:if>

					<form action="${pageContext.request.contextPath}/login"
						method="post">

						<table class="form-table">
							<tr>
								<td colspan="2"><label>Email</label> <input type="email"
									name="email" placeholder="Enter email"></td>
							</tr>
							<tr>
								<td colspan="2"><label>Password</label> <input
									type="password" name="password" placeholder="Enter password">
								</td>
							</tr>
							<tr>
								<td colspan="2"><label> <input type="checkbox"
										name="remember"
										<c:if test="${not empty cookie.rememberEmail.value}">checked</c:if>>
										Remember me
								</label></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit">Login →</button>
								</td>

							</tr>
						</table>
					</form>
					<footer class="form-footer">
						Don't have an account? <a
							href="${pageContext.request.contextPath}/register"> Register
						</a>
					</footer>
				</section>
			</td>
		</tr>
	</table>

</body>
</html>