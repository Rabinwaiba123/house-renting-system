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
</head>
<body>

	<main class="auth-page auth-page--register">
		<!-- Left Side -->
		<section class="auth-banner auth-banner--register">
			<div class="auth-banner__overlay"></div>

			<div class="auth-banner__content auth-banner__content--bottom">
				<h1>Find your next Sanctuary today.</h1>
				<p>Experience a curated selection of homes designed for your
					lifestyle. Your journey to a better living starts here.</p>
			</div>
		</section>

		<!-- Right Side -->
		<section class="auth-form-section">
			<div class="auth-card auth-card--register">
				<div class="auth-header auth-header--left">
					<h2>Create Account</h2>
					<p>Register to start using the house renting platform</p>
				</div>

				<form action="#" method="post" class="auth-form">
					<div class="form-group">
						<label for="fullname">Full Name</label>
						<div class="input-box input-box--icon">
							<i class="fa-regular fa-user"></i> <input type="text"
								id="fullname" name="fullname" placeholder="John Doe" required>
						</div>
					</div>

					<div class="form-group">
						<label for="email">Email Address</label>
						<div class="input-box input-box--icon">
							<i class="fa-regular fa-envelope"></i> <input type="email"
								id="email" name="email" placeholder="john@example.com" required>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group">
							<label for="phone">Phone Number</label>
							<div class="input-box input-box--icon">
								<i class="fa-solid fa-phone"></i> <input type="text" id="phone"
									name="phone" placeholder="" required>
							</div>
						</div>

						<div class="form-group">
							<label for="role">Role</label>
							<div class="input-box input-box--icon input-box--select">
								<i class="fa-regular fa-user"></i> <select id="role" name="role"
									required>
									<option value="user">User</option>
									<option value="owner">Owner</option>
								</select> <i class="fa-solid fa-angle-down select-arrow"></i>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password">Password</label>
						<div class="input-box input-box--icon password-box">
							<i class="fa-solid fa-lock"></i> <input type="password"
								id="password" name="password" placeholder="••••••••" required>
							<button type="button" class="password-toggle" id="togglePassword"
								aria-label="Show password">
								<i class="fa-regular fa-eye"></i>
							</button>
						</div>
					</div>

					<div class="form-group">
						<label for="confirmPassword">Confirm Password</label>
						<div class="input-box input-box--icon password-box">
							<i class="fa-solid fa-rotate-left"></i> <input type="password"
								id="confirmPassword" name="confirmPassword"
								placeholder="••••••••" required>
							<button type="button" class="password-toggle"
								id="toggleConfirmPassword" aria-label="Show confirm password">
								<i class="fa-regular fa-eye"></i>
							</button>
						</div>
					</div>

					<p class="form-note">
						<i class="fa-solid fa-circle-info"></i> Owner accounts may require
						admin approval before being active.
					</p>

					<label class="remember-me terms-check"> <input
						type="checkbox" name="terms" required> <span>I
							agree to <a href="#" class="auth-link">Terms and Conditions</a>
					</span>
					</label>

					<button type="submit" class="btn btn-primary btn-block">
						Register <i class="fa-solid fa-arrow-right"></i>
					</button>

					<p class="auth-footer-text auth-footer-text--small">
						Already have an account? <a href="login.html" class="auth-link">Login</a>
					</p>
				</form>
			</div>
		</section>
	</main>

	<script>
		function setupPasswordToggle(buttonId, inputId) {
			const toggleButton = document.getElementById(buttonId);
			const input = document.getElementById(inputId);
			const icon = toggleButton.querySelector("i");

			toggleButton.addEventListener("click", function() {
				const isPassword = input.getAttribute("type") === "password";
				input.setAttribute("type", isPassword ? "text" : "password");

				icon.classList.toggle("fa-eye");
				icon.classList.toggle("fa-eye-slash");
			});
		}

		setupPasswordToggle("togglePassword", "password");
		setupPasswordToggle("toggleConfirmPassword", "confirmPassword");
	</script>
</body>
</html>