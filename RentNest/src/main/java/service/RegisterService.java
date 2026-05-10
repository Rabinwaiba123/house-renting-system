package service;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

public class RegisterService {

	private UserDAO userDAO = new UserDAO();

	public String registerUser(User user, String confirmPassword) {

		if (user.getFullName() == null || user.getFullName().trim().isEmpty() || user.getEmail() == null
				|| user.getEmail().isEmpty() || user.getPhone() == null || user.getPhone().isEmpty()
				|| user.getPhone() == null || user.getPhone().isEmpty() || user.getPhone() == null
				|| user.getPhone().isEmpty() || user.getPassword() == null || user.getPassword().isEmpty()) {
			return "Please Fill out all the text boxes.";
		}

		if (!user.getPassword().equals(confirmPassword)) {
			return "Password and confirm password do not match.";
		}

		if (userDAO.emailExists(user.getEmail())) {
			return "Email already exists.";
		}

		if (userDAO.phoneExists(user.getPhone())) {
			return "Phone number already exists.";
		}

		user.setPassword(PasswordUtil.getHashPassword(user.getPassword()));

		if ("admin".equalsIgnoreCase(user.getRole())) {
			user.setStatus(true);
		} else {
			user.setStatus(false);
		}

		user.setDeleted(false);

		int status = userDAO.register(user);

		if (status > 0) {
			return "success";
		}

		return "Registration failed.";
	}
}