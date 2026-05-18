package com.RentNest.controller;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.Property;
import com.RentNest.service.PropertyService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/property-list" })
public class PropertyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PropertyService propertyService = new PropertyService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String maxPrice = request.getParameter("maxPrice");

		List<Property> properties;

		boolean hasSearch = (keyword != null && !keyword.trim().isEmpty()) || (type != null && !type.trim().isEmpty())
				|| (maxPrice != null && !maxPrice.trim().isEmpty());

		if (hasSearch) {
			properties = propertyService.searchProperties(keyword, type, maxPrice);
		} else {
			properties = propertyService.getPublicProperties();
		}

		request.setAttribute("properties", properties);

		request.getRequestDispatcher("/WEB-INF/pages/public/property-list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}