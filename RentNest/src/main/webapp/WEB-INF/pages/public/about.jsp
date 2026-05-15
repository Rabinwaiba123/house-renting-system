<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>About - RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
</head>
<style>
/* about.css */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f5f5f7;
	color: #222;
	line-height: 1.6;
}

main {
	width: 100%;
}

/* HERO */
.about-hero {
	padding: 80px 7%;
	text-align: center;
}

.about-hero h1 {
	font-size: 52px;
	font-weight: 700;
	margin-bottom: 15px;
	color: #111;
}

.about-hero p {
	max-width: 700px;
	margin: 0 auto 45px;
	font-size: 17px;
	color: #666;
}

.hero-img {
	width: 100%;
	height: 500px;
	object-fit: cover;
	border-radius: 20px;
	display: block;
}

/* PURPOSE SECTION */
.purpose-section {
	padding: 80px 7%;
	display: flex;
	align-items: center;
	gap: 60px;
	background: #fff;
}

.purpose-img {
	flex: 1;
}

.purpose-img img {
	width: 100%;
	height: 420px;
	object-fit: cover;
	border-radius: 16px;
}

.purpose-content {
	flex: 1;
}

.purpose-content h2 {
	font-size: 42px;
	margin-bottom: 25px;
	color: #111;
}

.purpose-content p {
	font-size: 16px;
	color: #666;
	margin-bottom: 18px;
}

/* MISSION VISION */
.mission-vision {
	padding: 80px 7%;
	display: flex;
	gap: 30px;
	background: #f5f5f7;
}

.info-card {
	flex: 1;
	background: #fff;
	padding: 40px;
	border-radius: 16px;
}

.icon {
	font-size: 28px;
	margin-bottom: 20px;
}

.info-card h3 {
	font-size: 28px;
	margin-bottom: 15px;
}

.info-card p {
	color: #666;
	font-size: 15px;
}

/* WHY CHOOSE US */
.choose-section {
	padding: 90px 7%;
	background: #fff;
	text-align: center;
}

.choose-section h2 {
	font-size: 44px;
	margin-bottom: 10px;
}

.choose-section p {
	color: #666;
	margin-bottom: 50px;
}

.choose-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 25px;
}

.choose-card {
	background: #f7f7f7;
	padding: 35px 25px;
	border-radius: 16px;
	text-align: left;
}

.choose-icon {
	font-size: 28px;
	margin-bottom: 20px;
	color: #5d4eff;
}

.choose-card h3 {
	font-size: 22px;
	margin-bottom: 12px;
}

.choose-card p {
	font-size: 15px;
	color: #666;
	margin: 0;
}

/* TEAM SECTION */
.team-section {
	padding: 90px 7%;
	text-align: center;
	background: #f5f5f7;
}

.team-section h2 {
	font-size: 44px;
	margin-bottom: 10px;
}

.team-section p {
	color: #666;
	margin-bottom: 50px;
}

.team-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 25px;
}

.team-card {
	background: #fff;
	border-radius: 16px;
	padding-bottom: 25px;
	overflow: hidden;
}

.team-card img {
	width: 100%;
	height: 320px;
	object-fit: cover;
	display: block;
}

.team-card h3 {
	font-size: 22px;
	margin-top: 18px;
	margin-bottom: 6px;
}

.team-card span {
	color: #6b5cff;
	font-size: 14px;
}

