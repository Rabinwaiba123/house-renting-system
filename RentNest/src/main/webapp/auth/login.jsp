<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login - RentNest</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

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
					more inspired sanctuary begins with a single click. Discover homes
					that echo your identity.</p>
			</div>
		</section>

		<section class="auth__panel">
			<div class="auth__card auth__card--login">
				<div class="auth__header auth__header--center">
					<h2>Welcome Back</h2>
					<p>Login to continue to your account</p>
				</div>

				<form class="form" action="#" method="post">
					<div class="form__group">
						<label for="loginEmail">Email Address</label>
						<div class="input-wrap">
							<input type="email" id="loginEmail"
								placeholder="e.g. alex@example.com" required />
						</div>
					</div>

					<div class="form__group">
						<label for="loginPassword">Password</label>
						<div class="password-field">
							<input type="password" id="loginPassword" placeholder="••••••••"
								required />
							<button type="button" class="toggle-password"
								data-target="loginPassword" aria-label="Show password">
								<i class="fa-regular fa-eye"></i>
							</button>
						</div>
					</div>

					<div class="form__row form__row--between">
						<label class="checkbox"> <input type="checkbox" /> <span>Remember
								Me</span>
						</label> <a href="#" class="text-link">Forgot Password?</a>
					</div>

					<button type="submit" class="btn btn--primary btn--full">
						Login</button>

					<div class="divider">
						<span>Or continue with</span>
					</div>

					<div class="socials">
						<a href="#" class="social-btn"> <i class="fa-brands fa-google"></i>
							<span>Google</span>
						</a> <a href="#" class="social-btn"> <i
							class="fa-brands fa-facebook-f"></i> <span>Facebook</span>
						</a>
					</div>

					<p class="auth__footer">
						Don't have an account? <a href="register.html" class="text-link">Register</a>
					</p>
				</form>
			</div>
		</section>
	</main>

	<script>
      const toggleButtons = document.querySelectorAll(".toggle-password");

      toggleButtons.forEach(function (button) {
        button.addEventListener("click", function () {
          const input = document.getElementById(
            button.getAttribute("data-target"),
          );
          const icon = button.querySelector("i");
          const isPassword = input.type === "password";

          input.type = isPassword ? "text" : "password";

          if (isPassword) {
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
          } else {
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
          }
        });
      });
    </script>
</body>
</html>

