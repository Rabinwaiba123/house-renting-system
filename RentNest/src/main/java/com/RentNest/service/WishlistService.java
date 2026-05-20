package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.WishlistDAO;
import com.RentNest.model.Wishlist;

public class WishlistService {

	private WishlistDAO wishlistDAO = new WishlistDAO();

	public boolean addWishlist(Wishlist wishlist) {
		return wishlistDAO.addWishlist(wishlist) > 0;
	}

	public List<Wishlist> getWishlistByUserId(int userId) {
		return wishlistDAO.getWishlistByUserId(userId);
	}

	public boolean wishlistExists(int userId, int propertyId) {
		return wishlistDAO.wishlistExists(userId, propertyId);
	}

	public boolean deleteWishlist(int wishlistId) {
		return wishlistDAO.deleteWishlist(wishlistId) > 0;
	}
}