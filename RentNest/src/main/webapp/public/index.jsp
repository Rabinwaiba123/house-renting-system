<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<%@ include file="/include/navbar.jsp"%>

	<!-- ================= HERO ================= -->
	<section class="hero-section">
		<div class="hero-overlay">
			<h1>Find Your Perfect Home</h1>

			<div class="search-box">
				<div class="search-item">
					<label>LOCATION</label>
					<p>
						<i class="fa fa-map-marker"></i> Where are you looking?
					</p>
				</div>

				<div class="search-item">
					<label>PRICE RANGE</label>
					<p>
						<i class="fa fa-money"></i> Set your budget
					</p>
				</div>

				<div class="search-item">
					<label>PROPERTY TYPE</label>
					<p>
						<i class="fa fa-building-o"></i> Apartment
					</p>
				</div>

				<button class="search-btn">
					<i class="fa fa-search"></i> Search
				</button>
			</div>
		</div>
	</section>

	<!-- ================= FEATURED ================= -->
	<section class="featured-section">
		<div class="section-header">
			<h2>Featured Properties</h2>
			<a href="properties.html">Explore all listings <i
				class="fa fa-arrow-right"></i></a>
		</div>

		<div class="property-grid">
			<div class="property-card">
				<div class="property-img img1">
					<span>$1,250,000</span>
				</div>

				<div class="property-info">
					<p>
						<i class="fa fa-map-marker"></i> Kathmandu
					</p>
					<h3>Modern Apartment</h3>

					<div class="property-meta">
						<span><i class="fa fa-bed"></i> 3 Bed</span> <span><i
							class="fa fa-bath"></i> 2 Bath</span> <span><i
							class="fa fa-area-chart"></i> 1500 sqft</span>
					</div>

					<button>View Details</button>
				</div>
			</div>

			<div class="property-card">
				<div class="property-img img2">
					<span>$800,000</span>
				</div>

				<div class="property-info">
					<p>
						<i class="fa fa-map-marker"></i> Pokhara
					</p>
					<h3>Lake View Villa</h3>

					<div class="property-meta">
						<span><i class="fa fa-bed"></i> 4 Bed</span> <span><i
							class="fa fa-bath"></i> 3 Bath</span> <span><i
							class="fa fa-area-chart"></i> 2000 sqft</span>
					</div>

					<button>View Details</button>
				</div>
			</div>

			<div class="property-card">
				<div class="property-img img3">
					<span>$500,000</span>
				</div>

				<div class="property-info">
					<p>
						<i class="fa fa-map-marker"></i> Lalitpur
					</p>
					<h3>Cozy Flat</h3>

					<div class="property-meta">
						<span><i class="fa fa-bed"></i> 2 Bed</span> <span><i
							class="fa fa-bath"></i> 2 Bath</span> <span><i
							class="fa fa-area-chart"></i> 1200 sqft</span>
					</div>

					<button>View Details</button>
				</div>
			</div>
		</div>
	</section>

	<!-- ================= FOOTER ================= -->
	<%@ include file="/include/footer.jsp"%>

</body>
</html>
