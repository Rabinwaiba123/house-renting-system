<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Tag Library -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<!-- Page Title -->
<title>Admin Properties</title>

<!-- Admin CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/admin.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>

<body>

	<!-- ================= NAVBAR ================= -->

	<!-- Include Admin Navbar -->
	<jsp:include page="/WEB-INF/pages/include/admin-navbar.jsp" />

	<div class="main-container">

		<!-- ================= SIDEBAR ================= -->

		<!-- Include Admin Sidebar -->
		<jsp:include page="/WEB-INF/pages/include/admin-sidebar.jsp" />

		<!-- ================= MAIN CONTENT ================= -->

		<div class="main">

			<!-- Search Bar -->
			<div class="searchbar2">

				<!-- Search Input -->
				<input type="text" name="" id="" placeholder="Search" />

				<!-- Search Button -->
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>

			</div>

			<!-- ================= PROPERTY TABLE SECTION ================= -->

			<div class="table-container">

				<!-- Table Header -->
				<div class="table-header">

					<!-- Page Heading -->
					<h1 class="table-heading">Properties</h1>

					<!-- Add Property Button -->
					<a href="${pageContext.request.contextPath}/admin/add-property"
						class="view">

						Add Property

					</a>

				</div>

				<!-- ================= TABLE BODY ================= -->

				<div class="table-body">

					<table class="users-table">

						<!-- Table Column Headers -->
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

						<!-- Table Data -->
						<tbody>

							<!-- Check if properties list is not empty -->
							<c:choose>

								<c:when test="${not empty properties}">

									<!-- Loop through all properties -->
									<c:forEach var="p" items="${properties}">

										<tr>

											<!-- Property Image -->
											<td>

												<!-- Show image only if available -->
												<c:if test="${not empty p.image}">

													<img
														src="${pageContext.request.contextPath}/${p.image}"
														width="100"
														height="70">

												</c:if>

											</td>

											<!-- Property Title -->
											<td>${p.title}</td>

											<!-- Property Type -->
											<td>${p.type}</td>

											<!-- Property Location -->
											<td>${p.location}</td>

											<!-- Property Price -->
											<td>Rs. ${p.price}</td>

											<!-- Property Availability -->
											<td>
												${p.availability ? 'Available' : 'Not Available'}
											</td>

											<!-- Property Status -->
											<td>
												${p.status ? 'Approved' : 'Pending'}
											</td>

											<!-- Action Buttons -->
											<td>

												<div class="actions">

													<!-- Edit Property Button -->
													<a
														href="${pageContext.request.contextPath}/admin/edit-property?id=${p.propertyId}"
														class="edit-btn">

														Edit

													</a>

													<!-- Delete Property Form -->
													<form
														action="${pageContext.request.contextPath}/admin/manage-properties"
														method="post"
														class="action-form">

														<!-- Hidden Property ID -->
														<input type="hidden"
															name="propertyId"
															value="${p.propertyId}">

														<!-- Hidden Action Type -->
														<input type="hidden"
															name="action"
															value="delete">

														<!-- Delete Button -->
														<button type="submit"
															class="delete-btn">

															Delete

														</button>

													</form>

												</div>

											</td>

										</tr>

									</c:forEach>

								</c:when>

								<!-- If No Properties Exist -->
								<c:otherwise>

									<tr>

										<td colspan="8">
											No properties found.
										</td>

									</tr>

								</c:otherwise>

							</c:choose>

						</tbody>

					</table>

				</div>

			</div>

		</div>
	</div>

</body>
</html>