<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Owner Booking Requests</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>

  <body>
        <!-- ================= NAVBAR ================= -->
   <%@ include file="../include/owner-navbar.jsp" %>

    <div class="main-container">
                        <!-- ================= SIDEBAR ================= -->
   <jsp:include page="/include/owner-sidebar.jsp" />

      <div class="main">
        <div class="searchbar2">
          <input type="text" name="" id="" placeholder="Search" />
          <div class="searchbtn">
            <img
              src="../images/search-icon.svg"
              class="icn srchicn"
              alt="search-icon"
            />
          </div>
        </div>

        <div class="box-container">
          <div class="box box1">
            <i class="fa fa-calendar fa-2x"></i>
            <div class="text">
              <p>TOTAL REQUESTS</p>
              <h2>18</h2>
            </div>
          </div>

          <div class="box box2">
            <i class="fa fa-clock-o fa-2x" style="color: grey"></i>
            <div class="text">
              <p>PENDING</p>
              <h2>6</h2>
            </div>
          </div>

          <div class="box box3">
            <i class="fa fa-check-circle fa-2x" style="color: green"></i>
            <div class="text">
              <p>APPROVED</p>
              <h2>9</h2>
            </div>
          </div>

          <div class="box box4">
            <i class="fa fa-times-circle fa-2x" style="color: red"></i>
            <div class="text">
              <p>REJECTED</p>
              <h2>3</h2>
            </div>
          </div>
        </div>

        <div class="table-container">
          <div class="table-header">
            <h1 class="table-heading">Booking Requests</h1>
            <button class="view">Export</button>
          </div>

          <div class="booking-filter">
            <div class="filter-group">
              <label>Status</label>
              <select>
                <option>All</option>
                <option>Pending</option>
                <option>Approved</option>
                <option>Rejected</option>
              </select>
            </div>

            <div class="filter-group">
              <label>Property</label>
              <select>
                <option>All</option>
                <option>Sunrise Apartment</option>
                <option>Green Valley House</option>
                <option>City Room Rental</option>
                <option>Lakeview Villa</option>
              </select>
            </div>

            <div class="filter-group">
              <label>Move In Date</label>
              <input type="date" />
            </div>

            <button class="filter-btn">Filter</button>
          </div>

          <div class="table-body">
            <table class="users-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Tenant Name</th>
                  <th>Property</th>
                  <th>Request Date</th>
                  <th>Move In Date</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Rabin Waiba</td>
                  <td>Sunrise Apartment</td>
                  <td>2026-04-21</td>
                  <td>2026-05-01</td>
                  <td>$450</td>
                  <td><span class="status-badge pending">Pending</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-check"></i>
                    <i class="fa fa-times"></i>
                  </td>
                </tr>

                <tr>
                  <td>2</td>
                  <td>Jason Miller</td>
                  <td>Lakeview Villa</td>
                  <td>2026-04-20</td>
                  <td>2026-05-04</td>
                  <td>$1200</td>
                  <td><span class="status-badge active">Approved</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-check"></i>
                    <i class="fa fa-times"></i>
                  </td>
                </tr>

                <tr>
                  <td>3</td>
                  <td>Sophia Rai</td>
                  <td>City Room Rental</td>
                  <td>2026-04-19</td>
                  <td>2026-04-28</td>
                  <td>$180</td>
                  <td><span class="status-badge blocked">Rejected</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-check"></i>
                    <i class="fa fa-times"></i>
                  </td>
                </tr>

                <tr>
                  <td>4</td>
                  <td>Aarav Sharma</td>
                  <td>Green Valley House</td>
                  <td>2026-04-18</td>
                  <td>2026-05-03</td>
                  <td>$700</td>
                  <td><span class="status-badge pending">Pending</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-check"></i>
                    <i class="fa fa-times"></i>
                  </td>
                </tr>

                <tr>
                  <td>5</td>
                  <td>Mukesh Sharma</td>
                  <td>Heritage Flat</td>
                  <td>2026-04-17</td>
                  <td>2026-05-06</td>
                  <td>$520</td>
                  <td><span class="status-badge active">Approved</span></td>
                  <td class="actions">
                    <i class="fa fa-eye"></i>
                    <i class="fa fa-check"></i>
                    <i class="fa fa-times"></i>
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
