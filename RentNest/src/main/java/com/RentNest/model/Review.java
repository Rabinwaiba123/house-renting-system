package com.RentNest.model;

public class Review {

	private int reviewId;
	private int userId;
	private int propertyId;
	private int rating;
	private String comment;

	
	
	public Review() {
		super();
	}

	public Review(int reviewId, int userId, int propertyId, int rating, String comment) {
		super();
		this.reviewId = reviewId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.rating = rating;
		this.comment = comment;
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

}
