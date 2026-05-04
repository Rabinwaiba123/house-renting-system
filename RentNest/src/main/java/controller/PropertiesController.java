package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Property;
import service.PropertyService;

import java.io.IOException;
import java.util.List;


@WebServlet("/properties")
public class PropertiesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PropertiesController() {
		super();

	}

	private PropertyService propertyService = new PropertyService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Property> properties = propertyService.getApprovedProperties();
		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/public/property-list.jsp").forward(request, response);
	}

}
