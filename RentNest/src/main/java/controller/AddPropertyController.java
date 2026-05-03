package controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Property;
import service.PropertyService;

@WebServlet("/add-property")
@MultipartConfig
public class AddPropertyController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		int ownerId = (int) session.getAttribute("userId");

		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String location = request.getParameter("location");
		double price = Double.parseDouble(request.getParameter("price"));
		int rooms = Integer.parseInt(request.getParameter("rooms"));
		String description = request.getParameter("description");

		Part imagePart = request.getPart("image");
		String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

		String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		imagePart.write(uploadPath + File.separator + fileName);

		Property property = new Property();
		property.setOwnerId(ownerId);
		property.setTitle(title);
		property.setType(type);
		property.setLocation(location);
		property.setPrice(price);
		property.setRooms(rooms);
		property.setDescription(description);
		property.setImage("uploads/" + fileName);

		boolean result = propertyService.addProperty(property);

		if (result) {
			request.setAttribute("success", "Property added successfully. Waiting for admin approval.");
		} else {
			request.setAttribute("error", "Failed to add property.");
		}

		request.getRequestDispatcher("/owner/owner-add-property.jsp").forward(request, response);
	}
}