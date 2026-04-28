<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Owner Profile</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
	<!-- ================= NAVBAR ================= -->
	<jsp:include page="/include/navbar2.jsp">
		<jsp:param name="title" value="Owner Dashboard" />
	</jsp:include>

	<div class="main-container">
		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="/include/owner-sidebar.jsp" />

		<div class="main">
			<div class="searchbar2">
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<div class="Page-Heading">
				<h1>Owner Profile</h1>
			</div>

			<div class="profile-layout">
				<div class="profile-card">
					<div class="profile-image-box">
						<img src="../images/images.jpg" alt="Owner Profile" />
					</div>
					<h2>Rabin Waiba</h2>
					<p>Property Owner</p>

					<div class="profile-meta">
						<div>
							<span>Email</span>
							<h4>rabinwaaib87@gmail.com</h4>
						</div>
						<div>
							<span>Phone</span>
							<h4>+977 9812345678</h4>
						</div>
						<div>
							<span>Joined</span>
							<h4>2026-01-15</h4>
						</div>
					</div>

					<button class="profile-btn primary-btn">Edit Profile</button>
				</div>

				<div class="profile-details">
					<div class="table-container profile-section">
						<div class="table-header">
							<h1 class="table-heading">Personal Information</h1>
							<button class="view">Edit</button>
						</div>

						<div class="info-grid">
							<div class="info-box">
								<label>Full Name</label>
								<p>Rabin Waiba</p>
							</div>

							<div class="info-box">
								<label>Username</label>
								<p>rabin_owner</p>
							</div>

							<div class="info-box">
								<label>Email Address</label>
								<p>rabinwaaib87@gmail.com</p>
							</div>

							<div class="info-box">
								<label>Phone Number</label>
								<p>+977 9812345678</p>
							</div>

							<div class="info-box">
								<label>Role</label>
								<p>Owner</p>
							</div>

							<div class="info-box">
								<label>Address</label>
								<p>Kathmandu, Nepal</p>
							</div>
						</div>
					</div>

					<div class="table-container profile-section">
						<div class="table-header">
							<h1 class="table-heading">Account Settings</h1>
							<button class="view">Update</button>
						</div>

						<div class="settings-grid">
							<div class="setting-card">
								<div class="setting-icon">
									<i class="fa fa-lock"></i>
								</div>
								<div class="setting-text">
									<h3>Change Password</h3>
									<p>Update your password to keep your owner account secure.
									</p>
								</div>
							</div>

							<div class="setting-card">
								<div class="setting-icon">
									<i class="fa fa-bell"></i>
								</div>
								<div class="setting-text">
									<h3>Notification Settings</h3>
									<p>Manage booking alerts, payment updates, and property
										notifications.</p>
								</div>
							</div>

							<div class="setting-card">
								<div class="setting-icon">
									<i class="fa fa-shield"></i>
								</div>
								<div class="setting-text">
									<h3>Security</h3>
									<p>Review login activity and keep your property account
										protected.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="table-container">
						<div class="table-header">
							<h1 class="table-heading">Recent Activity</h1>
							<button class="view">View all</button>
						</div>

						<div class="table-body">
							<table class="users-table">
								<thead>
									<tr>
										<th>ID</th>
										<th>Activity</th>
										<th>Module</th>
										<th>Date</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Added new property listing</td>
										<td>My Properties</td>
										<td>2026-04-22</td>
										<td><span class="status-badge active">Completed</span></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Updated booking request</td>
										<td>Booking Requests</td>
										<td>2026-04-21</td>
										<td><span class="status-badge active">Completed</span></td>
									</tr>
									<tr>
										<td>3</td>
										<td>Received payment update</td>
										<td>Earnings</td>
										<td>2026-04-20</td>
										<td><span class="status-badge pending">Processing</span>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Edited property details</td>
										<td>My Properties</td>
										<td>2026-04-19</td>
										<td><span class="status-badge active">Completed</span></td>
									</tr>
									<tr>
										<td>5</td>
										<td>Rejected booking request</td>
										<td>Booking Requests</td>
										<td>2026-04-18</td>
										<td><span class="status-badge blocked">Cancelled</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
