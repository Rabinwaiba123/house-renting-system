package com.RentNest.model;

public class Wishlist {

	private int wishlistId;
	private int userId;
	private int propertyId;

	
	
	public Wishlist() {
		super();
	}

	public Wishlist(int wishlistId, int userId, int propertyId) {
		super();
		this.wishlistId = wishlistId;
		this.userId = userId;
		this.propertyId = propertyId;
	}

	// Getters and Setters

	public int getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
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

}
