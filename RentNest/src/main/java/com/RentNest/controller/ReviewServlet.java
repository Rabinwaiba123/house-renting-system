package com.RentNest.controller;

import java.io.IOException;

import com.RentNest.dao.ReviewDAO;
import com.RentNest.model.Review;
import com.RentNest.model.User;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewDAO reviewDAO = new ReviewDAO();

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

			if (rating < 1 || rating > 5 || comment == null || comment.trim().isEmpty()) {
				request.getSession().setAttribute("error", "Please enter valid review.");
				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			Review review = new Review();
			review.setUserId(user.getUserId());
			review.setPropertyId(propertyId);
			review.setRating(rating);
			review.setComment(comment.trim());

			int result = reviewDAO.addReview(review);

			if (result > 0) {
				request.getSession().setAttribute("success", "Review submitted successfully.");
			} else {
				request.getSession().setAttribute("error", "Failed to submit review.");
			}

			response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Something went wrong.");
			response.sendRedirect(request.getContextPath() + "/properties");
		}
	}
}