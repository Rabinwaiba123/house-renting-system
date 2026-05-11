package com.RentNest.controller.admin;

import java.io.IOException;

import com.RentNest.model.Property;
import com.RentNest.model.User;
import com.RentNest.service.PropertyService;
import com.RentNest.util.ImageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/add-property")
@MultipartConfig
public class AddPropertyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/pages/admin/add-property.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			User user = (User) request.getSession().getAttribute("user");

			if (user == null) {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}

			String title = request.getParameter("title");
			String type = request.getParameter("type");
			String location = request.getParameter("location");
			String description = request.getParameter("description");

			double price = Double.parseDouble(request.getParameter("price"));
			int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
			int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
			int areaSqft = Integer.parseInt(request.getParameter("areaSqft"));

			Part imagePart = request.getPart("image");
			String imagePath = ImageUtil.uploadImage(imagePart, getServletContext(), "uploads/properties");

			Property property = new Property();

			property.setTitle(title);
			property.setType(type);
			property.setLocation(location);
			property.setPrice(price);
			property.setBedrooms(bedrooms);
			property.setBathrooms(bathrooms);
			property.setAreaSqft(areaSqft);
			property.setDescription(description);
			property.setImage(imagePath);

			property.setAvailability(true);
			property.setStatus(false); // false = pending admin approval
			property.setDeleted(false);

			String error = propertyService.validateProperty(property);

			if (error != null) {
				request.setAttribute("errorMessage", error);
				request.setAttribute("property", property);
				request.getRequestDispatcher("/WEB-INF/pages/admin/add-property.jsp").forward(request, response);
				return;
			}

			boolean success = propertyService.addProperty(property);

			if (success) {
				request.setAttribute("successMessage", "Property added successfully. Please wait for admin approval.");
			} else {
				request.setAttribute("errorMessage", "Failed to add property.");
			}

			request.getRequestDispatcher("/WEB-INF/pages/admin/add-property.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Invalid input. Please check your form.");
			request.getRequestDispatcher("/WEB-INF/pages/admin/add-property.jsp").forward(request, response);
		}
	}
}