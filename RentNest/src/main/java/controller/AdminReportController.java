package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AdminReportController
 */
@WebServlet("/admin/report")
public class AdminReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminReportController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/admin/admin-reports.jsp").forward(request, response);
	}

}
