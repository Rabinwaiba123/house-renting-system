package com.RentNest.controller.user;

import java.io.IOException;

import com.RentNest.model.User;
import com.RentNest.service.UserService;
import com.RentNest.util.ImageUtil;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(asyncSupported = true, urlPatterns = { "/user/profile" })
@MultipartConfig
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User sessionUser = (User) SessionUtil.getAttribute(request, "user");

		if (sessionUser == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		User user = userService.getUserById(sessionUser.getUserId());

		if (user == null) {
			SessionUtil.invalidate(request);
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		SessionUtil.setAttribute(request, "user", user);

		Object success = SessionUtil.getAttribute(request, "success");
		Object error = SessionUtil.getAttribute(request, "error");
		if (success != null) {
			request.setAttribute("success", success);
			request.getSession().removeAttribute("success");
		}
		if (error != null) {
			request.setAttribute("error", error);
			request.getSession().removeAttribute("error");
		}

		request.setAttribute("user", user);
		request.setAttribute("bookingCount", userService.getBookingCount(user.getUserId()));
		request.setAttribute("wishlistCount", userService.getWishlistCount(user.getUserId()));

		request.getRequestDispatcher("/WEB-INF/pages/tenant/my-profile.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User sessionUser = (User) SessionUtil.getAttribute(request, "user");

		if (sessionUser == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("password");

		User currentUser = userService.getUserById(sessionUser.getUserId());
		if (currentUser == null) {
			SessionUtil.invalidate(request);
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		String validationMessage = userService.validateProfile(fullName, phone, password);
		if (validationMessage != null) {
			request.setAttribute("error", validationMessage);
			request.setAttribute("user", currentUser);
			request.setAttribute("bookingCount", userService.getBookingCount(currentUser.getUserId()));
			request.setAttribute("wishlistCount", userService.getWishlistCount(currentUser.getUserId()));
			request.getRequestDispatcher("/WEB-INF/pages/tenant/my-profile.jsp").forward(request, response);
			return;
		}

		Part imagePart = request.getPart("image");
		String imagePath = ImageUtil.uploadImage(imagePart, getServletContext(), "uploads/users");

		if (imagePath == null) {
			imagePath = currentUser.getImage();
		}

		User user = new User();
		user.setUserId(currentUser.getUserId());
		user.setFullName(fullName);
		user.setPhone(phone);
		user.setAddress(address);
		user.setImage(imagePath);
		user.setPassword(password);

		int status = userService.updateProfile(user);

		if (status > 0) {
			User updatedUser = userService.getUserById(currentUser.getUserId());
			SessionUtil.setAttribute(request, "user", updatedUser);
			request.getSession().setAttribute("success", "Profile updated successfully.");
		} else {
			request.getSession().setAttribute("error", "Failed to update profile.");
		}

		response.sendRedirect(request.getContextPath() + "/user/profile");
	}
}
