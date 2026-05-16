package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Property;
import com.RentNest.util.DBConnection;

public class PropertyDAO {

	// Add new property
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

	// Get all approved properties for public/user side
	public List<Property> getPublicProperties() {
		List<Property> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM properties WHERE status = TRUE AND availability = TRUE AND is_deleted = FALSE ORDER BY created_at DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProperty(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		} catch (Exception e) {
			e.printStackTrace();
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

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

	// Get property by id
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

	// Update property
	public int updateProperty(Property property) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE properties SET title = ?, type = ?, location = ?, price = ?, "
					+ "bedrooms = ?, bathrooms = ?, area_sqft = ?, description = ?, image = ?, "
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

	// Delete property
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