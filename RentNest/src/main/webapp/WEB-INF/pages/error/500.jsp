<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 - Server Error | RentNest</title>

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

			<div class="error-icon danger">
				<i class="fa fa-exclamation-triangle"></i>
			</div>

			<h1>500</h1>

			<h2>Something Went Wrong</h2>

			<p>Sorry, the server could not complete your request. Please try
				again later or return to the homepage.</p>

			<div class="error-actions">
				<a href="${pageContext.request.contextPath}/home" class="error-btn">
					<i class="fa fa-home"></i> Back to Home
				</a> <a href="${pageContext.request.contextPath}/property-list"
					class="error-btn secondary"> View Properties </a>
			</div>

		</div>

	</section>

</body>
</html>