package service;

import java.util.List;

import dao.PropertyDAO;
import model.Property;

public class PropertyService {

	private PropertyDAO propertyDAO = new PropertyDAO();

	// Add property
	public boolean addProperty(Property property) {
		return propertyDAO.addProperty(property);
	}

	// Get approved properties for public/user side
	public List<Property> getApprovedProperties() {
		return propertyDAO.getApprovedProperties();
	}

	// Get property details by id
	public Property getPropertyById(int propertyId) {
		return propertyDAO.getPropertyById(propertyId);
	}

	// Get properties by owner
	public List<Property> getPropertiesByOwner(int ownerId) {
		return propertyDAO.getPropertiesByOwner(ownerId);
	}

	// Update property
	public boolean updateProperty(Property property) {
		return propertyDAO.updateProperty(property);
	}

	// Delete property
	public boolean deleteProperty(int propertyId) {
		return propertyDAO.deleteProperty(propertyId);
	}

	public List<Property> getAllProperties() {
		return propertyDAO.getAllProperties();
	}

	// Admin get pending properties
	public List<Property> getPendingProperties() {
		return propertyDAO.getPendingProperties();
	}

	// Admin approve property
	public boolean approveProperty(int propertyId) {
		return propertyDAO.approveProperty(propertyId);
	}

	// Admin reject property
	public boolean rejectProperty(int propertyId) {
		return propertyDAO.rejectProperty(propertyId);
	}

	// Search and filter properties
	public List<Property> searchProperties(String location, String type, double maxPrice) {
		return propertyDAO.searchProperties(location, type, maxPrice);
	}
}