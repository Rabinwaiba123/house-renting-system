<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<th>Join Date</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Rabin Waiba</td>
								<td>rabinwaaib87@gmail.com</td>
								<td>Owner</td>
								<td><span class="status-badge active">Active</span></td>
								<td>2026-04-21</td>
								<td class="actions"><i class="fa fa-pencil"></i> <i
									class="fa fa-trash"></i></td>
							</tr>
							<tr>
								<td>2</td>
								<td>Jason Miller</td>
								<td>jason@example.com</td>
								<td>User</td>
								<td><span class="status-badge active">Active</span></td>
								<td>2026-04-18</td>
								<td class="actions"><i class="fa fa-pencil"></i> <i
									class="fa fa-trash"></i></td>
							</tr>
							<tr>
								<td>3</td>
								<td>Sophia Rai</td>
								<td>sophia@example.com</td>
								<td>Owner</td>
								<td><span class="status-badge pending">Pending</span></td>
								<td>2026-04-16</td>
								<td class="actions"><i class="fa fa-pencil"></i> <i
									class="fa fa-trash"></i></td>
							</tr>
							<tr>
								<td>4</td>
								<td>Aarav Sharma</td>
								<td>aarav@example.com</td>
								<td>User</td>
								<td><span class="status-badge blocked">Blocked</span></td>
								<td>2026-04-12</td>
								<td class="actions"><i class="fa fa-pencil"></i> <i
									class="fa fa-trash"></i></td>
							</tr>
							<tr>
								<td>5</td>
								<td>Mukesh Sharma</td>
								<td>mukesh@example.com</td>
								<td>Owner</td>
								<td><span class="status-badge active">Active</span></td>
								<td>2026-04-12</td>
								<td class="actions"><i class="fa fa-pencil"></i> <i
									class="fa fa-trash"></i></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
