package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.SessionUtil;

@WebFilter("/*")
public class AuthFilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String LOGOUT = "/logout";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();

		String path = uri.substring(contextPath.length());

		// Allow static resources
		if (path.startsWith("/css/") || path.startsWith("/js/") || path.startsWith("/images/") || path.endsWith(".css")
				|| path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")) {

			chain.doFilter(request, response);
			return;
		}

		// Public pages
		boolean isPublicPage = path.equals("/") || path.equals(LOGIN) || path.equals(REGISTER)
				|| path.equals(LOGOUT) || path.equals("/about") || path.equals("/contact")
				|| path.equals("/property-list") || path.startsWith("/property-detail");

		// Check session
		Object user = SessionUtil.getAttribute(req, "user");

		boolean isLoggedIn = (user != null);

		// Not logged in
		if (!isLoggedIn) {

			if (isPublicPage) {

				chain.doFilter(request, response);

			} else {

				res.sendRedirect(contextPath + LOGIN);
			}

		} else {

			// Logged in
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {

	}
}