<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<header>
	<div class="logosec">
		<i class="fa fa-bars fa-2x icn menuicn" id="menuicn"></i>

		<div class="logo">
			RentNest
			<p>Admin Dashboard</p>
		</div>
	</div>

	<div class="searchbar">
		<input type="text" placeholder="Search" />

		<div class="searchbtn">
			<img
				src="${pageContext.request.contextPath}/images/icons/search-icon.svg"
				class="icn srchicn" alt="search-icon" />
		</div>
	</div>

	<div class="message">
		<div class="circle"></div>

		<img
			src="${pageContext.request.contextPath}/images/icons/bell_icon.png"
			class="icn" alt="bell-icon" />

		<div class="dp">
			<c:choose>
				<c:when test="${not empty sessionScope.user.image}">
					<img
						src="${pageContext.request.contextPath}/${sessionScope.user.image}"
						class="dpicn" alt="Admin Profile" />
				</c:when>

				<c:otherwise>
					<img
						src="${pageContext.request.contextPath}/images/icons/default-user.jpg"
						class="dpicn" alt="Admin Profile" />
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</header>