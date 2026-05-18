package com.RentNest.filter;

import java.io.IOException;

import com.RentNest.model.User;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String contextPath = req.getContextPath();
		String path = req.getRequestURI().substring(contextPath.length());

		/* Allow static files */
		if (path.startsWith("/css/") || path.startsWith("/js/") || path.startsWith("/images/")
				|| path.startsWith("/uploads/")) {
			chain.doFilter(request, response);
			return;
		}

		User user = (User) SessionUtil.getAttribute(req, "user");

		boolean publicPage = path.equals("/") || path.equals("/home") || path.equals("/login")
				|| path.equals("/register") || path.equals("/about") || path.equals("/contact")
				|| path.equals("/property-list") || path.startsWith("/property-detail") || path.equals("/logout");

		boolean adminPage = path.startsWith("/admin");

		boolean tenantPage = path.startsWith("/user/") || path.equals("/booking") || path.equals("/review");

		boolean knownPage = publicPage || adminPage || tenantPage;

		/*
		 * Wrong URL should show 404. Do not redirect unknown URLs to login.
		 */
		if (!knownPage) {
			chain.doFilter(request, response);
			return;
		}

		/*
		 * User not logged in: public pages are allowed. protected pages go to login.
		 */
		if (user == null) {
			if (publicPage) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(contextPath + "/login");
			}
			return;
		}

		String role = user.getRole();

		/*
		 * Logged-in user should not open login/register again.
		 */
		if (path.equals("/login") || path.equals("/register")) {
			if ("admin".equalsIgnoreCase(role)) {
				res.sendRedirect(contextPath + "/admin/dashboard");
			} else {
				res.sendRedirect(contextPath + "/home");
			}
			return;
		}

		/*
		 * Admin should only access admin pages and logout. If admin opens /home,
		 * /property-list, /wishlist, etc. show access denied.
		 */
		if ("admin".equalsIgnoreCase(role)) {
			if (!adminPage && !path.equals("/logout")) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}

		/*
		 * Tenant/user should not access admin pages.
		 */
		if (!"admin".equalsIgnoreCase(role) && adminPage) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		chain.doFilter(request, response);
	}
}