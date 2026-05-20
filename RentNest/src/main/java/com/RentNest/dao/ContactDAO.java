package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Contact;
import com.RentNest.util.DBConnection;

/**
 * ContactDAO ---------- Responsibilities: - Handles database operations for
 * contact form messages. - Saves messages submitted by users or visitors. -
 * Retrieves all contact messages for the admin panel. - Allows admin to delete
 * contact records after review.
 *
 * Important concepts used: - JDBC database connection - PreparedStatement for
 * safe SQL execution - DAO layer for separating database logic from controller
 * logic
 */
public class ContactDAO {

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