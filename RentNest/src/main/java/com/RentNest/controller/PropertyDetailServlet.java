package com.RentNest.controller;

import java.io.IOException;
import java.util.List;

import com.RentNest.dao.BookingDAO;
import com.RentNest.dao.ReviewDAO;
import com.RentNest.dao.WishlistDAO;
import com.RentNest.model.Property;
import com.RentNest.model.Review;
import com.RentNest.model.User;
import com.RentNest.service.PropertyService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/property-detail")
public class PropertyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();
	private WishlistDAO wishlistDAO = new WishlistDAO();
	private BookingDAO bookingDAO = new BookingDAO();
	private ReviewDAO reviewDAO = new ReviewDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idValue = request.getParameter("id");

		if (idValue == null || idValue.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/properties");
			return;
		}

		int propertyId = Integer.parseInt(idValue);
		Property property = propertyService.getPropertyById(propertyId);

		if (property == null) {
			response.sendRedirect(request.getContextPath() + "/properties");
			return;
		}

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user != null) {
			boolean alreadyWishlisted = wishlistDAO.wishlistExists(user.getUserId(), propertyId);
			boolean alreadyBooked = bookingDAO.bookingExists(user.getUserId(), propertyId);

			request.setAttribute("alreadyWishlisted", alreadyWishlisted);
			request.setAttribute("alreadyBooked", alreadyBooked);
		}

		request.setAttribute("property", property);
		List<Review> reviews = reviewDAO.getReviewsByPropertyId(propertyId);
		request.setAttribute("reviews", reviews);

		request.getRequestDispatcher("/WEB-INF/pages/public/property-details.jsp").forward(request, response);
	}
}