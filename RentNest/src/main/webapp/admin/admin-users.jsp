<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Users</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar2.jsp">
		<jsp:param name="title" value="Admin Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/include/admin-sidebar.jsp" />

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
					<h1 class="table-heading">Users</h1>
					<button class="view">Add user</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Role</label> <select>
							<option>All</option>
							<option>User</option>
							<option>Owner</option>
							<option>Admin</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Status</label> <select>
							<option>All</option>
							<option>Active</option>
							<option>Pending</option>
							<option>Blocked</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Join Date</label> <input type="date" />
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty users}">
									<c:forEach var="user" items="${users}">
										<tr>
											<td>${user.userId}</td>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.role}</td>

											<td><span class="status-badge ${user.status}">
													${user.status} </span></td>


											<td class="actions"><c:if
													test="${user.status == 'PENDING'}">
													<form
														action="${pageContext.request.contextPath}/admin/users"
														method="post" style="display: inline;">
														<input type="hidden" name="userId" value="${user.userId}">
														<input type="hidden" name="action" value="approve">
														<button type="submit">Approve</button>
													</form>

													<form
														action="${pageContext.request.contextPath}/admin/users"
														method="post" style="display: inline;">
														<input type="hidden" name="userId" value="${user.userId}">
														<input type="hidden" name="action" value="reject">
														<button type="submit">Reject</button>
													</form>
												</c:if>

												<form
													action="${pageContext.request.contextPath}/admin/users"
													method="post" style="display: inline;">
													<input type="hidden" name="userId" value="${user.userId}">
													<input type="hidden" name="action" value="delete">
													<button type="submit">Delete</button>
												</form></td>
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
