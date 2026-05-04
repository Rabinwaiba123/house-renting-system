package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Property;
import service.PropertyService;

@WebServlet("/admin/properties")
public class AdminPropertiesController extends HttpServlet {
	private PropertyService propertyService = new PropertyService();
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Property> properties = propertyService.getAllProperties();
		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/admin/admin-properties.jsp").forward(request, response);
	}
}