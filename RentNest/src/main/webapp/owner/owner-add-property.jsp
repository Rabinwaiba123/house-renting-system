<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Owner Add Property</title>
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
				<input type="text" name="" id="" placeholder="Search" />
				<div class="searchbtn">
					<img src="../images/search-icon.svg" class="icn srchicn"
						alt="search-icon" />
				</div>
			</div>

			<div class="table-container add-property-container">
				<div class="table-header">
					<h1 class="table-heading">Add Property</h1>
					<button class="view">Save Draft</button>
				</div>

				<div class="property-form-wrapper">
					<form class="property-form">
						<div class="form-grid">
							<div class="form-group">
								<label>Property Title</label> <input type="text"
									placeholder="Enter property title" />
							</div>

							<div class="form-group">
								<label>Property Type</label> <select>
									<option>Select type</option>
									<option>House</option>
									<option>Apartment</option>
									<option>Room</option>
									<option>Flat</option>
									<option>Villa</option>
								</select>
							</div>

							<div class="form-group">
								<label>Location</label> <input type="text"
									placeholder="Enter location" />
							</div>

							<div class="form-group">
								<label>Monthly Price</label> <input type="text"
									placeholder="Enter monthly price" />
							</div>

							<div class="form-group">
								<label>Bedrooms</label> <input type="number"
									placeholder="Number of bedrooms" />
							</div>

							<div class="form-group">
								<label>Bathrooms</label> <input type="number"
									placeholder="Number of bathrooms" />
							</div>

							<div class="form-group">
								<label>Furnishing</label> <select>
									<option>Select furnishing</option>
									<option>Furnished</option>
									<option>Semi-Furnished</option>
									<option>Unfurnished</option>
								</select>
							</div>

							<div class="form-group">
								<label>Status</label> <select>
									<option>Select status</option>
									<option>Available</option>
									<option>Pending</option>
									<option>Booked</option>
								</select>
							</div>
						</div>

						<div class="form-group full-width">
							<label>Address</label> <input type="text"
								placeholder="Enter full address" />
						</div>

						<div class="form-group full-width">
							<label>Description</label>
							<textarea placeholder="Write property description"></textarea>
						</div>

						<div class="upload-box">
							<div class="upload-icon">
								<i class="fa fa-image"></i>
							</div>
							<h3>Upload Property Images</h3>
							<p>Choose images for your property listing</p>
							<input type="file" />
						</div>

						<div class="amenities-section">
							<h3 class="section-subtitle">Amenities</h3>
							<div class="amenities-grid">
								<label><input type="checkbox" /> Parking</label> <label><input
									type="checkbox" /> Wi-Fi</label> <label><input type="checkbox" />
									Water Supply</label> <label><input type="checkbox" /> Balcony</label>
								<label><input type="checkbox" /> Kitchen</label> <label><input
									type="checkbox" /> CCTV</label>
							</div>
						</div>

						<div class="form-actions">
							<button type="button" class="cancel-btn">Cancel</button>
							<button type="submit" class="submit-btn">Add Property</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
