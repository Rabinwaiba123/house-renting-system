package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Property;
import util.DBConnection;

public class PropertyDAO {

	// Add new property
	public boolean addProperty(Property property) {
		boolean result = false;

		String sql = "INSERT INTO properties(owner_id, title, type, location, price, rooms, description, image, status, availability) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'pending', 'available')";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(2, property.getTitle());
			ps.setString(3, property.getType());
			ps.setString(4, property.getLocation());
			ps.setDouble(5, property.getPrice());
			ps.setString(7, property.getDescription());
			ps.setString(8, property.getImage());

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Get all approved properties for public/user side
	public List<Property> getApprovedProperties() {
		List<Property> list = new ArrayList<Property>();

		String sql = "SELECT * FROM properties WHERE status = 'approved' AND availability = 'available'";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Property p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

				list.add(p);
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Get property by id
	public Property getPropertyById(int propertyId) {
		Property p = null;

		String sql = "SELECT * FROM properties WHERE property_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, propertyId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

			}

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	// Get properties added by one owner
	public List<Property> getPropertiesByOwner(int ownerId) {
		List<Property> list = new ArrayList<Property>();

		String sql = "SELECT * FROM properties WHERE owner_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, ownerId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Property p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

				list.add(p);
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Update property
	public boolean updateProperty(Property property) {
		boolean result = false;

		String sql = "UPDATE properties SET title = ?, type = ?, location = ?, price = ?, rooms = ?, description = ?, image = ?, availability = ? WHERE property_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, property.getTitle());
			ps.setString(2, property.getType());
			ps.setString(3, property.getLocation());
			ps.setDouble(4, property.getPrice());

			ps.setString(6, property.getDescription());
			ps.setString(7, property.getImage());

			ps.setInt(9, property.getPropertyId());

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Delete property
	public boolean deleteProperty(int propertyId) {
		boolean result = false;

		String sql = "DELETE FROM properties WHERE property_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, propertyId);

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Property> getAllProperties() {
		List<Property> list = new ArrayList<Property>();

		String sql = "SELECT * FROM properties";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Property p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Admin: get pending properties
	public List<Property> getPendingProperties() {
		List<Property> list = new ArrayList<Property>();

		String sql = "SELECT * FROM properties WHERE status = 'pending'";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Property p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

				list.add(p);
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Admin approve property
	public boolean approveProperty(int propertyId) {
		boolean result = false;

		String sql = "UPDATE properties SET status = 'approved' WHERE property_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, propertyId);

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Admin reject property
	public boolean rejectProperty(int propertyId) {
		boolean result = false;

		String sql = "UPDATE properties SET status = 'rejected' WHERE property_id = ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, propertyId);

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Search and filter properties
	public List<Property> searchProperties(String location, String type, double maxPrice) {
		List<Property> list = new ArrayList<Property>();

		String sql = "SELECT * FROM properties WHERE status = 'approved' AND availability = 'available' "
				+ "AND location LIKE ? AND type LIKE ? AND price <= ?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "%" + location + "%");
			ps.setString(2, "%" + type + "%");
			ps.setDouble(3, maxPrice);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Property p = new Property();

				p.setPropertyId(rs.getInt("property_id"));

				p.setTitle(rs.getString("title"));
				p.setType(rs.getString("type"));
				p.setLocation(rs.getString("location"));
				p.setPrice(rs.getDouble("price"));

				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));

				list.add(p);
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getOwnerIdByPropertyId(int propertyId) {
		int ownerId = 0;

		String sql = "SELECT owner_id FROM properties WHERE property_id=?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, propertyId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				ownerId = rs.getInt("owner_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ownerId;
	}
}