<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Payments</title>
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
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Payments</h1>
					<button class="view">Export</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Payment Status</label> <select>
							<option>All</option>
							<option>Paid</option>
							<option>Pending</option>
							<option>Failed</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Payment Method</label> <select>
							<option>All</option>
							<option>eSewa</option>
							<option>Khalti</option>
							<option>Bank Transfer</option>
							<option>Cash</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Payment Date</label> <input type="date" />
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Payer</th>
								<th>Property</th>
								<th>Booking ID</th>
								<th>Amount</th>
								<th>Method</th>
								<th>Payment Date</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>1</td>
								<td>Rabin Waiba</td>
								<td>Sunrise Apartment</td>
								<td>#B001</td>
								<td>$450</td>
								<td>eSewa</td>
								<td>2026-04-20</td>
								<td><span class="status-badge active">Paid</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-download"></i></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Jason Miller</td>
								<td>Green Valley House</td>
								<td>#B002</td>
								<td>$700</td>
								<td>Khalti</td>
								<td>2026-04-18</td>
								<td><span class="status-badge pending">Pending</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-download"></i></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Sophia Rai</td>
								<td>City Room Rental</td>
								<td>#B003</td>
								<td>$180</td>
								<td>Cash</td>
								<td>2026-04-17</td>
								<td><span class="status-badge active">Paid</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-download"></i></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Aarav Sharma</td>
								<td>Heritage Flat</td>
								<td>#B004</td>
								<td>$520</td>
								<td>Bank Transfer</td>
								<td>2026-04-16</td>
								<td><span class="status-badge blocked">Failed</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-download"></i></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Mukesh Sharma</td>
								<td>Lakeview Villa</td>
								<td>#B005</td>
								<td>$1200</td>
								<td>eSewa</td>
								<td>2026-04-15</td>
								<td><span class="status-badge active">Paid</span></td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-download"></i></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

