<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Owner My Properties</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar2.jsp">
		<jsp:param name="title" value="Owner Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/include/owner-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">My Properties</h1>
					<button
						href="${pageContext.request.contextPath}/owner/add-property.jsp"
						class="view">Add Property</button>
				</div>
				<c:if test="${param.success == 'added'}">
					<p style="color: green;">Property added successfully. Waiting
						for admin approval.</p>
				</c:if>

				<c:if test="${param.success == 'updated'}">
					<p style="color: green;">Property updated successfully.</p>
				</c:if>

				<c:if test="${param.success == 'deleted'}">
					<p style="color: green;">Property deleted successfully.</p>
				</c:if>

				<c:if test="${param.error != null}">
					<p style="color: red;">Something went wrong. Please try again.</p>
				</c:if>



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
												width="90" height="60">
										</c:if></td>

									<td>${p.title}</td>
									<td>${p.type}</td>
									<td>${p.location}</td>
									<td>Rs. ${p.price}</td>
									<td>${p.rooms}</td>
									<td>${p.status}</td>
									<td>${p.availability}</td>

									<td><a
										href="${pageContext.request.contextPath}/owner/edit-property.jsp?id=${p.propertyId}">
											Edit </a> | <a
										href="${pageContext.request.contextPath}/property?action=delete&id=${p.propertyId}"
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
