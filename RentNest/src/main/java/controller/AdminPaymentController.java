package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AdminPaymentController
 */
@WebServlet("/admin/payments")
public class AdminPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminPaymentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/admin/admin-payments.jsp").forward(request, response);
	}

}
