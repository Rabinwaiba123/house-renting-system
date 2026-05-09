package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.User;
import util.SessionUtil;

@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String contextPath = req.getContextPath();
		String path = req.getRequestURI().substring(contextPath.length());

		// Allow static files
		if (path.startsWith("/css/") || path.startsWith("/js/") || path.startsWith("/images/")
				|| path.startsWith("/uploads/")) {
			chain.doFilter(request, response);
			return;
		}

		// Allow public pages
		boolean publicPage = path.equals("/") || path.equals("/home") || path.equals("/login")
				|| path.equals("/register") || path.equals("/about") || path.equals("/contact")
				|| path.equals("/property-list") || path.startsWith("/property-detail") || path.startsWith("/error/");

		User user = (User) SessionUtil.getAttribute(req, "user");

		// If not logged in
		if (user == null) {
			if (publicPage) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(contextPath + "/login");
			}
			return;
		}

		String role = user.getRole();

		// Logged in user should not go login/register again
		if (path.equals("/login") || path.equals("/register")) {
			if ("admin".equalsIgnoreCase(role)) {
				res.sendRedirect(contextPath + "/admin/dashboard");
			} else {
				res.sendRedirect(contextPath + "/home");
			}
			return;
		}

		// Only admin can access /admin pages
		if (path.startsWith("/admin") && !"admin".equalsIgnoreCase(role)) {
			res.sendRedirect(contextPath + "/error/access-denied.jsp");
			return;
		}

		chain.doFilter(request, response);
	}
}