<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/about.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<!-- NAVBAR -->
	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main class="about-page">

		<section class="about-hero">
			<div class="container">

				<div class="about-content">
					<h1>About RentNest</h1>

					<p>RentNest is a simple house renting platform that helps users
						find rooms, flats, houses, and apartments easily. Our system
						provides a secure and user-friendly experience for tenants and
						property owners.</p>

					<a href="${pageContext.request.contextPath}/property-list"
						class="about-btn"> Explore Properties </a>
				</div>

				<div class="about-image">
					<img
						src="${pageContext.request.contextPath}/images/photos/about-house.jpg"
						alt="About RentNest">
				</div>

			</div>
		</section>

		<section class="mission-section">

			<div class="container">

				<div class="mission-card">
					<i class="fa fa-home"></i>
					<h3>Our Mission</h3>

					<p>We aim to make renting properties easier, faster, and more
						accessible for everyone.</p>
				</div>

				<div class="mission-card">
					<i class="fa fa-users"></i>
					<h3>Our Community</h3>

					<p>RentNest connects tenants and property owners through a
						trusted online platform.</p>
				</div>

				<div class="mission-card">
					<i class="fa fa-shield"></i>
					<h3>Our Security</h3>

					<p>We focus on safe property listings and reliable booking
						services.</p>
				</div>

			</div>

		</section>

	</main>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>