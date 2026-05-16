<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Contacts</title>
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
				<input type="text" placeholder="Search" />
				<div class="searchbtn">
					<img
						src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
						class="icn srchicn" alt="search-icon" />
				</div>
			</div>

			<div class="table-container">
				<div class="table-header">
					<h1 class="table-heading">Contacts</h1>
				</div>

				<div class="table-body">
					<table class="users-table">
						<thead>
							<tr>
								<th>S.N</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Subject</th>
								<th>Message</th>
								<th>Actions</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${not empty contacts}">
									<c:forEach var="contact" items="${contacts}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${contact.fullName}</td>
											<td>${contact.email}</td>
											<td>${contact.subject}</td>
											<td>${contact.message}</td>
											<td class="actions">
												<form
													action="${pageContext.request.contextPath}/admin/contacts"
													method="post">
													<input type="hidden" name="contactId"
														value="${contact.contactId}"> <input type="hidden"
														name="action" value="delete">
													<button type="submit" class="delete-btn">Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="6">No message found.</td>
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

