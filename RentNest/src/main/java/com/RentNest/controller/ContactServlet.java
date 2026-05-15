package com.RentNest.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.RentNest.model.Contact;
import com.RentNest.service.ContactService;

/**
 * Servlet implementation class ContactController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/contact" })
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContactServlet() {
		super();
	}

	private ContactService contactService = new ContactService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/public/contact.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		Contact contact = new Contact();
		contact.setFullName(fullName);
		contact.setEmail(email);
		contact.setSubject(subject);
		contact.setMessage(message);

		String result = contactService.addContact(contact);

		if (result.equals("success")) {
			request.setAttribute("successMessage", "Message sent successfully.");
		} else {
			request.setAttribute("errorMessage", result);
		}

		request.getRequestDispatcher("/WEB-INF/pages/public/contact.jsp").forward(request, response);
	}
}
