package service;

import dao.PropertyDAO;
import model.Property;

public class PropertyService {
	private PropertyDAO propertyDAO = new PropertyDAO();

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

		if (property.getBedrooms() <= 0) {
			return "Bedrooms must be greater than 0.";
		}

		if (property.getBathrooms() <= 0) {
			return "Bathrooms must be greater than 0.";
		}

		return null;
	}

	public boolean addProperty(Property property) {
		return propertyDAO.addProperty(property) > 0;
	}
}