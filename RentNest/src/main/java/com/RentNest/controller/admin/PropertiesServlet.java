package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.RentNest.model.Property;
import com.RentNest.service.PropertyService;

/**
 * Servlet implementation class PropertiesController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/manage-properties" })
public class PropertiesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PropertiesServlet() {
		super();
	}

	private PropertyService propertyService = new PropertyService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Property> properties = propertyService.getAllAdminProperties();
		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/admin/manage-properties.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		int propertyId = Integer.parseInt(request.getParameter("propertyId"));

		boolean success = false;

		if ("delete".equals(action)) {

			success = propertyService.deleteProperty(propertyId);

		}

		if (success) {

			response.sendRedirect(request.getContextPath() + "/admin/manage-properties?success=deleted");

		} else {

			response.sendRedirect(request.getContextPath() + "/admin/manage-properties?error=failed");
		}
	}
}
