package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.RentNest.service.ContactService;

/**
 * Servlet implementation class ContactsController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/contacts" })
public class ContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContactsServlet() {
		super();
	}

	private ContactService contactService = new ContactService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("contacts", contactService.getAllContacts());

		request.getRequestDispatcher("/WEB-INF/pages/admin/contacts.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("delete".equals(action)) {
			int contactId = Integer.parseInt(request.getParameter("contactId"));
			contactService.deleteContact(contactId);
		}

		response.sendRedirect(request.getContextPath() + "/admin/contacts");
	}
}
