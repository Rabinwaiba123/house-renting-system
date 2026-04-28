<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Bookings</title>
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
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Bookings</h1>
					<button class="view">Add Booking</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Status</label> <select>
							<option>All</option>
							<option>Pending</option>
							<option>Confirmed</option>
							<option>Cancelled</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Property Type</label> <select>
							<option>All</option>
							<option>House</option>
							<option>Apartment</option>
							<option>Room</option>
							<option>Flat</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Booking Date</label> <input type="date" />
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>ID</th>
								<th>User</th>
								<th>Property</th>
								<th>Owner</th>
								<th>Booking Date</th>
								<th>Move In</th>
								<th>Amount</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>1</td>
								<td>Rabin Waiba</td>
								<td>Sunrise Apartment</td>
								<td>Mukesh Sharma</td>
								<td>2026-04-20</td>
								<td>2026-05-01</td>
								<td>$450</td>
								<td><span class="status-badge active">Confirmed</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Jason Miller</td>
								<td>Green Valley House</td>
								<td>Sophia Rai</td>
								<td>2026-04-18</td>
								<td>2026-05-05</td>
								<td>$700</td>
								<td><span class="status-badge pending">Pending</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Aarav Sharma</td>
								<td>City Room Rental</td>
								<td>Rabin Waiba</td>
								<td>2026-04-17</td>
								<td>2026-04-28</td>
								<td>$180</td>
								<td><span class="status-badge active">Confirmed</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Sophia Rai</td>
								<td>Heritage Flat</td>
								<td>Jason Miller</td>
								<td>2026-04-16</td>
								<td>2026-05-03</td>
								<td>$520</td>
								<td><span class="status-badge blocked">Cancelled</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Mukesh Sharma</td>
								<td>Lakeview Villa</td>
								<td>Aarav Sharma</td>
								<td>2026-04-14</td>
								<td>2026-05-10</td>
								<td>$1200</td>
								<td><span class="status-badge pending">Pending</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
