package com.RentNest.controller;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.Property;
import com.RentNest.model.Review;
import com.RentNest.model.User;
import com.RentNest.service.BookingService;
import com.RentNest.service.PropertyService;
import com.RentNest.service.ReviewService;
import com.RentNest.service.WishlistService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/property-detail" })
public class PropertyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();
	private WishlistService wishlistService = new WishlistService();
	private BookingService bookingService = new BookingService();
	private ReviewService reviewService = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idValue = request.getParameter("id");

		if (idValue == null || idValue.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/property-list");
			return;
		}

		try {
			int propertyId = Integer.parseInt(idValue);

			Property property = propertyService.getPropertyById(propertyId);

			if (property == null) {
				response.sendRedirect(request.getContextPath() + "/property-list");
				return;
			}

			User user = (User) SessionUtil.getAttribute(request, "user");

			if (user != null) {
				boolean alreadyWishlisted = wishlistService.wishlistExists(user.getUserId(), propertyId);
				boolean alreadyBooked = bookingService.bookingExists(user.getUserId(), propertyId);

				request.setAttribute("alreadyWishlisted", alreadyWishlisted);
				request.setAttribute("alreadyBooked", alreadyBooked);
			}

			List<Review> reviews = reviewService.getReviewsByPropertyId(propertyId);

			request.setAttribute("property", property);
			request.setAttribute("reviews", reviews);

			request.getRequestDispatcher("/WEB-INF/pages/public/property-details.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			<%-- Print Error In Console --%>
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/property-list");
		}
	}
}