<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>RentNest Home</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style>
:root {
	--primary: #eb7a30;
	--primary-dark: #d6671f;
	--bg-soft: #eef5ea;
	--text: #111111;
	--muted: #7a7a7a;
	--border: #dddddd;
	--white: #ffffff;
	--shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: "Poppins", sans-serif;
	color: var(--text);
	background: #f7f7f7;
	line-height: 1.6;
}

img {
	max-width: 100%;
	display: block;
}

a {
	text-decoration: none;
	color: inherit;
}

button, select {
	font: inherit;
}

.container {
	width: min(1300px, calc(100% - 40px));
	margin: 0 auto;
}

.small-container {
	width: min(1100px, calc(100% - 40px));
}

.section {
	padding: 78px 0;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border-radius: 999px;
	font-weight: 600;
	transition: 0.25s ease;
}

.btn-light {
	min-width: 96px;
	padding: 10px 18px;
	border: 1px solid #b8b8b8;
	color: #666;
	background: transparent;
}

.btn-primary {
	min-width: 96px;
	padding: 11px 22px;
	background: var(--primary);
	color: var(--white);
}

.btn-primary:hover, .card-btn:hover, .search-btn:hover {
	background: var(--primary-dark);
}

.hero-section {
	background: linear-gradient(135deg, #eef5ea 0%, #fde6d8 100%);
	padding-top: 90px;
	padding-bottom: 100px;
	position: relative;
}

.hero-text h1 {
	font-size: clamp(1.3rem, 4vw, 3rem);
	line-height: 1.16;
	max-width: 620px;
	font-weight: 800;
	margin-bottom: 18px;
}

.hero-text p {
	max-width: 470px;
	color: #666;
	font-size: 15px;
	margin-bottom: 26px;
}

.hero-btn {
	padding-inline: 22px;
	margin-bottom: 20px;
}

.hero-image {
	position: absolute;
	left: 60%;
	top: 95px;
	transform: translateX(-50%);
	width: 100%;
	max-width: 1000px;
}

.hero-image img {
	max-width: 950px;
	width: 100%;
	margin-bottom: 10px;
}

.search-box {
	width: min(100%, 700px);
	display: grid;
	grid-template-columns: 1.25fr 0.7fr 1fr 132px;
	gap: 14px;
	background: #ec9967;
	padding: 20px;
	padding-right: 20px;
	border-radius: 8px;
	transform: translateY(-14px);
	position: absolute;
	top: 445px;
}

.field label {
	display: block;
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 8px;
}

#properties {
	padding-top: 150px;
}

.select-wrap {
	position: relative;
}

.select-wrap select {
	width: 100%;
	border: none;
	outline: none;
	background: #fff;
	border-radius: 3px;
	padding: 11px 38px 11px 12px;
	appearance: none;
	color: #666;
	font-size: 13px;
}

.select-wrap img {
	width: 12px;
	position: absolute;
	right: 12px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none;
}

.search-btn {
	align-self: end;
	height: 42px;
	border: none;
	border-radius: 4px;
	background: #111;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.section-head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	margin-bottom: 36px;
}

.section-head h2, .center-title, .help-text h2 {
	font-size: clamp(1rem, 3vw, 2.3rem);
	line-height: 1.18;
	font-weight: 800;
}

.accent-line {
	display: block;
	width: 86px;
	height: 3px;
	margin-top: 12px;
	background: #efb185;
}

.filter-tabs {
	display: flex;
	gap: 14px;
	flex-wrap: wrap;
}

.tab {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	border: 2px solid #222;
	border-radius: 999px;
	padding: 8px 18px;
	background: #fff;
	font-size: 15px;
	font-weight: 500;
}

.tab img {
	width: 16px;
	height: 16px;
	object-fit: contain;
}

.card-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 22px;
}

.property-card {
	background: #fff;
	border: 1px solid var(--border);
	border-radius: 18px;
	overflow: hidden;
	box-shadow: var(--shadow);
}

.property-img {
	width: calc(100% - 18px);
	height: 245px;
	object-fit: cover;
	margin: 9px auto 0;
	border-radius: 16px;
}

