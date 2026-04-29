package controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import service.RegisterService;

@WebServlet("/register")
@MultipartConfig
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RegisterService registerService = new RegisterService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String role = request.getParameter("role");

		String imagePath = null;

		Part imagePart = request.getPart("image");

		if (imagePart != null && imagePart.getSize() > 0) {

			String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

			String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

			File uploadFolder = new File(uploadPath);

			if (!uploadFolder.exists()) {
				uploadFolder.mkdir();
			}

			imagePart.write(uploadPath + File.separator + fileName);

			imagePath = "uploads/" + fileName;
		}

		String result = registerService.registerUser(fullName, email, phone, password, confirmPassword, role,
				imagePath);

		if (result.equals("success")) {
			response.sendRedirect(request.getContextPath() + "/login?success=registered");
		} else {
			request.setAttribute("errorMessage", result);
			request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
		}
	}
}