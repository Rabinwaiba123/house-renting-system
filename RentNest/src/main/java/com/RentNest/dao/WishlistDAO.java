package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Wishlist;
import com.RentNest.util.DBConnection;

/**
 * WishlistDAO
 * -----------
 * Responsibilities:
 * - Handles database operations related to the user's wishlist.
 * - Allows users to save properties they are interested in.
 * - Retrieves wishlist items with full property details.
 * - Prevents duplicate wishlist entries by checking existing records.
 * - Allows users to remove properties from their wishlist.
 *
 * Important concepts used:
 * - JDBC insert, select and delete operations
 * - PreparedStatement for safe SQL execution
 * - SQL JOIN between wishlist and properties
 * - DAO layer separation for wishlist database logic
 */

public class WishlistDAO {

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

	public List<Wishlist> getWishlistByUserId(int userId) {
		List<Wishlist> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT w.wishlist_id, w.user_id, w.property_id, "
					+ "p.title, p.type, p.location, p.price, p.rooms, p.bathrooms, p.area_sqft, p.image "
					+ "FROM wishlist w " + "JOIN properties p ON w.property_id = p.property_id "
					+ "WHERE w.user_id = ? AND p.is_deleted = FALSE " + "ORDER BY w.wishlist_id DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Wishlist w = new Wishlist();
				w.setWishlistId(rs.getInt("wishlist_id"));
				w.setUserId(rs.getInt("user_id"));
				w.setPropertyId(rs.getInt("property_id"));
				w.setTitle(rs.getString("title"));
				w.setType(rs.getString("type"));
				w.setLocation(rs.getString("location"));
				w.setPrice(rs.getDouble("price"));
				w.setRooms(rs.getInt("rooms"));
				w.setBathrooms(rs.getInt("bathrooms"));
				w.setAreaSqft(rs.getInt("area_sqft"));
				w.setImage(rs.getString("image"));
				list.add(w);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	/**
	 * Checks whether a property already exists in the user's wishlist.
	 * This prevents duplicate wishlist records for the same user and property.
	 */
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