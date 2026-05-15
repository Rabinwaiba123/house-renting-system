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
	href="${pageContext.request.contextPath}/css/auth/auth.css">
</head>

<body>

	<header class="logo">
		<a href="${pageContext.request.contextPath}/">RentNest</a>
	</header>

	<table class="main-table">
		<tr>
			<td class="image-section"><img
				src="${pageContext.request.contextPath}/images/photos/register.jpg"
				alt="Register Image" class="side-image">
				<section class="image-text">
					<h1>Join RentNest</h1>
					<p>Create your account and begin your journey to finding
						comfortable and trusted rental homes.</p>
				</section></td>
			<td class="form-section">
				<section class="form-card">
					<header class="form-header">
						<h2>Create Account</h2>
						<p>Register your RentNest account</p>
					</header>
					<c:if test="${not empty errorMessage}">
						<p class="auth-error">${errorMessage}</p>
					</c:if>
					<form action="${pageContext.request.contextPath}/register"
						method="post" enctype="multipart/form-data">
						<table class="form-table">
							<tr>
								<td><label>Full Name</label> <input type="text"
									name="fullName" placeholder="Enter full name"></td>
								<td><label>Email</label> <input type="email" name="email"
									placeholder="Enter email"></td>
							</tr>
							<tr>
								<td><label>Phone</label> <input type="text" name="phone"
									placeholder="Enter phone number"></td>
							</tr>
							<tr>
								<td colspan="2"><label>Address</label> <input type="text"
									name="address" placeholder="Enter address"></td>
							</tr>
							<tr>
								<td><label>Password</label> <input type="password"
									name="password" placeholder="Enter password"></td>
								<td><label>Confirm Password</label> <input type="password"
									name="confirmPassword" placeholder="Confirm password">
								</td>
							</tr>
							<tr>
								<td colspan="2"><label>Profile Image</label> <input
									type="file" name="image" accept="image/*"></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit">Register →</button>
								</td>
							</tr>
						</table>
					</form>

					<footer class="form-footer">
						Already have an account? <a
							href="${pageContext.request.contextPath}/login"> Login </a>
					</footer>
				</section>
			</td>
		</tr>
	</table>

</body>
</html>