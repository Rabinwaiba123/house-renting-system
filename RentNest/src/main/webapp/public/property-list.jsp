<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>RentNest Properties</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
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
	font-family: 'Poppins', sans-serif;
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
	width: min(1180px, calc(100% - 40px));
	margin: 0 auto;
}

.small-container {
	width: min(1100px, calc(100% - 40px));
}

.section {
	padding: 78px 0;
}

.hero-wrap {
	background: linear-gradient(to bottom, #edf5ea 0 71%, #f7f7f7 71% 100%);
	padding-top: 26px;
}

.navbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
}

.logo img {
	width: 145px;
}

.nav-links {
	list-style: none;
	display: flex;
	align-items: center;
	gap: 42px;
}

.nav-links a {
	font-size: 15px;
	font-weight: 500;
	position: relative;
}

.nav-links a.active::after, .nav-links a:hover::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -7px;
	width: 100%;
	height: 2px;
	background: var(--primary);
}

.nav-actions {
	display: flex;
	align-items: center;
	gap: 10px;
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

.hero {
	display: grid;
	grid-template-columns: 1.05fr 1fr;
	align-items: center;
	gap: 18px;
	padding: 48px 0 20px;
}

.hero-text h1 {
	font-size: clamp(2.3rem, 5vw, 4rem);
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
}

.hero-image {
	display: flex;
	justify-content: flex-end;
}

.hero-image img {
	max-width: 760px;
	width: 100%;
}

.search-box {
	width: min(100%, 620px);
	display: grid;
	grid-template-columns: 1.25fr 0.7fr 1fr 132px;
	gap: 14px;
	background: #ec9967;
	padding: 20px;
	border-radius: 8px;
	transform: translateY(-14px);
}

.field label {
	display: block;
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 8px;
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
	font-size: clamp(2rem, 4vw, 3.3rem);
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
	gap: 0;
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
	width: 150px;
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
		justify-content: center;
	}
	.search-box {
		transform: none;
		margin-top: 18px;
		width: 100%;
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

/* Properties Page */
.subpage-header {
	background: #edf5ea;
	padding: 14px 0 8px;
}

.properties-page {
	background: #f4f4f4;
	min-height: 100vh;
}

.properties-hero {
	padding: 34px 0 64px;
}

.properties-container h1 {
	text-align: center;
	font-size: clamp(2.2rem, 5vw, 4rem);
	font-weight: 800;
	line-height: 1.15;
	margin-bottom: 34px;
}

.properties-search-box {
	width: min(100%, 760px);
	margin: 0 auto 48px;
	display: grid;
	grid-template-columns: 1.25fr 0.7fr 1fr 132px;
	gap: 18px;
	align-items: end;
}

.properties-search-box .field label {
	margin-bottom: 8px;
}

.properties-search-box .select-wrap select {
	border: 1px solid #ececec;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
	min-height: 46px;
}

.properties-grid {
	display: grid;
	grid-template-columns: repeat(3, minmax(0, 1fr));
	gap: 34px;
}

.page-card {
	background: #fff;
	border: 1px solid #d9d9d9;
	border-radius: 22px;
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

.page-card .property-img {
	width: calc(100% - 24px);
	height: 258px;
	object-fit: cover;
	margin: 12px auto 0;
	border-radius: 18px;
}

.page-card .card-body {
	padding: 14px 16px 20px;
}

.page-card .card-title-row h3 {
	font-size: 18px;
}

.page-card .location {
	font-size: 14px;
}

.page-card .price {
	font-size: 16px;
	margin: 8px 0 14px;
}

.page-card .card-btn {
	width: 100%;
	text-align: center;
	padding: 12px 18px;
	border-radius: 999px;
}

@media ( max-width : 991px) {
	.properties-grid {
		grid-template-columns: repeat(2, minmax(0, 1fr));
	}
	.properties-search-box {
		grid-template-columns: 1fr 1fr;
	}
}

@media ( max-width : 767px) {
	.properties-container h1 {
		margin-bottom: 24px;
	}
	.properties-grid {
		grid-template-columns: 1fr;
		gap: 24px;
	}
	.properties-search-box {
		grid-template-columns: 1fr;
		gap: 14px;
		margin-bottom: 28px;
	}
}
</style>
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar.jsp" />

	<main class="properties-page">
		<section class="properties-hero">
			<div class="container properties-container">
				<h1>Available Properties</h1>

				<form class="properties-search-box">
					<div class="field">
						<label for="location">Location</label>
						<div class="select-wrap">
							<select id="location">
								<option>Kathmandu, Nepal</option>
								<option>Lalitpur, Nepal</option>
								<option>Bhaktapur, Nepal</option>
							</select> <img
								src="${pageContext.request.contextPath}/images/down_icon-icons.com_61209.png"
								alt="dropdown icon" />
						</div>
					</div>

					<div class="field small">
						<label for="type">Type</label>
						<div class="select-wrap">
							<select id="type">
								<option>Room</option>
								<option>Flat</option>
								<option>House</option>
							</select> <img
								src="${pageContext.request.contextPath}/images/down_icon-icons.com_61209.png"
								alt="dropdown icon" />
						</div>
					</div>

					<div class="field">
						<label for="price">Price Range</label>
						<div class="select-wrap">
							<select id="price">
								<option>Rs3000 - Rs4000</option>
								<option>Rs4000 - Rs8000</option>
								<option>Rs8000 - Rs15000</option>
							</select> <img
								src="${pageContext.request.contextPath}/images/down_icon-icons.com_61209.png"
								alt="dropdown icon" />
						</div>
					</div>

					<button type="submit" class="search-btn">Search</button>
				</form>

				<div class="properties-grid">
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
	</main>

	<!-- ================= FOOTER ================= -->
	<jsp:include page="/include/footer.jsp" />

</body>
</html>
