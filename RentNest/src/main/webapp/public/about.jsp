<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>RentNest - About</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style>
/* Hero */
.hero {
	text-align: center;
	padding: 70px 20px;
}

.hero h1 {
	font-size: 42px;
}

.subtitle {
	max-width: 600px;
	margin: auto;
	color: #666;
	margin-top: 10px;
}

.hero img {
	width: 75%;
	margin-top: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.hero img:hover {
	transform: scale(1.02);
}

/* Purpose */
.purpose {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 80px;
	gap: 50px;
}

.purpose img {
	width: 400px;
	border-radius: 15px;
}

.purpose img:hover {
	transform: scale(1.03);
}

.purpose .text {
	max-width: 500px;
}

.purpose p {
	color: #555;
	line-height: 1.6;
	margin-top: 10px;
}

/* Cards */
.cards {
	display: flex;
	justify-content: center;
	gap: 40px;
	padding: 60px;
}

.card {
	background: white;
	padding: 30px;
	width: 260px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

/* Why */
.why {
	text-align: center;
	padding: 70px;
}

.features {
	display: flex;
	justify-content: center;
	gap: 30px;
	margin-top: 30px;
}

.feature {
	background: white;
	padding: 25px;
	border-radius: 15px;
	width: 180px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
}

.feature:hover {
	transform: translateY(-8px);
	background: #f9f9ff;
}

/* Team */
.team {
	text-align: center;
	padding: 70px;
}

.members {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
}

.member {
	text-align: center;
}

.member img {
	width: 180px;
	height: 180px;
	object-fit: cover;
	border-radius: 15px;
}

.member img:hover {
	transform: scale(1.1);
}

.member:hover {
	transform: translateY(-5px);
}

.member p {
	margin-top: 10px;
}

/* CTA */
.cta {
	text-align: center;
	background: linear-gradient(to right, #5f5cff, #7c3aed);
	color: white;
	padding: 70px;
	border-radius: 20px;
	margin: 50px;
}

.cta:hover {
	box-shadow: 0 10px 40px rgba(92, 70, 255, 0.3);
}

.cta button {
	padding: 12px 25px;
	border: none;
	border-radius: 25px;
	background: white;
	font-weight: bold;
	margin-top: 15px;
}

.cta button:hover {
	background: #e0e0ff;
	transform: scale(1.08);
}
</style>
</head>
<body>

	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar.jsp" />

	<!-- Hero -->
	<section class="hero">
		<h1>About Our Platform</h1>
		<p class="subtitle">Helping you find the perfect home easily and
			securely. We believe everyone deserves a space that feels like home.
		</p>
		<img src="../Image/ghar.png" alt="House" />
	</section>

	<!-- Purpose -->
	<section class="purpose">
		<div class="img">
			<img src="../Image/padhailikhai.png" />
		</div>

		<div class="text">
			<h2>Our Purpose Vision</h2>

			<p>Founded in 2024, RentNest was created with a simple idea —
				finding a home should be an exciting and meaningful experience, not
				a stressful one.</p>

			<p>We aim to simplify the process by offering verified listings,
				transparent communication, and a user-friendly platform that puts
				people first.</p>

			<p>Our vision is to become a trusted space where individuals can
				confidently discover, choose, and move into homes that truly match
				their lifestyle.</p>
		</div>
	</section>

	<!-- Cards -->
	<section class="cards">
		<div class="card">
			<h3>Our Mission</h3>
			<p>To empower users with a seamless and secure property search
				experience.</p>
		</div>

		<div class="card">
			<h3>Our Vision</h3>
			<p>To redefine modern living through innovation and trust.</p>
		</div>
	</section>

	<!-- Why -->
	<section class="why">
		<h2>Why Choose Us</h2>

		<div class="features">
			<div class="feature">Easy Booking</div>
			<div class="feature">Verified Listings</div>
			<div class="feature">Secure Payments</div>
			<div class="feature">24/7 Support</div>
		</div>
	</section>

	<!-- Team -->
	<section class="team">
		<h2>Meet the Curators</h2>

		<div class="members">
			<div class="member">
				<img src="../Image/waiba .jpeg" />
				<p>Rabin Waiba</p>
			</div>

			<div class="member">
				<img src="../Image/sneha.jpeg" />
				<p>Sneha Singh</p>
			</div>

			<div class="member">
				<img src="../Image/team3.jpg" />
				<p>Riti Roshan</p>
			</div>

			<div class="member">
				<img src="../Image/snehaha.jpeg" />
				<p>Sneha Singh</p>
			</div>

			<div class="member">
				<img src="../Image/team4.jpg" />
				<p>Bibek Soni</p>
			</div>
		</div>
	</section>

	<!-- CTA -->
	<section class="cta">
		<h2>Start your journey today</h2>
		<p>Join thousands of happy tenants finding their dream home.</p>
		<button>Browse Properties</button>
	</section>

	<!-- ================= FOOTER ================= -->
	<jsp:include page="/include/footer.jsp" />
</body>
</html>
