package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Review;
import util.DBConnection;

public class ReviewDAO {

	// Add review
	public int addReview(Review review) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "INSERT INTO reviews(user_id, property_id, rating, comment) " + "VALUES (?, ?, ?, ?)";
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

	// Get all reviews
	public List<Review> getAllReviews() {
		List<Review> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM reviews";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Review r = new Review();
				r.setReviewId(rs.getInt("review_id"));
				r.setUserId(rs.getInt("user_id"));
				r.setPropertyId(rs.getInt("property_id"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				list.add(r);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// Get review by id
	public Review getReviewById(int reviewId) {
		Review r = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM reviews WHERE review_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, reviewId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				r = new Review();
				r.setReviewId(rs.getInt("review_id"));
				r.setUserId(rs.getInt("user_id"));
				r.setPropertyId(rs.getInt("property_id"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return r;
	}

	// Get reviews by property
	public List<Review> getReviewsByPropertyId(int propertyId) {
		List<Review> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM reviews WHERE property_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, propertyId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Review r = new Review();
				r.setReviewId(rs.getInt("review_id"));
				r.setUserId(rs.getInt("user_id"));
				r.setPropertyId(rs.getInt("property_id"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				list.add(r);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// Delete review
	public int deleteReview(int reviewId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "DELETE FROM reviews WHERE review_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, reviewId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}