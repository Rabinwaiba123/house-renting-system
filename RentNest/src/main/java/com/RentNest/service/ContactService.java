package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.ContactDAO;
import com.RentNest.model.Contact;

public class ContactService {
	private ContactDAO contactDAO = new ContactDAO();

	public String addContact(Contact contact) {

		if (contact.getFullName() == null || contact.getFullName().trim().isEmpty() || contact.getEmail() == null
				|| contact.getEmail().isEmpty() || contact.getMessage() == null || contact.getMessage().isEmpty()) {
			return "Please Fill out all the text boxes.";
		}

		int status = contactDAO.addContact(contact);

		if (status > 0) {
			return "success";
		}

		return "Send failed.";
	}

	public List<Contact> getAllContacts() {
		return contactDAO.getAllContacts();
	}

	public boolean deleteContact(int contactId) {
		return contactDAO.deleteContact(contactId) > 0;
	}
}
