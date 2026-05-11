package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Contact;
import com.RentNest.util.DBConnection;

public class ContactDAO {

	// Save contact message
	public int addContact(Contact contact) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "INSERT INTO contacts(full_name, email, subject, message) " + "VALUES (?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, contact.getFullName());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getSubject());
			ps.setString(4, contact.getMessage());
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	// Get all contact messages
	public List<Contact> getAllContacts() {
		List<Contact> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM contacts";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Contact c = new Contact();
				c.setContactId(rs.getInt("contact_id"));
				c.setFullName(rs.getString("full_name"));
				c.setEmail(rs.getString("email"));
				c.setSubject(rs.getString("subject"));
				c.setMessage(rs.getString("message"));
				list.add(c);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// Get single contact by id
	public Contact getContactById(int contactId) {
		Contact c = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM contacts WHERE contact_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, contactId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				c = new Contact();
				c.setContactId(rs.getInt("contact_id"));
				c.setFullName(rs.getString("full_name"));
				c.setEmail(rs.getString("email"));
				c.setSubject(rs.getString("subject"));
				c.setMessage(rs.getString("message"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return c;
	}

	// Delete contact message
	public int deleteContact(int contactId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "DELETE FROM contacts WHERE contact_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, contactId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}