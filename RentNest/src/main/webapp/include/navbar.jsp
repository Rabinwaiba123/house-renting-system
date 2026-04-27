<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<header>
	<nav class="main-navbar">
		<input type="checkbox" id="check" /> <label class="nav-logo">RentNest</label>

		<ul class="nav-menu">
			<li><a class="active"
				href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
			<li><a
				href="${pageContext.request.contextPath}/public//property-list.jsp">Properties</a></li>
			<li><a
				href="${pageContext.request.contextPath}/public/about.jsp">About</a></li>
			<li><a
				href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>

			<!-- MOBILE NOT LOGIN -->
			<c:if test="${empty sessionScope.user}">
				<li class="mobile-auth"><a
					href="${pageContext.request.contextPath}/auth/login.jsp">Login</a>
				</li>
				<li class="mobile-auth"><a
					href="${pageContext.request.contextPath}/auth/register.jsp">Register</a>
				</li>
			</c:if>

			<!-- MOBILE USER LOGIN -->
			<c:if test="${not empty sessionScope.user}">
				<li class="mobile-profile"><a
					href="${pageContext.request.contextPath}/user/profile.jsp">My
						Profile</a></li>
				<li class="mobile-profile"><a
					href="${pageContext.request.contextPath}/user/bookings.jsp">My
						Bookings</a></li>
				<li class="mobile-profile"><a
					href="${pageContext.request.contextPath}/user/wishlist.jsp">Wishlist</a>
				</li>
				<li class="mobile-profile"><a
					href="${pageContext.request.contextPath}/LogoutController"
					class="logout">Logout</a></li>
			</c:if>
		</ul>

		<!-- DESKTOP NOT LOGIN -->
		<c:if test="${empty sessionScope.user}">
			<div class="auth-area">
				<a href="${pageContext.request.contextPath}/auth/login.jsp">Login</a>
				<a href="${pageContext.request.contextPath}/auth/register.jsp"
					class="register-link">Register</a>
			</div>
		</c:if>

		<!-- DESKTOP USER LOGIN -->
		<c:if test="${not empty sessionScope.user}">
			<div class="profile-area">
				<input type="checkbox" id="profile-toggle" /> <label
					for="profile-toggle" class="profile-btn"> <img
					src="${pageContext.request.contextPath}/images/images.jpg"
					alt="User" /> <span>${sessionScope.user.firstName}</span> <i
					class="fa fa-angle-down"></i>
				</label>

				<div class="profile-dropdown">
					<a href="${pageContext.request.contextPath}/user/profile.jsp">
						<i class="fa fa-user"></i> My Profile
					</a> <a href="${pageContext.request.contextPath}/user/bookings.jsp">
						<i class="fa fa-calendar"></i> My Bookings
					</a> <a href="${pageContext.request.contextPath}/user/wishlist.jsp">
						<i class="fa fa-heart"></i> Wishlist
					</a> <a href="${pageContext.request.contextPath}/LogoutController"
						class="logout"> <i class="fa fa-sign-out"></i> Logout
					</a>
				</div>
			</div>
		</c:if>

		<label for="check" class="checkbtn"> <i class="fa fa-bars"></i>
		</label>
	</nav>
</header>
<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
