<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Properties</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Properties</h1>
					<button class="view">Add Property</button>
				</div>



				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>Image</th>
								<th>Title</th>
								<th>Type</th>
								<th>Location</th>
								<th>Price</th>
								<th>Rooms</th>
								<th>Status</th>
								<th>Availability</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${properties}">
								<tr>
									<td><c:if test="${not empty p.image}">
											<img src="${pageContext.request.contextPath}/${p.image}"
												width="100" height="70">
										</c:if></td>

									<td>${p.title}</td>
									<td>${p.type}</td>
									<td>${p.location}</td>
									<td>Rs. ${p.price}</td>
									<td>${p.rooms}</td>
									<td>${p.status}</td>
									<td>${p.availability}</td>

									<td><a
										href="${pageContext.request.contextPath}/property?action=approve&id=${p.propertyId}">
											Approve </a> | <a
										href="${pageContext.request.contextPath}/property?action=reject&id=${p.propertyId}">
											Reject </a> | <a
										href="${pageContext.request.contextPath}/property?action=delete&id=${p.propertyId}&from=admin"
										onclick="return confirm('Are you sure you want to delete this property?');">
											Delete </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
