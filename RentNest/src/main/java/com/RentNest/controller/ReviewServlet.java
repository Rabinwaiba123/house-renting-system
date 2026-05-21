package com.RentNest.controller;

import java.io.IOException;

import com.RentNest.model.Review;
import com.RentNest.model.User;
import com.RentNest.service.ReviewService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/review" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService reviewService = new ReviewService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			request.getSession().setAttribute("error", "Please login to submit review.");
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		try {
			int propertyId = Integer.parseInt(request.getParameter("propertyId"));
			int rating = Integer.parseInt(request.getParameter("rating"));
			String comment = request.getParameter("comment");

			String validation = reviewService.validateReview(rating, comment);

			if (validation != null) {
				request.getSession().setAttribute("error", validation);
				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			Review review = new Review();
			review.setUserId(user.getUserId());
			review.setPropertyId(propertyId);
			review.setRating(rating);
			review.setComment(comment.trim());

			boolean result = reviewService.addReview(review);

			if (result) {
				request.getSession().setAttribute("success", "Review submitted successfully.");
			} else {
				request.getSession().setAttribute("error", "Failed to submit review.");
			}

			response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Something went wrong.");
			response.sendRedirect(request.getContextPath() + "/property-list");
		}
	}
}