package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.ReviewDAO;
import com.RentNest.model.Review;

public class ReviewService {

	private ReviewDAO reviewDAO = new ReviewDAO();

	public String validateReview(int rating, String comment) {
		if (rating < 1 || rating > 5) {
			return "Rating must be between 1 and 5.";
		}

		if (comment == null || comment.trim().isEmpty()) {
			return "Review comment is required.";
		}

		return null;
	}

	public boolean addReview(Review review) {
		return reviewDAO.addReview(review) > 0;
	}

	public List<Review> getReviewsByPropertyId(int propertyId) {
		return reviewDAO.getReviewsByPropertyId(propertyId);
	}
}