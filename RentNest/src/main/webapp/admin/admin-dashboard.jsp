<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>

	<!-- ================= NAVBAR ================= -->
	<%@ include file="../include/admin-navbar.jsp"%>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<%@ include file="/include/admin-sidebar.jsp"%>

		<div class="main">
			<div class="searchbar2">
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>
			<div class="Page-Heading">
				<h1>Welcome back, Admin!</h1>
			</div>
			<div class="box-container">
				<div class="box box1">
					<i class="fa fa-users fa-2x"></i>
					<div class="text">
						<p>TOTAL USERS</p>
						<h2>12</h2>
					</div>
				</div>

				<div class="box box2">
					<i class="fa fa-users fa-2x"></i>
					<div class="text">
						<p>TOTAL OWNERS</p>
						<h2>24</h2>
					</div>
				</div>

				<div class="box box3">
					<i class="fa fa-file-text-o fa-2x"></i>
					<div class="text">
						<p>TOTAL BOOKINGS</p>
						<h2>8</h2>
					</div>
				</div>

				<div class="box box4">
					<i class="fa fa-home fa-2x"></i>
					<div class="text">
						<p>TOTAL PROPERTIES</p>
						<h2>423</h2>
					</div>
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Recent Users</h1>
					<button class="view">View all</button>
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
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
