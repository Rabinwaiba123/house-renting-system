package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.SessionUtil;

@WebFilter({ "/admin/*", "/owner/*", "/tenant/*" })
public class RoleFilter implements Filter {

	public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String role = (String) SessionUtil.getAttribute(req, "role");
		String path = req.getRequestURI();

		if (role == null) {
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		if (path.contains("/admin/") && !role.equalsIgnoreCase("admin")) {
			res.sendRedirect(req.getContextPath() + "/access-denied");
			return;
		}

		if (path.contains("/owner/") && !role.equalsIgnoreCase("owner")) {
			res.sendRedirect(req.getContextPath() + "/access-denied");
			return;
		}

		if (path.contains("/tenant/") && !role.equalsIgnoreCase("tenant")) {
			res.sendRedirect(req.getContextPath() + "/access-denied");
			return;
		}

		chain.doFilter(request, response);
	}
}