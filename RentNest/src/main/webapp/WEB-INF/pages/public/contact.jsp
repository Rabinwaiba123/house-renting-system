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
	href="${pageContext.request.contextPath}/css/contact.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>
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
			<!--
				This section allows users to send
				messages or inquiries to the system
			-->
			<div class="contact-form">

				<h2>Send us a message</h2>

				<form action="${pageContext.request.contextPath}/contact"
					method="post">

					<div class="form-group">

						<label>Name</label> <input type="text" name="fullName"
							placeholder="Full Name">

					</div>

					<div class="form-group">

						<label>Email</label> <input type="email" name="email"
							placeholder="Email Address">

					</div>

					<div class="form-group">

						<label>Subject</label> <input type="text" name="subject"
							placeholder="What is this regarding?">

					</div>

					<div class="form-group">

						<label>Message</label>

						<textarea name="message" placeholder="Write your message here..."></textarea>

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