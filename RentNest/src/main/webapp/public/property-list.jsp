<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<!DOCTYPE html>
<html>
  <head>
    <title>RentNest Properties</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <style>
      .properties-page {
        display: flex;
        gap: 35px;
        padding: 38px 55px 120px 55px;
        min-height: 100vh;
      }

      .filter-sidebar {
        width: 250px;
        flex-shrink: 0;
      }

      .filter-title {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 30px;
      }

      .filter-icon {
        width: 42px;
        height: 42px;
        border-radius: 12px;
        background-color: #ede9fe;
        color: #4f46e5;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .filter-title h2 {
        font-size: 20px;
        color: #111827;
      }

      .filter-title p {
        font-size: 12px;
        color: #6b7280;
      }

      .filter-group {
        margin-bottom: 28px;
      }

      .filter-group label {
        display: block;
        color: #526071;
        font-size: 15px;
        font-weight: 600;
        margin-bottom: 14px;
      }

      .filter-group label i {
        color: #4f46e5;
        margin-right: 7px;
      }

      .filter-group input[type="range"] {
        width: 100%;
        accent-color: #4f46e5;
      }

      .range-text {
        display: flex;
        justify-content: space-between;
        margin-top: 8px;
        color: #7b8794;
        font-size: 12px;
      }

      .filter-group select {
        width: 100%;
        height: 48px;
        border: none;
        outline: none;
        border-radius: 12px;
        padding: 0 14px;
        background-color: #ffffff;
        color: #526071;
        font-weight: 500;
      }

      .bed-options {
        display: flex;
        gap: 9px;
      }

      .bed-options button {
        width: 48px;
        height: 38px;
        border: none;
        border-radius: 10px;
        background-color: #ffffff;
        color: #526071;
        font-weight: 600;
        cursor: pointer;
      }

      .bed-options .selected {
        background-color: #eef2ff;
        color: #4f46e5;
        border: 1px solid #c7d2fe;
      }

      .check-list label {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 9px;
        color: #374151;
      }

      .check-list input {
        width: 18px;
        height: 18px;
        accent-color: #4f46e5;
      }

      .apply-btn {
        width: 100%;
        height: 55px;
        border: none;
        border-radius: 14px;
        background-color: #2563eb;
        color: white;
        font-weight: 700;
        cursor: pointer;
        box-shadow: 0 12px 22px rgba(37, 99, 235, 0.25);
      }

      .property-content {
        flex: 1;
      }

      .property-topbar {
        display: flex;
        justify-content: space-between;
        gap: 25px;
        margin-bottom: 45px;
      }

      .property-search {
        flex: 1;
        height: 56px;
        background-color: #ffffff;
        border-radius: 18px;
        display: flex;
        align-items: center;
        padding: 0 22px;
        color: #94a3b8;
      }

      .property-search input {
        width: 100%;
        border: none;
        outline: none;
        margin-left: 14px;
        font-size: 15px;
        color: #526071;
      }

      .sort-box {
        display: flex;
        align-items: center;
        gap: 14px;
      }

      .sort-box span {
        color: #526071;
        font-size: 14px;
      }

      .sort-box select {
        height: 56px;
        border: none;
        outline: none;
        border-radius: 16px;
        padding: 0 20px;
        background-color: #ffffff;
        color: #111827;
        font-weight: 600;
      }

      .property-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 35px;
      }

      .property-card {
        background-color: #ffffff;
        border-radius: 22px;
        overflow: hidden;
        box-shadow: 0 20px 45px rgba(15, 23, 42, 0.04);
      }

      .property-img {
        height: 250px;
        position: relative;
        background-size: cover;
        background-position: center;
      }

      .img1 {
        background-image: url("../images/property1.jpg");
      }

      .img2 {
        background-image: url("../images/property2.jpg");
      }

      .img3 {
        background-image: url("../images/property3.jpg");
      }

      .img4 {
        background-image: url("../images/property4.jpg");
      }

      .img5 {
        background-image: url("../images/property5.jpg");
      }

      .img6 {
        background-image: url("../images/property6.jpg");
      }

      .price {
        position: absolute;
        top: 18px;
        left: 18px;
        background-color: #4f46e5;
        color: #ffffff;
        padding: 9px 15px;
        border-radius: 22px;
        font-size: 13px;
        font-weight: 700;
      }

      .heart {
        position: absolute;
        top: 18px;
        right: 18px;
        width: 42px;
        height: 42px;
        border: none;
        border-radius: 50%;
        background-color: rgba(255, 255, 255, 0.45);
        color: white;
        font-size: 20px;
        cursor: pointer;
      }

      .property-info {
        padding: 24px;
      }

      .tag {
        color: #4f46e5;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-bottom: 12px;
      }

      .tag span {
        display: inline-block;
        width: 8px;
        height: 8px;
        background-color: #4f46e5;
        border-radius: 50%;
        margin-right: 8px;
      }

      .tag.orange {
        color: #f59e0b;
      }

      .tag.orange span {
        background-color: #f59e0b;
      }

      .tag.light {
        color: #94a3b8;
      }

      .tag.light span {
        background-color: #cbd5e1;
      }

      .property-info h3 {
        font-size: 20px;
        color: #111827;
        margin-bottom: 8px;
      }

      .location {
        color: #64748b;
        font-size: 14px;
        margin-bottom: 22px;
      }

      .location i {
        color: #4f46e5;
      }

      .property-meta {
        border-top: 1px solid #eef2f7;
        padding-top: 16px;
        display: flex;
        align-items: center;
        gap: 14px;
        color: #526071;
        font-size: 13px;
      }

      .property-meta a {
        margin-left: auto;
        text-decoration: none;
        color: #4f46e5;
        font-weight: 700;
      }

      .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 14px;
        margin-top: 65px;
      }

      .pagination button {
        width: 42px;
        height: 42px;
        border: none;
        border-radius: 12px;
        background-color: #ffffff;
        color: #526071;
        font-weight: 700;
        cursor: pointer;
      }

      .pagination .active-page {
        background-color: #4f46e5;
        color: white;
      }

      .pagination span {
        color: #94a3b8;
      }

      footer {
        background-color: #eef1f6;
        padding: 70px 75px;
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1fr;
        gap: 50px;
      }

      .footer-col h3,
      .footer-col h4 {
        margin-bottom: 22px;
      }

      .footer-col h4 {
        font-size: 12px;
        letter-spacing: 3px;
      }

      .footer-col p,
      .footer-col a {
        display: block;
        color: #8b95a7;
        font-size: 13px;
        text-decoration: none;
        margin-bottom: 12px;
        line-height: 1.6;
      }

      .social-icons i {
        width: 35px;
        height: 35px;
        background-color: white;
        color: #4f46e5;
        border-radius: 50%;
        text-align: center;
        line-height: 35px;
        margin-right: 10px;
      }

      @media screen and (max-width: 1000px) {
        .properties-page {
          flex-direction: column;
        }

        .filter-sidebar {
          width: 100%;
        }

        .property-grid {
          grid-template-columns: repeat(2, 1fr);
        }

        .property-topbar {
          flex-direction: column;
        }
      }

      @media screen and (max-width: 700px) {
        .top-navbar {
          padding: 0 20px;
        }

        .nav-links {
          display: none;
        }

        .properties-page {
          padding: 30px 20px 80px 20px;
        }

        .property-grid {
          grid-template-columns: 1fr;
        }
      }
    </style>
  </head>

  <body>
   <!-- ================= NAVBAR ================= -->
   <jsp:include page="/include/navbar.jsp" />

    <main class="properties-page">
      <aside class="filter-sidebar">
        <div class="filter-title">
          <div class="filter-icon">
            <i class="fa fa-filter"></i>
          </div>
          <div>
            <h2>Filter Results</h2>
            <p>Refine your search</p>
          </div>
        </div>

        <div class="filter-group">
          <label><i class="fa fa-money"></i> Price Range</label>
          <input type="range" min="1000" max="10000" />
          <div class="range-text">
            <span>$1,000</span>
            <span>$10,000+</span>
          </div>
        </div>

        <div class="filter-group">
          <label><i class="fa fa-map-marker"></i> Location</label>
          <select>
            <option>Select Cities</option>
            <option>Kathmandu</option>
            <option>Lalitpur</option>
            <option>Bhaktapur</option>
            <option>Pokhara</option>
          </select>
        </div>

        <div class="filter-group">
          <label><i class="fa fa-bed"></i> Bedrooms</label>
          <div class="bed-options">
            <button>1</button>
            <button class="selected">2</button>
            <button>3</button>
            <button>4+</button>
          </div>
        </div>

        <div class="filter-group">
          <label><i class="fa fa-building-o"></i> Property Type</label>
          <div class="check-list">
            <label><input type="checkbox" /> Apartment</label>
            <label><input type="checkbox" checked /> House</label>
            <label><input type="checkbox" /> Villa</label>
          </div>
        </div>

        <button class="apply-btn">Apply Filters</button>
      </aside>

      <section class="property-content">
        <div class="property-topbar">
          <div class="property-search">
            <i class="fa fa-search"></i>
            <input
              type="text"
              placeholder="Search by address, neighborhood..."
            />
          </div>

          <div class="sort-box">
            <span>Sort by:</span>
            <select>
              <option>Newest Listings</option>
              <option>Lowest Price</option>
              <option>Highest Price</option>
            </select>
          </div>
        </div>

        <div class="property-grid">
          <div class="property-card">
            <div class="property-img img1">
              <span class="price">$4,500/mo</span>
              <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div class="property-info">
              <p class="tag"><span></span> Featured Property</p>
              <h3>Azure Skyline Villa</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Hollywood Hills, CA
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 4</span>
                <span><i class="fa fa-bath"></i> 3</span>
                <span><i class="fa fa-area-chart"></i> 3.2k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>

          <div class="property-card">
            <div class="property-img img2">
              <span class="price">$2,800/mo</span>
              <button class="heart"><i class="fa fa-heart-o"></i></button>
            </div>
            <div class="property-info">
              <p class="tag"><span></span> Just Listed</p>
              <h3>Oakwood Loft</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Brooklyn, NY
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 2</span>
                <span><i class="fa fa-bath"></i> 1</span>
                <span><i class="fa fa-area-chart"></i> 1.1k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>

          <div class="property-card">
            <div class="property-img img3">
              <span class="price">$7,200/mo</span>
            </div>
            <div class="property-info">
              <p class="tag orange"><span></span> Exclusive</p>
              <h3>Summit Penthouse</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Miami Beach, FL
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 3</span>
                <span><i class="fa fa-bath"></i> 3</span>
                <span><i class="fa fa-area-chart"></i> 2.8k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>

          <div class="property-card">
            <div class="property-img img4">
              <span class="price">$3,900/mo</span>
              <button class="heart"><i class="fa fa-heart-o"></i></button>
            </div>
            <div class="property-info">
              <p class="tag light"><span></span> Available Now</p>
              <h3>Willow Bend Estate</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Austin, TX
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 5</span>
                <span><i class="fa fa-bath"></i> 4</span>
                <span><i class="fa fa-area-chart"></i> 4.1k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>

          <div class="property-card">
            <div class="property-img img5">
              <span class="price">$5,100/mo</span>
              <button class="heart"><i class="fa fa-heart-o"></i></button>
            </div>
            <div class="property-info">
              <p class="tag"><span></span> New Construction</p>
              <h3>Contemporary Manor</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Seattle, WA
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 4</span>
                <span><i class="fa fa-bath"></i> 3.5</span>
                <span><i class="fa fa-area-chart"></i> 3.5k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>

          <div class="property-card">
            <div class="property-img img6">
              <span class="price">$8,400/mo</span>
              <button class="heart"><i class="fa fa-heart-o"></i></button>
            </div>
            <div class="property-info">
              <p class="tag"><span></span> Prime Selection</p>
              <h3>Oceanic Retreat</h3>
              <p class="location">
                <i class="fa fa-map-marker"></i> Malibu, CA
              </p>
              <div class="property-meta">
                <span><i class="fa fa-bed"></i> 4</span>
                <span><i class="fa fa-bath"></i> 4</span>
                <span><i class="fa fa-area-chart"></i> 3.8k</span>
                <a href="property-details.html">View Details</a>
              </div>
            </div>
          </div>
        </div>

        <div class="pagination">
          <button><i class="fa fa-angle-left"></i></button>
          <button class="active-page">1</button>
          <button>2</button>
          <button>3</button>
          <span>...</span>
          <button>10</button>
          <button><i class="fa fa-angle-right"></i></button>
        </div>
      </section>
    </main>

   <!-- ================= FOOTER ================= -->
   <jsp:include page="/include/footer.jsp" />

  </body>
</html>
