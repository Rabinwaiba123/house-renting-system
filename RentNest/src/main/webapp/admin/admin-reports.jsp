<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Reports</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>

  <body>
    <!-- ================= NAVBAR ================= -->
   <%@ include file="../include/admin-navbar.jsp" %>
    
    <div class="main-container">
            <!-- ================= SIDEBAR ================= -->
   <jsp:include page="/include/admin-sidebar.jsp" />

      <div class="main">
        <div class="searchbar2">
          <input type="text" placeholder="Search" />
          <div class="searchbtn">
            <img
              src="../images/search-icon.svg"
              class="icn srchicn"
              alt="search-icon"
            />
          </div>
        </div>

        <div class="Page-Heading">
          <h1>Reports Overview</h1>
        </div>

        <div class="report-cards">
          <div class="report-card">
            <div class="report-icon">
              <i class="fa fa-users"></i>
            </div>
            <div class="report-text">
              <p>Total Users</p>
              <h2>120</h2>
            </div>
          </div>

          <div class="report-card">
            <div class="report-icon">
              <i class="fa fa-building-o"></i>
            </div>
            <div class="report-text">
              <p>Total Properties</p>
              <h2>86</h2>
            </div>
          </div>

          <div class="report-card">
            <div class="report-icon">
              <i class="fa fa-calendar"></i>
            </div>
            <div class="report-text">
              <p>Total Bookings</p>
              <h2>54</h2>
            </div>
          </div>

          <div class="report-card">
            <div class="report-icon">
              <i class="fa fa-money"></i>
            </div>
            <div class="report-text">
              <p>Total Revenue</p>
              <h2>$8,450</h2>
            </div>
          </div>
        </div>

        <div class="table-container">
          <div class="table-header">
            <h1 class="table-heading">Generate Reports</h1>
            <button class="view">Download All</button>
          </div>

          <div class="booking-filter">
            <div class="filter-group">
              <label>Report Type</label>
              <select>
                <option>All</option>
                <option>User Report</option>
                <option>Property Report</option>
                <option>Booking Report</option>
                <option>Payment Report</option>
              </select>
            </div>

            <div class="filter-group">
              <label>From Date</label>
              <input type="date" />
            </div>

            <div class="filter-group">
              <label>To Date</label>
              <input type="date" />
            </div>

            <button class="filter-btn">Generate</button>
          </div>

          <div class="quick-report-actions">
            <button class="report-btn">
              <i class="fa fa-users"></i> User Report
            </button>
            <button class="report-btn">
              <i class="fa fa-building-o"></i> Property Report
            </button>
            <button class="report-btn">
              <i class="fa fa-calendar"></i> Booking Report
            </button>
            <button class="report-btn">
              <i class="fa fa-money"></i> Payment Report
            </button>
          </div>

          <div class="table-body">
            <table class="users-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Report Name</th>
                  <th>Category</th>
                  <th>Date Range</th>
                  <th>Created By</th>
                  <th>Generated Date</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>1</td>
                  <td>Monthly User Report</td>
                  <td>Users</td>
                  <td>2026-04-01 to 2026-04-30</td>
                  <td>Admin</td>
                  <td>2026-04-22</td>
                  <td><span class="status-badge active">Ready</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-download"></i>
                    <i class="fa fa-trash"></i>
                  </td>
                </tr>

                <tr>
                  <td>2</td>
                  <td>Property Summary Report</td>
                  <td>Properties</td>
                  <td>2026-04-01 to 2026-04-30</td>
                  <td>Admin</td>
                  <td>2026-04-21</td>
                  <td><span class="status-badge active">Ready</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-download"></i>
                    <i class="fa fa-trash"></i>
                  </td>
                </tr>

                <tr>
                  <td>3</td>
                  <td>Weekly Booking Report</td>
                  <td>Bookings</td>
                  <td>2026-04-15 to 2026-04-21</td>
                  <td>Admin</td>
                  <td>2026-04-21</td>
                  <td><span class="status-badge pending">Processing</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-download"></i>
                    <i class="fa fa-trash"></i>
                  </td>
                </tr>

                <tr>
                  <td>4</td>
                  <td>Payment Collection Report</td>
                  <td>Payments</td>
                  <td>2026-04-01 to 2026-04-20</td>
                  <td>Admin</td>
                  <td>2026-04-20</td>
                  <td><span class="status-badge active">Ready</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-download"></i>
                    <i class="fa fa-trash"></i>
                  </td>
                </tr>

                <tr>
                  <td>5</td>
                  <td>Yearly System Summary</td>
                  <td>Overall</td>
                  <td>2026-01-01 to 2026-12-31</td>
                  <td>Admin</td>
                  <td>2026-04-18</td>
                  <td><span class="status-badge blocked">Failed</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-download"></i>
                    <i class="fa fa-trash"></i>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
