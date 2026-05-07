package model;

import java.sql.Timestamp;

public class Review {
	private int reviewId;
	private int userId;
	private int propertyId;
	private int rating;
	private String comment;
	private Timestamp createdAt;

// Default Constructor
	public Review() {
	}

// Parameterized Constructor
	public Review(int reviewId, int userId, int propertyId, int rating, String comment, Timestamp createdAt) {

		this.reviewId = reviewId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.rating = rating;
		this.comment = comment;
		this.createdAt = createdAt;
	}

// Getters and Setters

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}
