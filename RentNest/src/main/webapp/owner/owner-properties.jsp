<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%@ include file="../include/owner-navbar.jsp"%>

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
					<button class="view">Add Property</button>
				</div>

				<div class="booking-filter">
					<div class="filter-group">
						<label>Property Type</label> <select>
							<option>All</option>
							<option>House</option>
							<option>Apartment</option>
							<option>Room</option>
							<option>Flat</option>
							<option>Villa</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Status</label> <select>
							<option>All</option>
							<option>Available</option>
							<option>Booked</option>
							<option>Pending</option>
						</select>
					</div>

					<div class="filter-group">
						<label>Location</label> <select>
							<option>All</option>
							<option>Kathmandu</option>
							<option>Lalitpur</option>
							<option>Bhaktapur</option>
							<option>Pokhara</option>
						</select>
					</div>

					<button class="filter-btn">Filter</button>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Property Title</th>
								<th>Location</th>
								<th>Type</th>
								<th>Price</th>
								<th>Status</th>
								<th>Views</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Sunrise Apartment</td>
								<td>Kathmandu</td>
								<td>Apartment</td>
								<td>$450/month</td>
								<td><span class="status-badge active">Available</span></td>
								<td>120</td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Green Valley House</td>
								<td>Lalitpur</td>
								<td>House</td>
								<td>$700/month</td>
								<td><span class="status-badge pending">Pending</span></td>
								<td>85</td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>3</td>
								<td>City Room Rental</td>
								<td>Bhaktapur</td>
								<td>Room</td>
								<td>$180/month</td>
								<td><span class="status-badge blocked">Booked</span></td>
								<td>64</td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Heritage Flat</td>
								<td>Pokhara</td>
								<td>Flat</td>
								<td>$520/month</td>
								<td><span class="status-badge active">Available</span></td>
								<td>98</td>
								<td class="actions"><i class="fa fa-eye"></i> <i
									class="fa fa-pencil"></i> <i class="fa fa-trash"></i></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Lakeview Villa</td>
								<td>Pokhara</td>
								<td>Villa</td>
								<td>$1200/month</td>
								<td><span class="status-badge active">Available</span></td>
								<td>145</td>
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
