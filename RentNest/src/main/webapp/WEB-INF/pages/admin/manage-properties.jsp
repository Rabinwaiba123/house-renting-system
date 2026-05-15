<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Properties</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">
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
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Properties</h1>
					<a href="${pageContext.request.contextPath}/admin/add-property"
						class="view"> Add Property </a>
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
								<th>Availability</th>
								<th>Status</th>
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
									<td>${p.availability ? 'Available' : 'Not Available'}</td>
									<td>${p.status ? 'Approved' : 'Pending'}</td>

									<td>
										<div class="actions">

											<a
												href="${pageContext.request.contextPath}/admin/edit-property?id=${p.propertyId}"
												class="edit-btn"> Edit </a>

											<form
												action="${pageContext.request.contextPath}/admin/manage-properties"
												method="post" class="action-form">

												<input type="hidden" name="propertyId"
													value="${p.propertyId}"> <input type="hidden"
													name="action" value="delete">

												<button type="submit" class="delete-btn">
													Delete</button>

											</form>

										</div>
									</td>
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
