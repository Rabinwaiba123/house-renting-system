<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied | RentNest</title>

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

			<div class="error-icon warning">
				<i class="fa fa-lock"></i>
			</div>

			<h1>403</h1>

			<h2>Access Denied</h2>

			<p>You do not have permission to access this page. Please go back
				to the correct dashboard or return to the homepage.</p>

			<div class="error-actions">

				<c:choose>
					<c:when test="${sessionScope.user.role eq 'admin'}">
						<a href="${pageContext.request.contextPath}/admin/dashboard"
							class="error-btn"> <i class="fa fa-dashboard"></i> Admin
							Dashboard
						</a>
					</c:when>

					<c:otherwise>
						<a href="${pageContext.request.contextPath}/home"
							class="error-btn"> <i class="fa fa-home"></i> Back to Home
						</a>
					</c:otherwise>
				</c:choose>

				<a href="${pageContext.request.contextPath}/logout"
					class="error-btn secondary"> Logout </a>

			</div>

		</div>

	</section>

</body>
</html>