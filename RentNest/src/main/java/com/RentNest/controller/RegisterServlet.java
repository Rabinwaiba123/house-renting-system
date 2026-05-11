package com.RentNest.controller;

import java.io.IOException;

import com.RentNest.model.User;
import com.RentNest.service.RegisterService;
import com.RentNest.util.ImageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RegisterService registerService = new RegisterService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/pages/auth/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String address = request.getParameter("address");
		String role = request.getParameter("role");

		Part imagePart = request.getPart("image");
		String imagePath = ImageUtil.uploadImage(imagePart, getServletContext(), "uploads");

		User user = new User();
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		user.setAddress(address);
		user.setImage(imagePath);
		user.setRole(role);

		String message = registerService.registerUser(user, confirmPassword);

		if (message.equals("success")) {
			response.sendRedirect(request.getContextPath() + "/login?success=registered");
		} else {
			request.setAttribute("errorMessage", message);
			request.getRequestDispatcher("/WEB-INF/pages/auth/register.jsp").forward(request, response);
		}
	}
}

