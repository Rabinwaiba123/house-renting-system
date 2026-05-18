package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Review;
import com.RentNest.util.DBConnection;

public class ReviewDAO {

	public int addReview(Review review) {
		int status = 0;

		try (Connection con = DBConnection.getConnection()) {

			String sql = "INSERT INTO reviews(user_id, property_id, rating, comment) VALUES (?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review.getUserId());
			ps.setInt(2, review.getPropertyId());
			ps.setInt(3, review.getRating());
			ps.setString(4, review.getComment());

			status = ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public List<Review> getReviewsByPropertyId(int propertyId) {
		List<Review> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT r.*, u.full_name AS username " + "FROM reviews r "
					+ "JOIN users u ON r.user_id = u.user_id " + "WHERE r.property_id = ? "
					+ "ORDER BY r.review_id DESC";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, propertyId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Review review = new Review();

				review.setReviewId(rs.getInt("review_id"));
				review.setUserId(rs.getInt("user_id"));
				review.setPropertyId(rs.getInt("property_id"));
				review.setRating(rs.getInt("rating"));
				review.setComment(rs.getString("comment"));
				review.setUsername(rs.getString("username"));

				list.add(review);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}
}