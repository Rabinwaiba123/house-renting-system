<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - RentNest</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	min-height: 100vh;
	background: #f4f7fb;
	display: flex;
	align-items: center;
	justify-content: center;
}

.register-container {
	width: 100%;
	max-width: 430px;
	background: white;
	padding: 30px;
	border-radius: 14px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.register-container h2 {
	text-align: center;
	margin-bottom: 22px;
	color: #1f2937;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
	color: #374151;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 11px 12px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	font-size: 14px;
	outline: none;
}

.form-group input:focus, .form-group select:focus {
	border-color: #2563eb;
}

.register-btn {
	width: 100%;
	padding: 12px;
	background: #2563eb;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	cursor: pointer;
	margin-top: 8px;
}

.register-btn:hover {
	background: #1d4ed8;
}

.message {
	margin-top: 12px;
	text-align: center;
	color: red;
	font-size: 14px;
}

.login-link {
	text-align: center;
	margin-top: 16px;
	font-size: 14px;
}

.login-link a {
	color: #2563eb;
	text-decoration: none;
}

@media ( max-width : 500px) {
	.register-container {
		margin: 15px;
		padding: 22px;
	}
}
</style>
</head>
<body>


	<div class="register-container">
		<h2>Create Account</h2>

		<form action="${pageContext.request.contextPath}/register"
			method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label>Full Name</label> <input type="text" name="fullName" required>
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="form-group">
				<label>Phone</label> <input type="text" name="phone" required>
			</div>

			<div class="form-group">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<div class="form-group">
				<label>Register As</label> <select name="role" required>
					<option value="">Select role</option>
					<option value="user">User</option>
					<option value="owner">Owner</option>
				</select>
			</div>

			<div class="form-group">
				<label>Profile Image</label> <input type="file" name="image"
					accept="image/*" required>
			</div>

			<button type="submit" class="register-btn">Register</button>

			<p class="message">${message}</p>

			<div class="login-link">
				Already have an account? <a href="login.jsp">Login</a>
			</div>
		</form>
	</div>
</body>
</html>