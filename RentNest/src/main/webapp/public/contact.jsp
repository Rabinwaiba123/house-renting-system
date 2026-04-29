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
/* CONTAINER */
.container {
	width: 85%;
	margin: auto;
}

/* HERO */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 60px 0;
}

.line {
	width: 50px;
	height: 3px;
	background: #6c63ff;
}

.hero-image {
	background: #dfe6e9;
	padding: 20px;
	border-radius: 15px;
}

.hero-image img {
	width: 350px;
}

/* MAIN */
.main {
	display: flex;
	gap: 20px;
}

/* FORM */
.form-box {
	flex: 2;
	background: white;
	padding: 25px;
	border-radius: 15px;
}

.row {
	display: flex;
	gap: 10px;
}

input, select, textarea {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	border-radius: 8px;
	border: 1px solid #ddd;
}

button {
	width: 100%;
	margin-top: 15px;
	padding: 12px;
	border: none;
	background: linear-gradient(to right, #5a6cff, #6c63ff);
	color: white;
	border-radius: 25px;
}

/* INFO */
.info-box {
	flex: 1;
	background: white;
	padding: 20px;
	border-radius: 15px;
}

.info-item {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.map {
	width: 100%;
	height: 200px;
	border-radius: 10px;
	margin-top: 15px;
}

/* FAQ */
.faq {
	margin-top: 60px;
	text-align: center;
}

.faq-item {
	background: white;
	padding: 18px;
	margin: 12px auto;
	width: 70%;
	border-radius: 12px;
	text-align: left;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.faq-question {
	display: flex;
	justify-content: space-between;
	font-weight: 600;
}

.faq-answer {
	display: none;
	margin-top: 10px;
	color: #666;
}
</style>
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar.jsp" />

	<div class="container">
		<!-- HERO -->
		<div class="header">
			<div>
				<h1>Contact Us</h1>
				<p>We're here to help you find your sanctuary.</p>
				<div class="line"></div>
			</div>

			<div class="hero-image">
				<img src="<%=request.getContextPath()%>/images/home.png" />
			</div>
		</div>

		<!-- MAIN -->
		<div class="main">
			<!-- FORM -->
			<div class="form-box">
				<h3>Send us a message</h3>
				<p class="sub">Our curation team typically responds within 4
					business hours.</p>

				<div class="row">
					<input type="text" placeholder="Full Name" /> <input type="email"
						id="email" placeholder="Email Address" />
				</div>

				<small id="error"></small> <select>
					<option>Property Inquiry</option>
					<option>Booking Issue</option>
					<option>General Query</option>
				</select>

				<textarea placeholder="Tell us how we can help..."></textarea>

				<button onclick="validateForm()">Submit Message</button>

				<div class="success" id="successBox">
					<i class="fa-solid fa-circle-check"></i> Message Sent Successfully
				</div>
			</div>

			<!-- INFO -->
			<div class="info-box">
				<h3>Contact Information</h3>

				<div class="info-item">
					<i class="fa-solid fa-location-dot"></i>
					<div>
						<b>Headquarters</b>
						<p>1221 Avenue of the Americas, New York, NY</p>
					</div>
				</div>

				<div class="info-item">
					<i class="fa-solid fa-phone"></i>
					<div>
						<b>Phone Support</b>
						<p>+1 (555) 234-8890</p>
					</div>
				</div>

				<div class="info-item">
					<i class="fa-solid fa-envelope"></i>
					<div>
						<b>Direct Email</b>
						<p>concierge@residentialcurator.com</p>
					</div>
				</div>

				<iframe
					src="https://maps.google.com/maps?q=new%20york&t=&z=13&ie=UTF8&iwloc=&output=embed"
					class="map"> </iframe>
			</div>
		</div>

		<!-- FAQ -->
		<div class="faq">
			<h2>Frequently Asked Questions</h2>
			<p class="center">Quick answers to common inquiries from our
				tenants and owners.</p>

			<div class="faq-item">
				<div class="faq-question">
					How do I book a property viewing? <i
						class="fa-solid fa-chevron-down"></i>
				</div>
				<div class="faq-answer">You can book a viewing directly
					through the “Properties” page by selecting your preferred unit and
					clicking “Schedule Tour.” Our automated system will match you with
					a curator for a physical or virtual walkthrough.</div>
			</div>

			<div class="faq-item">
				<div class="faq-question">
					What are the management fees for owners? <i
						class="fa-solid fa-chevron-down"></i>
				</div>
				<div class="faq-answer">We offer a tiered commission structure
					starting at 8% of monthly rent including tenant screening,
					maintenance coordination, and marketing.</div>
			</div>

			<div class="faq-item">
				<div class="faq-question">
					Is the security deposit refundable? <i
						class="fa-solid fa-chevron-down"></i>
				</div>
				<div class="faq-answer">Yes, deposits are held securely and
					refunded within 14 business days after inspection.</div>
			</div>

			<div class="faq-item">
				<div class="faq-question">
					How long does approval take? <i class="fa-solid fa-chevron-down"></i>
				</div>
				<div class="faq-answer">Approval is typically completed within
					24–48 hours after submission of documents.</div>
			</div>
		</div>
	</div>


	<!-- ================= FOOTER ================= -->
	<jsp:include page="/include/footer.jsp" />
</body>
</html>