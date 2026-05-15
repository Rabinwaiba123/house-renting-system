<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Contact Page</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>

/* ================= HERO ================= */
.contact-hero {
	height: 320px;
	background: linear-gradient(rgba(0, 72, 170, 0.88),
		rgba(0, 52, 130, 0.92)),
		url("${pageContext.request.contextPath}/images/photos/contact-bg.png");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: white;
	padding: 70px 20px 110px;
	position: relative;
}

.contact-hero-content {
	max-width: 620px;
}

.contact-hero-content h1 {
	font-size: 52px;
	font-weight: 400;
	margin-bottom: 14px;
	line-height: 1.1;
}

.contact-hero-content p {
	font-size: 17px;
	line-height: 1.5;
	max-width: 520px;
	margin: auto;
}

/* ================= CONTACT SECTION ================= */
.contact-section {
	max-width: 1080px;
	margin: -70px auto 60px;
	padding: 0 20px;
	position: relative;
	z-index: 10;
}

.contact-card {
	background: white;
	border-radius: 12px;
	display: grid;
	grid-template-columns: 1fr 1fr;
	box-shadow: 0 14px 35px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.contact-info, .contact-form {
	padding: 46px;
}

.contact-info {
	border-right: 1px solid #e5e7eb;
}

.contact-info h2, .contact-form h2 {
	font-size: 28px;
	margin-bottom: 14px;
	color: #161b22;
}

.contact-info>p {
	font-size: 15px;
	line-height: 1.5;
	color: #4b5563;
	margin-bottom: 30px;
}

/* ================= INFO ITEMS ================= */
.info-item {
	display: flex;
	align-items: flex-start;
	gap: 14px;
	margin-bottom: 24px;
}

.info-icon {
	width: 44px;
	height: 44px;
	background: #075ad9;
	color: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	flex-shrink: 0;
}

.info-text h3 {
	font-size: 18px;
	margin-bottom: 4px;
	color: #161b22;
}

.info-text p {
	font-size: 14px;
	line-height: 1.5;
	color: #4b5563;
}

.social-title {
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 1px;
	color: #4b5563;
	margin-top: 28px;
	margin-bottom: 14px;
}

.social-icons {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-top: 10px;
}

.social-icons a {
	width: 40px;
	height: 40px;
	background-color: #075ad9;
	color: white;
	border-radius: 50%;
	text-decoration: none;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-left: 8px;
	position: relative;
	overflow: hidden;
	position: relative
}

.social-icons a::before, .social-icons a::after {
	content: none;
	display: none;
}

.social-icons a i {
	color: white;
	font-size: 18px;
	position: static;
	background: none;
}

/* ================= FORM ================= */
.form-group {
	margin-bottom: 14px;
}

.form-group label {
	display: block;
	font-size: 12px;
	font-weight: 700;
	color: #4b5563;
	margin-bottom: 6px;
	letter-spacing: 0.3px;
}

.form-group input, .form-group textarea {
	width: 100%;
	border: 1px solid #cbd5e1;
	background: #f8fafc;
	border-radius: 7px;
	padding: 14px;
	font-size: 14px;
	outline: none;
	color: #1f2937;
}

.form-group input {
	height: 50px;
}

.form-group textarea {
	height: 110px;
	resize: none;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: #075ad9;
	background: white;
}

.send-btn {
	width: 100%;
	height: 50px;
	border: none;
	border-radius: 7px;
	background: #075ad9;
	color: white;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	margin-top: 4px;
}

.send-btn:hover {
	background: #004fc1;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 900px) {
	.contact-hero {
		height: 280px;
		padding: 60px 20px 100px;
	}
	.contact-hero-content h1 {
		font-size: 42px;
	}
	.contact-hero-content p {
		font-size: 15px;
	}
	.contact-card {
		grid-template-columns: 1fr;
	}
	.contact-info {
		border-right: none;
		border-bottom: 1px solid #e5e7eb;
	}
}

@media ( max-width : 600px) {
	.contact-hero {
		height: 240px;
		padding: 50px 16px 90px;
	}
	.contact-hero-content h1 {
		font-size: 34px;
	}
	.contact-hero-content p {
		font-size: 14px;
	}
	.contact-section {
		margin-top: -50px;
	}
	.contact-info, .contact-form {
		padding: 30px 22px;
	}
	.contact-info h2, .contact-form h2 {
		font-size: 24px;
	}
}
</style>
</head>

<body>

	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<!-- ================= HERO ================= -->
	<section class="contact-hero">
		<div class="contact-hero-content">
			<h1>Contact us</h1>

			<p>RentNest is ready to provide the right housing solution
				according to your needs</p>
		</div>
	</section>

	<!-- ================= CONTACT SECTION ================= -->
	<section class="contact-section">

		<div class="contact-card">

			<!-- ================= LEFT INFO ================= -->
			<div class="contact-info">

				<h2>Get in touch</h2>

				<p>Our team is here to assist you. Whether you're looking for a
					new home or need management services, feel free to reach out.</p>

				<div class="info-item">

					<div class="info-icon">
						<i class="fa fa-map-marker"></i>
					</div>

					<div class="info-text">
						<h3>Head Office</h3>

						<p>
							123 Property Lane, Suite 400 <br> San Francisco, CA 94103
						</p>
					</div>

				</div>

				<div class="info-item">

					<div class="info-icon">
						<i class="fa fa-envelope-o"></i>
					</div>

					<div class="info-text">
						<h3>Email Us</h3>

						<p>
							support@rentnest.com <br> hello@rentnest.com
						</p>
					</div>

				</div>

				<div class="info-item">

					<div class="info-icon">
						<i class="fa fa-phone"></i>
					</div>

					<div class="info-text">
						<h3>Call Us</h3>

						<p>
							Phone: +1 (555) 123-4567 <br> Fax: +1 (555) 123-4568
						</p>
					</div>

				</div>

				<p class="social-title">FOLLOW OUR SOCIAL MEDIA</p>

				<div class="social-icons">

					<a href=""> <i class="fa fa-facebook"></i>
					</a> <a href=""> <i class="fa fa-instagram"></i>
					</a> <a href=""> <i class="fa fa-twitter"></i>
					</a> <a href=""> <i class="fa fa-youtube-play"></i>
					</a>

				</div>

			</div>

			<!-- ================= RIGHT FORM ================= -->
			<div class="contact-form">

				<h2>Send us a message</h2>

				<form action="${pageContext.request.contextPath}/contact"
					method="post">

					<div class="form-group">

						<label>Name</label> <input type="text" name="fullName"
							placeholder="Full Name" required>

					</div>

					<div class="form-group">

						<label>Email</label> <input type="email" name="email"
							placeholder="Email Address" required>

					</div>

					<div class="form-group">

						<label>Subject</label> <input type="text" name="subject"
							placeholder="What is this regarding?" required>

					</div>

					<div class="form-group">

						<label>Message</label>

						<textarea name="message" placeholder="Write your message here..."
							required></textarea>

					</div>

					<button type="submit" class="send-btn">Send</button>

				</form>

				<c:if test="${not empty errorMessage}">
					<p class="auth-error">${errorMessage}</p>
				</c:if>

				<c:if test="${not empty successMessage}">
					<p class="auth-success">${successMessage}</p>
				</c:if>

			</div>

		</div>

	</section>

	<!-- ================= FOOTER ================= -->
	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>