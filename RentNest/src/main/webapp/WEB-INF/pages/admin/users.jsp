<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Users</title>
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
					<h1 class="table-heading">Users</h1>
				</div>



				<div class="table-body">
					<table class="users-table">
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
						<tbody>
							<c:choose>
								<c:when test="${not empty users}">
									<c:forEach var="user" items="${users}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.phone}</td>
											<td>${user.role}</td>

											<td><c:choose>
													<c:when test="${user.status}">
														<span>Active</span>
													</c:when>
													<c:otherwise>
														<span>Inactive</span>
													</c:otherwise>
												</c:choose></td>

											<td class="actions">
												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post" style="display: inline;">
													<input type="hidden" name="userId" value="${user.userId}">
													<input type="hidden" name="action" value="approve">
													<button type="submit" class="approve-btn">Approve</button>
												</form>
												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post" style="display: inline;">
													<input type="hidden" name="userId" value="${user.userId}">
													<input type="hidden" name="action" value="reject">
													<button type="submit" class="reject-btn">Reject</button>
												</form>

												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post" style="display: inline;">
													<input type="hidden" name="userId" value="${user.userId}">
													<input type="hidden" name="action" value="delete">
													<button type="submit" class="delete-btn">Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="7">No users found.</td>
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
