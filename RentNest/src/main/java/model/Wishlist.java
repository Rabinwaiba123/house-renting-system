package model;

import java.sql.Timestamp;

public class Wishlist {
	private int wishlistId;
	private int userId;
	private int propertyId;
	private Timestamp createdAt;

// Default Constructor
	public Wishlist() {
	}

// Parameterized Constructor
	public Wishlist(int wishlistId, int userId, int propertyId, Timestamp createdAt) {
		this.wishlistId = wishlistId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.createdAt = createdAt;
	}

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

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}