.card-body {
	padding: 16px 14px 16px;
}

.card-title-row {
	display: flex;
	justify-content: space-between;
	gap: 10px;
	align-items: center;
}

.card-title-row h3 {
	font-size: 1.55rem;
	font-weight: 700;
}

.rating {
	display: flex;
	align-items: center;
	gap: 6px;
	font-weight: 500;
}

.rating img {
	width: 18px;
}

.location {
	font-size: 14px;
	color: var(--muted);
	margin: 7px 0 10px;
}

.price {
	color: var(--primary);
	font-size: 1.7rem;
	font-weight: 700;
	margin-bottom: 14px;
}

.card-btn {
	display: block;
	width: 100%;
	background: #000;
	color: #fff;
	text-align: center;
	padding: 12px;
	border-radius: 999px;
	font-weight: 600;
}

.center-title {
	text-align: center;
	margin-bottom: 48px;
}

.feature-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 34px;
}

.feature-card {
	text-align: center;
	padding: 16px 14px;
}

.feature-icon {
	width: 110px;
	height: 110px;
	margin: 0 auto 22px;
	display: grid;
	place-items: center;
}

.feature-icon img {
	width: 90px;
	height: 90px;
	object-fit: contain;
}

.feature-card h3 {
	font-size: 1.5rem;
	margin-bottom: 14px;
}

.feature-card p {
	font-size: 14px;
	color: #666;
	max-width: 300px;
	margin: 0 auto;
}

.help {
	background: #edf5ea;
}

.help-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 50px;
	align-items: center;
}

.help-images {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
}

.help-images img {
	height: 380px;
	width: 100%;
	object-fit: cover;
}

.help-images img:first-child {
	object-position: center;
}

.help-text p {
	color: #666;
	margin: 18px 0 28px;
	max-width: 520px;
}

.footer {
	background: #f8f8f8;
	padding: 72px 0 26px;
}

.footer-grid {
	display: grid;
	grid-template-columns: 1.9fr 1fr 1fr 1fr 1fr;
	gap: 30px;
}

.footer-brand img {
	width: 100px;
	margin-bottom: 18px;
}

.footer-brand p, .footer-links a {
	color: #666;
	font-size: 14px;
}

.footer-brand p {
	max-width: 350px;
}

.socials {
	display: flex;
	gap: 14px;
	margin-top: 22px;
}

.socials img {
	width: 34px;
	height: 34px;
}

.footer-links {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.footer-links h4 {
	font-size: 1.3rem;
	margin-bottom: 8px;
}

.copyright {
	text-align: center;
	color: #555;
	font-size: 14px;
	margin-top: 54px;
}

@media ( max-width : 1080px) {
	.hero {
		grid-template-columns: 1fr;
	}
	.hero-image {
		position: static;
		transform: none;
		margin-top: 20px;
		text-align: center;
	}
	.hero-image img {
		max-width: 600px;
		width: 100%;
	}
	.search-box {
		position: static;
		transform: none;
		margin-top: 20px;
	}
	.card-grid, .feature-grid, .help-grid, .footer-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.footer-brand {
		grid-column: 1/-1;
	}
}

@media ( max-width : 820px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
	}
	.nav-links {
		gap: 22px;
		flex-wrap: wrap;
	}
	.hero-section {
		padding-bottom: 40px;
	}
	.hero-image {
		top: 53%;
		left: 45%;
	}
	.hero-image img {
		max-width: 100%;
	}
	.search-box {
		grid-template-columns: 1fr 1fr;
	}
	.search-btn {
		width: 100%;
	}
	.card-grid, .feature-grid, .help-grid, .footer-grid, .help-images {
		grid-template-columns: 1fr;
	}
	.section-head {
		flex-direction: column;
		align-items: flex-start;
	}
}

