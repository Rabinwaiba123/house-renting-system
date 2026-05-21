package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Property;
import com.RentNest.util.DBConnection;

/**
 * PropertyDAO ----------- Responsibilities: - Handles all database operations
 * related to rental properties. - Allows admin to add, update, approve, reject,
 * view and delete properties. - Provides public property lists by showing only
 * approved and available properties. - Supports search and filtering using
 * keyword, type and maximum price. - Uses soft delete to hide properties
 * without permanently removing them.
 *
 * Important concepts used: - JDBC CRUD operations - PreparedStatement for
 * secure query execution - Dynamic SQL using StringBuilder for search filters -
 * Reusable mapProperty method to reduce repeated code - Soft delete and
 * availability/status management
 */
public class PropertyDAO {

	public int addProperty(Property property) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "INSERT INTO properties(title, type, location, price, rooms, bathrooms, area_sqft, description, image, availability, status, is_deleted) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, property.getTitle());
			ps.setString(2, property.getType());
			ps.setString(3, property.getLocation());
			ps.setDouble(4, property.getPrice());
			ps.setInt(5, property.getRooms());
			ps.setInt(6, property.getBathrooms());
			ps.setInt(7, property.getAreaSqft());
			ps.setString(8, property.getDescription());
			ps.setString(9, property.getImage());
			ps.setBoolean(10, property.isAvailability());
			ps.setBoolean(11, property.isStatus());
			ps.setBoolean(12, false);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	/**
	 * Maps one ResultSet row into a Property object. This reusable method reduces
	 * duplicate code in methods that fetch property data.
	 */
	private Property mapProperty(ResultSet rs) throws Exception {
		Property p = new Property();
		p.setPropertyId(rs.getInt("property_id"));
		p.setTitle(rs.getString("title"));
		p.setType(rs.getString("type"));
		p.setLocation(rs.getString("location"));
		p.setPrice(rs.getDouble("price"));
		p.setRooms(rs.getInt("rooms"));
		p.setBathrooms(rs.getInt("bathrooms"));
		p.setAreaSqft(rs.getInt("area_sqft"));
		p.setDescription(rs.getString("description"));
		p.setImage(rs.getString("image"));
		p.setAvailability(rs.getBoolean("availability"));
		p.setStatus(rs.getBoolean("status"));
		p.setDeleted(rs.getBoolean("is_deleted"));
		p.setCreatedAt(rs.getTimestamp("created_at"));

		return p;
	}

	public List<Property> getPublicProperties() {
		List<Property> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM properties WHERE status = TRUE AND availability = TRUE AND is_deleted = FALSE ORDER BY created_at DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProperty(rs));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<Property> getAllAdminProperties() {
		List<Property> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM properties  WHERE is_deleted = FALSE ORDER BY created_at DESC ";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProperty(rs));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public int changePropertyStatus(int propertyId, boolean status) {
		int result = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE properties SET status = ? WHERE property_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setBoolean(1, status);
			ps.setInt(2, propertyId);
			result = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	public List<Property> searchProperties(String keyword, String type, String maxPrice) {
		List<Property> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder(
				"SELECT * FROM properties WHERE is_deleted = FALSE AND status = TRUE AND availability = TRUE");
		if (keyword != null && !keyword.trim().isEmpty()) {
			sql.append(" AND (title LIKE ? OR location LIKE ? OR description LIKE ?)");
		}
		if (type != null && !type.trim().isEmpty()) {
			sql.append(" AND LOWER(type) = LOWER(?)");
		}
		if (maxPrice != null && !maxPrice.trim().isEmpty()) {
			sql.append(" AND price <= ?");
		}
		sql.append(" ORDER BY created_at DESC");
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql.toString())) {
			int index = 1;
			if (keyword != null && !keyword.trim().isEmpty()) {
				String searchKeyword = "%" + keyword.trim() + "%";
				ps.setString(index++, searchKeyword);
				ps.setString(index++, searchKeyword);
				ps.setString(index++, searchKeyword);
			}
			if (type != null && !type.trim().isEmpty()) {
				ps.setString(index++, type.trim());
			}
			if (maxPrice != null && !maxPrice.trim().isEmpty()) {
				ps.setDouble(index++, Double.parseDouble(maxPrice));
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProperty(rs));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public Property getPropertyById(int propertyId) {
		Property p = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM properties WHERE property_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, propertyId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				p = new Property();
				p.setPropertyId(rs.getInt("property_id"));
				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));
				p.setRooms(rs.getInt("rooms"));
				p.setBathrooms(rs.getInt("bathrooms"));
				p.setAreaSqft(rs.getInt("area_sqft"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				p.setAvailability(rs.getBoolean("availability"));
				p.setStatus(rs.getBoolean("status"));
				p.setDeleted(rs.getBoolean("is_deleted"));
				p.setCreatedAt(rs.getTimestamp("created_at"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return p;
	}

	public int updateProperty(Property property) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE properties SET title = ?, type = ?, location = ?, price = ?, "
					+ "rooms = ?, bathrooms = ?, area_sqft = ?, description = ?, image = ?, "
					+ "availability = ?, status = ? WHERE property_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, property.getTitle());
			ps.setString(2, property.getType());
			ps.setString(3, property.getLocation());
			ps.setDouble(4, property.getPrice());
			ps.setInt(5, property.getRooms());
			ps.setInt(6, property.getBathrooms());
			ps.setInt(7, property.getAreaSqft());
			ps.setString(8, property.getDescription());
			ps.setString(9, property.getImage());
			ps.setBoolean(10, property.isAvailability());
			ps.setBoolean(11, property.isStatus());
			ps.setInt(12, property.getPropertyId());
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public boolean markPropertyAsUnavailable(int propertyId) {

		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE properties SET availability = FALSE WHERE property_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, propertyId);
			return ps.executeUpdate() > 0;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Property> getLatestProperties() {
		List<Property> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM properties "
					+ "WHERE status = TRUE AND availability = TRUE AND is_deleted = FALSE "
					+ "ORDER BY created_at DESC LIMIT 3";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Property p = new Property();
				p.setPropertyId(rs.getInt("property_id"));
				p.setTitle(rs.getString("title"));
				p.setDescription(rs.getString("description"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));
				p.setRooms(rs.getInt("rooms"));
				p.setBathrooms(rs.getInt("bathrooms"));
				p.setAreaSqft(rs.getInt("area_sqft"));
				p.setType(rs.getString("type"));
				p.setImage(rs.getString("image"));
				list.add(p);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public int deleteProperty(int propertyId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE properties SET is_deleted = TRUE WHERE property_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, propertyId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}