/* CTA */
.cta-section {
	margin: 80px 7%;
	background: linear-gradient(to right, #5d4eff, #7a67ff);
	border-radius: 24px;
	padding: 80px 30px;
	text-align: center;
	color: white;
}

.cta-section h2 {
	font-size: 48px;
	margin-bottom: 15px;
}

.cta-section p {
	font-size: 17px;
	margin-bottom: 35px;
	color: rgba(255, 255, 255, 0.9);
}

.cta-section a {
	display: inline-block;
	background: white;
	color: #5d4eff;
	padding: 14px 32px;
	border-radius: 40px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.3s;
}

.cta-section a:hover {
	transform: translateY(-2px);
}

/* RESPONSIVE */
@media ( max-width : 992px) {
	.purpose-section {
		flex-direction: column;
	}
	.choose-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.team-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.about-hero h1 {
		font-size: 38px;
	}
	.purpose-content h2, .choose-section h2, .team-section h2, .cta-section h2
		{
		font-size: 34px;
	}
	.hero-img {
		height: 350px;
	}
	.choose-grid, .team-grid, .mission-vision {
		grid-template-columns: 1fr;
		flex-direction: column;
	}
	.team-card img {
		height: 280px;
	}
}

@media ( max-width : 576px) {
	.about-hero {
		padding: 60px 5%;
	}
	.purpose-section, .mission-vision, .choose-section, .team-section {
		padding: 60px 5%;
	}
	.cta-section {
		margin: 60px 5%;
		padding: 60px 20px;
	}
	.about-hero h1 {
		font-size: 32px;
	}
	.cta-section h2 {
		font-size: 30px;
	}
}
</style>
<body>

	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<main>

		<section class="about-hero">
			<h1>About Our Platform</h1>
			<p>Helping you find the perfect home easily and securely. We
				believe everyone deserves a space that feels like home.</p>

			<img
				src="${pageContext.request.contextPath}/images/photos/about-house.jpg"
				alt="Modern house" class="hero-img">
		</section>

		<section class="purpose-section">
			<div class="purpose-img">
				<img
					src="${pageContext.request.contextPath}/images/photos/purpose.png"
					alt="Purpose and vision">
			</div>

			<div class="purpose-content">
				<h2>Our Purpose & Vision</h2>
				<p>Founded in 2024, RentNest emerged from a simple observation:
					the journey to find a home should be as joyful as moving into one.
					We help simplify traditional real estate through a digital-first
					experience.</p>
				<p>Our vision is to become a trusted platform for residential
					spaces, bridging the gap between property owners and seekers
					through transparency, technology, and human-centric design.</p>
			</div>
		</section>

		<section class="mission-vision">
			<div class="info-card">
				<div class="icon">🚀</div>
				<h3>Our Mission</h3>
				<p>To empower individuals by providing a seamless, secure, and
					transparent platform for discovering and securing high-quality
					residential properties worldwide.</p>
			</div>

			<div class="info-card">
				<div class="icon">👁</div>
				<h3>Our Vision</h3>
				<p>To redefine the standard of modern living by curating spaces
					that inspire, providing every user with the keys to their dream
					lifestyle through innovation.</p>
			</div>
		</section>

		<section class="choose-section">
			<h2>Why Choose Us</h2>
			<p>The standard of excellence in property management.</p>

			<div class="choose-grid">
				<div class="choose-card">
					<div class="choose-icon">☑</div>
					<h3>Easy Booking</h3>
					<p>Schedule viewings and sign leases with a single click from
						any device.</p>
				</div>

				<div class="choose-card">
					<div class="choose-icon">✦</div>
					<h3>Verified Listings</h3>
					<p>Every property is carefully inspected and verified for your
						peace of mind.</p>
				</div>

				<div class="choose-card">
					<div class="choose-icon">🛡</div>
					<h3>Secure Payments</h3>
					<p>Bank-grade encryption keeps all your rent and deposit
						transactions safe.</p>
				</div>

				<div class="choose-card">
					<div class="choose-icon">☎</div>
					<h3>24/7 Support</h3>
					<p>Our dedicated concierge team is always here to help you
						settle in.</p>
				</div>
			</div>
		</section>

		<section class="team-section">
			<h2>Meet the Curators</h2>
			<p>The passionate minds behind your next home.</p>

			<div class="team-grid">
				<div class="team-card">
					<img
						src="${pageContext.request.contextPath}/images/team/member1.jpg"
						alt="Team member">
					<h3>Marcus Thorne</h3>
					<span>CEO & Founder</span>
				</div>

				<div class="team-card">
					<img
						src="${pageContext.request.contextPath}/images/team/member2.jpg"
						alt="Team member">
					<h3>Elena Rodriguez</h3>
					<span>Chief Design Officer</span>
				</div>

				<div class="team-card">
					<img
						src="${pageContext.request.contextPath}/images/team/member3.jpg"
						alt="Team member">
					<h3>David Chen</h3>
					<span>Head of Operations</span>
				</div>

				<div class="team-card">
					<img
						src="${pageContext.request.contextPath}/images/team/member4.jpg"
						alt="Team member">
					<h3>Sarah Jenkins</h3>
					<span>Lead Curator</span>
				</div>
				<div class="team-card">
					<img
						src="${pageContext.request.contextPath}/images/team/member4.jpg"
						alt="Team member">
					<h3>Sarah Jenkins</h3>
					<span>Lead Curator</span>
				</div>
			</div>
		</section>

		<section class="cta-section">
			<h2>Start your journey today</h2>
			<p>Join thousands of happy tenants who found their dream home
				with RentNest.</p>
			<a href="${pageContext.request.contextPath}/properties">Browse
				Properties</a>
		</section>

	</main>

	<!-- ================= FOOTER ================= -->
	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>