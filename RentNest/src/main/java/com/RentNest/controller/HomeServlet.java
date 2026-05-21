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

@WebServlet(asyncSupported = true, urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PropertyService propertyService = new PropertyService();

		List<Property> latestProperties = propertyService.getLatestProperties();
		request.setAttribute("latestProperties", latestProperties);

		request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);

	}
}


