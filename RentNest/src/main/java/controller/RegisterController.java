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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if (name == null || name.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || phone == null || phone.trim().isEmpty()
                    || password == null || password.trim().isEmpty()
                    || role == null || role.trim().isEmpty()) {

                request.setAttribute("message", "All fields are required!");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }

            // Do not allow admin registration
            if (!role.equals("user") && !role.equals("owner")) {
                role = "user";
            }

            Part imagePart = request.getPart("image");
            String imagePath = "uploads/default.png";

            if (imagePart != null && imagePart.getSize() > 0) {

                String originalFileName = imagePart.getSubmittedFileName();
                String fileName = System.currentTimeMillis() + "_" + originalFileName;

                String uploadPath = getServletContext().getRealPath("") 
                        + File.separator + "uploads";

                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                imagePart.write(uploadPath + File.separator + fileName);

                imagePath = "uploads/" + fileName;
            }

            RegisterService service = new RegisterService();
            service.addUser(name, email, phone, password, role, imagePath);

            response.sendRedirect(request.getContextPath() + "/login?success=registered");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("message", "Registration failed. Email or phone may already exist.");
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
    }
}