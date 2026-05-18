<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 - Page Not Found | RentNest</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/error.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body class="error-body">

	<section class="error-wrapper">

		<div class="error-card">

			<div class="error-icon">
				<i class="fa fa-home"></i>
			</div>

			<h1>404</h1>

			<h2>Page Not Found</h2>

			<p>Sorry, the page you are looking for does not exist or may have
				been moved. Please return to the homepage or browse available
				properties.</p>

			<div class="error-actions">
				<a href="${pageContext.request.contextPath}/home" class="error-btn">
					<i class="fa fa-arrow-left"></i> Back to Home
				</a> <a href="${pageContext.request.contextPath}/property-list"
					class="error-btn secondary"> View Properties </a>
			</div>

		</div>

	</section>

</body>
</html>