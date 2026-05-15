package com.RentNest.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.RentNest.model.Property;
import com.RentNest.service.PropertyService;

@WebServlet("/property-detail")
public class PropertyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idValue = request.getParameter("id");

		if (idValue == null || idValue.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/properties");
			return;
		}

		int propertyId = Integer.parseInt(idValue);

		Property property = propertyService.getPropertyById(propertyId);

		if (property == null) {
			response.sendRedirect(request.getContextPath() + "/properties");
			return;
		}

		request.setAttribute("property", property);

		request.getRequestDispatcher("/WEB-INF/pages/public/property-details.jsp").forward(request, response);
	}
}