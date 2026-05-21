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

		if (!knownPage) {
			chain.doFilter(request, response);
			return;
		}

		if (user == null) {
			if (publicPage) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(contextPath + "/login");
			}
			return;
		}

		String role = user.getRole();
		if (path.equals("/login") || path.equals("/register")) {
			if ("admin".equalsIgnoreCase(role)) {
				res.sendRedirect(contextPath + "/admin/dashboard");
			} else {
				res.sendRedirect(contextPath + "/home");
			}
			return;
		}

		if ("admin".equalsIgnoreCase(role)) {
			if (!adminPage && !path.equals("/logout")) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}

		if (!"admin".equalsIgnoreCase(role) && adminPage) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		chain.doFilter(request, response);
	}
}