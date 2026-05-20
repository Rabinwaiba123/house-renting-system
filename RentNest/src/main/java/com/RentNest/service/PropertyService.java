package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.PropertyDAO;
import com.RentNest.model.Property;

public class PropertyService {

	private PropertyDAO propertyDAO = new PropertyDAO();

	public List<Property> getPublicProperties() {
		return propertyDAO.getPublicProperties();
	}

	public List<Property> getAllAdminProperties() {
		return propertyDAO.getAllAdminProperties();
	}

	public Property getPropertyById(int id) {
		return propertyDAO.getPropertyById(id);
	}

	public boolean approveProperty(int id) {
		return propertyDAO.changePropertyStatus(id, true) > 0;
	}

	public boolean rejectProperty(int id) {
		return propertyDAO.changePropertyStatus(id, false) > 0;
	}

	public boolean deleteProperty(int id) {
		return propertyDAO.deleteProperty(id) > 0;
	}

	public boolean addProperty(Property property) {
		return propertyDAO.addProperty(property) > 0;
	}

	public boolean updateProperty(Property property) {
		return propertyDAO.updateProperty(property) > 0;
	}

	public boolean markPropertyAsUnavailable(int propertyId) {
		return propertyDAO.markPropertyAsUnavailable(propertyId);
	}

	public List<Property> searchProperties(String keyword, String type, String maxPrice) {
		return propertyDAO.searchProperties(keyword, type, maxPrice);
	}

	public List<Property> getLatestProperties() {
		return propertyDAO.getLatestProperties();
	}

	public String validateProperty(Property property) {
		if (property.getTitle() == null || property.getTitle().trim().isEmpty()) {
			return "Property title is required.";
		}
		if (property.getType() == null || property.getType().trim().isEmpty()) {
			return "Property type is required.";
		}
		if (property.getLocation() == null || property.getLocation().trim().isEmpty()) {
			return "Location is required.";
		}
		if (property.getPrice() <= 0) {
			return "Price must be greater than 0.";
		}
		if (property.getRooms() <= 0) {
			return "Rooms must be greater than 0.";
		}
		if (property.getBathrooms() <= 0) {
			return "Bathrooms must be greater than 0.";
		}
		return null;
	}
}