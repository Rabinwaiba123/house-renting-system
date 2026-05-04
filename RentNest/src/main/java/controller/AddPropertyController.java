package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Property;
import model.User;
import service.PropertyService;
import util.ImageUtil;
import util.SessionUtil;

@WebServlet("/add-property")
@MultipartConfig
public class AddPropertyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/pages/owner/owner-add-property.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login?error=loginRequired");
			return;
		}

		if (!"owner".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/access-denied");
			return;
		}

		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String location = request.getParameter("location");
		double price = Double.parseDouble(request.getParameter("price"));
		int rooms = Integer.parseInt(request.getParameter("rooms"));
		String description = request.getParameter("description");

		Part imagePart = request.getPart("image");
		String imagePath = ImageUtil.uploadImage(imagePart, getServletContext(), "uploads");

		Property property = new Property();
		property.setOwnerId(user.getUserId());
		property.setTitle(title);
		property.setType(type);
		property.setLocation(location);
		property.setPrice(price);
		property.setRooms(rooms);
		property.setDescription(description);
		property.setImage(imagePath);

		boolean result = propertyService.addProperty(property);

		if (result) {
			request.setAttribute("success", "Property added successfully. Waiting for admin approval.");
		} else {
			request.setAttribute("error", "Failed to add property.");
		}

		request.getRequestDispatcher("/WEB-INF/pages/owner/owner-add-property.jsp").forward(request, response);
	}
}