@media ( max-width : 560px) {
	.container {
		width: min(100% - 24px, 1180px);
	}
	.hero-wrap {
		padding-top: 18px;
	}
	.nav-actions {
		width: 100%;
	}
	.nav-actions .btn {
		flex: 1;
	}
	.search-box {
		grid-template-columns: 1fr;
		padding: 16px;
	}
	.property-img {
		height: 220px;
	}
	.help-images img {
		height: 260px;
	}
}
</style>
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/navbar.jsp" />

	<!-- Hero Section -->
	<main>
		<section class="hero-section">
			<div class="container">
				<div class="hero-text">
					<h1>A Smarter Way to Rent Homes and Rooms</h1>
					<p>Our platform connects tenants and property owners through a
						secure system with verified listings, easy booking, and seamless
						management.</p>
					<a href="#properties" class="btn btn-primary hero-btn">Book Now</a>
				</div>
				<div class="hero-image">
					<img src="images/Untitled design.png" alt="Modern rental house" />
				</div>
			</div>
		</section>

		<section class="recommendations section" id="properties">
			<div class="container">
				<div class="section-head">
					<div>
						<h2>Best Recommendation</h2>
						<span class="accent-line"></span>
					</div>

					<div class="filter-tabs">
						<a href="#" class="tab"><img
							src="images/bed_hotel_double_sleep_bedroom_room_icon_229653.png"
							alt="rooms" />Rooms</a> <a href="#" class="tab"><img
							src="images/buildings_icon-icons.com_56742.png" alt="flats" />Flats</a>
						<a href="#" class="tab"><img src="images/house_38533.png"
							alt="houses" />House</a>
					</div>
				</div>

				<div class="card-grid">
					<c:forEach var="p" items="${properties}">
						<article class="property-card page-card">

							<img src="${pageContext.request.contextPath}/${p.image}"
								class="property-img">
							<div class="card-body">
								<div class="card-title-row">
									<h3>${p.title}</h3>
								</div>

								<p class="location">${p.location}</p>
								<p class="price">Rs. ${p.price}</p>

								<a
									href="${pageContext.request.contextPath}/property?action=detail&id=${p.propertyId}"
									class="card-btn"> See More </a>
							</div>
						</article>
					</c:forEach>
				</div>
			</div>
		</section>

		<section class="why section">
			<div class="container small-container">
				<h2 class="center-title">Why To Choose Us</h2>

				<div class="feature-grid">
					<article class="feature-card">
						<div class="feature-icon">
							<img src="images/search_icon_125165.svg" alt="Easy to find" />
						</div>
						<h3>Easy to find</h3>
						<p>Easily search and explore a wide range of houses and rooms
							based on your location, budget, and preferences. Our simple and
							user-friendly system helps you find the perfect place without any
							hassle.</p>
					</article>

					<article class="feature-card">
						<div class="feature-icon">
							<img src="images/label_114874.svg" alt="Affordable prices" />
						</div>
						<h3>Affordable Prices</h3>
						<p>We provide listings with competitive and transparent
							pricing, ensuring you can find options that suit your budget
							without hidden costs.</p>
					</article>

					<article class="feature-card">
						<div class="feature-icon">
							<img
								src="images/3507760-clock-history-iconoteka-time-watch_107692.svg"
								alt="Quickly process" />
						</div>
						<h3>Quickly Process</h3>
						<p>From searching to booking, our platform offers a fast and
							smooth process. Save time with instant access to property details
							and quick booking features.</p>
					</article>
				</div>
			</div>
		</section>

		<section class="help section" id="about">
			<div class="container help-grid">
				<div class="help-images">
					<img src="images/AZ19GXhGC_Urw0-5srCesQ-AZ19GXhGPnoinQqUgil0Kg.jpg"
						alt="Living room interior" /> <img
						src="images/AZ19GiZaeyx7kadXlVHTPw-AZ19GiZaOxGI_Rh77GCP-Q.jpg"
						alt="Bedroom interior" />
				</div>

				<div class="help-text">
					<h2>We Help People To Find Homes</h2>
					<p>We make it simple for people to find the right home or room
						that matches their needs. Our platform connects tenants with
						trusted property owners, offering a smooth and reliable renting
						experience from search to booking.</p>
					<a href="#contact" class="btn btn-primary">Get In Touch</a>
				</div>
			</div>
		</section>
	</main>


	<!-- ================= FOOTER ================= -->
	<jsp:include page="/WEB-INF/pages/include/footer.jsp" />

</body>
</html>
