package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.RentNest.model.Property;
import com.RentNest.service.PropertyService;
import com.RentNest.util.ImageUtil;

/**
 * Servlet implementation class EditPropertyServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/edit-property" })
@MultipartConfig
public class EditPropertyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PropertyService propertyService = new PropertyService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPropertyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Property property = propertyService.getPropertyById(id);

		request.setAttribute("property", property);
		request.getRequestDispatcher("/WEB-INF/pages/admin/edit-property.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("propertyId"));

			Property oldProperty = propertyService.getPropertyById(id);

			Property property = new Property();
			property.setPropertyId(id);
			property.setTitle(request.getParameter("title"));
			property.setType(request.getParameter("type"));
			property.setLocation(request.getParameter("location"));
			property.setPrice(Double.parseDouble(request.getParameter("price")));
			property.setRooms(Integer.parseInt(request.getParameter("rooms")));
			property.setBathrooms(Integer.parseInt(request.getParameter("bathrooms")));
			property.setAreaSqft(Integer.parseInt(request.getParameter("areaSqft")));
			property.setDescription(request.getParameter("description"));
			property.setAvailability(Boolean.parseBoolean(request.getParameter("availability")));
			property.setStatus(Boolean.parseBoolean(request.getParameter("status")));

			Part imagePart = request.getPart("image");
			String imagePath = ImageUtil.uploadImage(imagePart, getServletContext(), "uploads/properties");

			if (imagePath == null) {
				property.setImage(oldProperty.getImage());
			} else {
				property.setImage(imagePath);
			}

			propertyService.updateProperty(property);

			response.sendRedirect(request.getContextPath() + "/admin/manage-properties");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Property update failed.");
			request.getRequestDispatcher("/WEB-INF/pages/admin/edit-property.jsp").forward(request, response);
		}
	}

}
