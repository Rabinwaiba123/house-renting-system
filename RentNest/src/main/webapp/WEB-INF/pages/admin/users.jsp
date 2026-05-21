<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Tag Library -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<!-- Page Title -->
<title>Admin Users</title>

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
						class="icn srchicn"
						alt="search-icon" />

				</div>

			</div>

			<!-- ================= USERS TABLE SECTION ================= -->

			<div class="table-container">

				<!-- Table Header -->
				<div class="table-header">

					<h1 class="table-heading">Users</h1>

				</div>

				<!-- ================= TABLE BODY ================= -->

				<div class="table-body">

					<table class="users-table">

						<!-- Table Headers -->
						<thead>

							<tr>

								<th>S.N</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Role</th>
								<th>Status</th>
								<th>Action</th>

							</tr>

						</thead>

						<!-- Table Data -->
						<tbody>

							<!-- Check if users list is not empty -->
							<c:choose>

								<c:when test="${not empty users}">

									<!-- Loop through all users -->
									<c:forEach var="user"
										items="${users}"
										varStatus="status">

										<tr>

											<!-- Serial Number -->
											<td>${status.count}</td>

											<!-- User Full Name -->
											<td>${user.fullName}</td>

											<!-- User Email -->
											<td>${user.email}</td>

											<!-- User Phone -->
											<td>${user.phone}</td>

											<!-- User Role -->
											<td>${user.role}</td>

											<!-- User Status -->
											<td>

												<c:choose>

													<!-- If User is Active -->
													<c:when test="${user.status}">

														<span>Active</span>

													</c:when>

													<!-- If User is Inactive -->
													<c:otherwise>

														<span>Inactive</span>

													</c:otherwise>

												</c:choose>

											</td>

											<!-- Action Buttons -->
											<td class="actions">

												<!-- Approve User Form -->
												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post"
													style="display: inline;">

													<!-- Hidden User ID -->
													<input type="hidden"
														name="userId"
														value="${user.userId}">

													<!-- Action Type -->
													<input type="hidden"
														name="action"
														value="approve">

													<!-- Approve Button -->
													<button type="submit"
														class="approve-btn">

														Approve

													</button>

												</form>

												<!-- Reject User Form -->
												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post"
													style="display: inline;">

													<!-- Hidden User ID -->
													<input type="hidden"
														name="userId"
														value="${user.userId}">

													<!-- Action Type -->
													<input type="hidden"
														name="action"
														value="reject">

													<!-- Reject Button -->
													<button type="submit"
														class="reject-btn">

														Reject

													</button>

												</form>

												<!-- Delete User Form -->
												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post"
													style="display: inline;">

													<!-- Hidden User ID -->
													<input type="hidden"
														name="userId"
														value="${user.userId}">

													<!-- Action Type -->
													<input type="hidden"
														name="action"
														value="delete">

													<!-- Delete Button -->
													<button type="submit"
														class="delete-btn">

														Delete

													</button>

												</form>

											</td>

										</tr>

									</c:forEach>

								</c:when>

								<!-- If No Users Exist -->
								<c:otherwise>

									<tr>

										<td colspan="7">
											No users found.
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