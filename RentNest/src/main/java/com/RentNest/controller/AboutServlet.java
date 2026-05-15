package com.RentNest.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AboutController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/about"})
public class AboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AboutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/public/about.jsp").forward(request, response);
	}

}
