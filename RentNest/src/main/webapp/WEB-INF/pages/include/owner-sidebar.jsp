<div class="navcontainer">
	<nav class="nav">
		<div class="nav-upper-options">
			<a href="${pageContext.request.contextPath}/WEB-INF/pages/owner/owner-dashboard.jsp" class="nav-option"> <i
				class="fa fa-th-large nav-img"></i><span>Dashboard</span>
			</a> <a
				href="${pageContext.request.contextPath}/property?action=ownerList"
				class="nav-option"> <i class="fa fa-building-o nav-img"></i><span>My
					Properties</span>
			</a> <a href="${pageContext.request.contextPath}/WEB-INF/pages/owner/owner-add-property.jsp" class="nav-option"> <i
				class="fa fa-plus nav-img"></i><span>Add Property</span>
			</a> <a
				href="${pageContext.request.contextPath}/booking?action=ownerRequests"
				class="nav-option active-option"> <i
				class="fa fa-calendar nav-img"></i><span>Booking Requests</span>
			</a> <a href="${pageContext.request.contextPath}/WEB-INF/pages/owner/owner-payments.jsp" class="nav-option"> <i
				class="fa fa-money nav-img"></i><span>Earnings</span>
			</a>
		</div>

		<div class="nav-lower-options">
			<a href="${pageContext.request.contextPath}/WEB-INF/pages/owner/owner-profile.jsp" class="nav-option"> <i
				class="fa fa-user nav-img"></i> <span>Profile</span>
			</a> <a href="${pageContext.request.contextPath}/logout"
				class="nav-option logout"> <i class="fa fa-sign-out nav-img"></i>
				<span>Logout</span>
			</a>
		</div>
	</nav>
</div>

<script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
