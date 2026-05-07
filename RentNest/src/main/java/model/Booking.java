package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
	private int bookingId;
	private int userId;
	private int propertyId;
	private Date bookingDate;
	private Date moveInDate;
	private int durationMonths;
	private String message;
	private boolean status;
	private boolean isCancelled;
	private boolean isDeleted;
	private Timestamp createdAt;

	// Default Constructor
	public Booking() {
	}

	// Parameterized Constructor
	public Booking(int bookingId, int userId, int propertyId, Date bookingDate, Date moveInDate, int durationMonths,
			String message, boolean status, boolean isCancelled, boolean isDeleted, Timestamp createdAt) {

		this.bookingId = bookingId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.bookingDate = bookingDate;
		this.moveInDate = moveInDate;
		this.durationMonths = durationMonths;
		this.message = message;
		this.status = status;
		this.isCancelled = isCancelled;
		this.isDeleted = isDeleted;
		this.createdAt = createdAt;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getMoveInDate() {
		return moveInDate;
	}

	public void setMoveInDate(Date moveInDate) {
		this.moveInDate = moveInDate;
	}

	public int getDurationMonths() {
		return durationMonths;
	}

	public void setDurationMonths(int durationMonths) {
		this.durationMonths = durationMonths;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isCancelled() {
		return isCancelled;
	}

	public void setCancelled(boolean isCancelled) {
		this.isCancelled = isCancelled;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}