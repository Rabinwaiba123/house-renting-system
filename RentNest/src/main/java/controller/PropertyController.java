package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Property;
import model.User;
import service.PropertyService;
import util.SessionUtil;

@WebServlet("/property")
public class PropertyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			action = "list";
		}

		if (action.equals("detail")) {
			viewPropertyDetails(request, response);
		} else if (action.equals("ownerList")) {
			ownerPropertyList(request, response);
		} else if (action.equals("delete")) {
			deleteProperty(request, response);
		} else if (action.equals("pending")) {
			pendingProperties(request, response);
		} else if (action.equals("approve")) {
			approveProperty(request, response);
		} else if (action.equals("reject")) {
			rejectProperty(request, response);
		} else if (action.equals("search")) {
			searchProperties(request, response);
		} else {
			response.sendRedirect("property?action=list");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.equals("add")) {
			addProperty(request, response);
		} else if (action.equals("update")) {
			updateProperty(request, response);
		}
	}

	private void addProperty(HttpServletRequest request, HttpServletResponse response) throws IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		Property property = new Property();

		property.setOwnerId(user.getUserId());
		property.setTitle(request.getParameter("title"));
		property.setType(request.getParameter("type"));
		property.setLocation(request.getParameter("location"));
		property.setPrice(Double.parseDouble(request.getParameter("price")));
		property.setRooms(Integer.parseInt(request.getParameter("rooms")));
		property.setDescription(request.getParameter("description"));
		property.setImage(request.getParameter("image"));

		boolean result = propertyService.addProperty(property);

		if (result) {
			response.sendRedirect("property?action=ownerList&success=added");
		} else {
			response.sendRedirect("/WEB-INF/pages/owner/owner-add-property.jsp?error=failed");
		}
	}

	private void viewPropertyDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int propertyId = Integer.parseInt(request.getParameter("id"));

		Property property = propertyService.getPropertyById(propertyId);
		request.setAttribute("property", property);

		request.getRequestDispatcher("/WEB-INF/pages/public/property-details.jsp").forward(request, response);
	}

	private void ownerPropertyList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		List<Property> properties = propertyService.getPropertiesByOwner(user.getUserId());
		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/owner/owner-properties.jsp").forward(request, response);
	}

	private void updateProperty(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Property property = new Property();

		property.setPropertyId(Integer.parseInt(request.getParameter("propertyId")));
		property.setTitle(request.getParameter("title"));
		property.setType(request.getParameter("type"));
		property.setLocation(request.getParameter("location"));
		property.setPrice(Double.parseDouble(request.getParameter("price")));
		property.setRooms(Integer.parseInt(request.getParameter("rooms")));
		property.setDescription(request.getParameter("description"));
		property.setImage(request.getParameter("image"));
		property.setAvailability(request.getParameter("availability"));

		boolean result = propertyService.updateProperty(property);

		if (result) {
			response.sendRedirect("property?action=ownerList&success=updated");
		} else {
			response.sendRedirect("property?action=ownerList&error=updateFailed");
		}
	}

	private void deleteProperty(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int propertyId = Integer.parseInt(request.getParameter("id"));
		String from = request.getParameter("from");

		boolean result = propertyService.deleteProperty(propertyId);

		if ("admin".equals(from)) {
			if (result) {
				response.sendRedirect(request.getContextPath() + "/property?action=pending&success=deleted");
			} else {
				response.sendRedirect(request.getContextPath() + "/property?action=pending&error=deleteFailed");
			}
		} else {
			if (result) {
				response.sendRedirect(request.getContextPath() + "/property?action=ownerList&success=deleted");
			} else {
				response.sendRedirect(request.getContextPath() + "/property?action=ownerList&error=deleteFailed");
			}
		}
	}

	private void pendingProperties(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Property> properties = propertyService.getAllProperties();
		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/admin/admin-properties.jsp").forward(request, response);
	}

	private void approveProperty(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int propertyId = Integer.parseInt(request.getParameter("id"));

		boolean result = propertyService.approveProperty(propertyId);

		if (result) {
			response.sendRedirect("property?action=pending&success=approved");
		} else {
			response.sendRedirect("property?action=pending&error=approveFailed");
		}
	}

	private void rejectProperty(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int propertyId = Integer.parseInt(request.getParameter("id"));

		boolean result = propertyService.rejectProperty(propertyId);

		if (result) {
			response.sendRedirect("property?action=pending&success=rejected");
		} else {
			response.sendRedirect("property?action=pending&error=rejectFailed");
		}
	}

	private void searchProperties(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String location = request.getParameter("location");
		String type = request.getParameter("type");
		String priceValue = request.getParameter("maxPrice");

		if (location == null) {
			location = "";
		}

		if (type == null) {
			type = "";
		}

		double maxPrice = 999999999;

		if (priceValue != null && !priceValue.equals("")) {
			maxPrice = Double.parseDouble(priceValue);
		}

		List<Property> properties = propertyService.searchProperties(location, type, maxPrice);

		request.setAttribute("properties", properties);
		request.getRequestDispatcher("/WEB-INF/pages/public/property-list.jsp").forward(request, response);
	}
}