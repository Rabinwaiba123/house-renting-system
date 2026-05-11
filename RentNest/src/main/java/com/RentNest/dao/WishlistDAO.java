package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Wishlist;
import com.RentNest.util.DBConnection;

public class WishlistDAO {

	// Add property to wishlist
	public int addWishlist(Wishlist wishlist) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "INSERT INTO wishlist(user_id, property_id) VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, wishlist.getUserId());
			ps.setInt(2, wishlist.getPropertyId());
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	// Get all wishlist items
	public List<Wishlist> getAllWishlists() {
		List<Wishlist> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM wishlist";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Wishlist w = new Wishlist();
				w.setWishlistId(rs.getInt("wishlist_id"));
				w.setUserId(rs.getInt("user_id"));
				w.setPropertyId(rs.getInt("property_id"));
				list.add(w);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// Get wishlist by user
	public List<Wishlist> getWishlistByUserId(int userId) {
		List<Wishlist> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM wishlist WHERE user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Wishlist w = new Wishlist();
				w.setWishlistId(rs.getInt("wishlist_id"));
				w.setUserId(rs.getInt("user_id"));
				w.setPropertyId(rs.getInt("property_id"));
				list.add(w);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// Check if property already exists in wishlist
	public boolean wishlistExists(int userId, int propertyId) {
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT wishlist_id FROM wishlist WHERE user_id = ? AND property_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, propertyId);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	// Remove wishlist item
	public int deleteWishlist(int wishlistId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "DELETE FROM wishlist WHERE wishlist_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, wishlistId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}