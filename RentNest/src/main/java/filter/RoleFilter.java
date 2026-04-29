package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter({ "/admin/*", "/owner/*", "/user/*" })
public class RoleFilter implements Filter {

	public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession(false);
		String role = (String) session.getAttribute("role");
		String path = req.getRequestURI();

		if (path.contains("/admin/") && !role.equalsIgnoreCase("ADMIN")) {
			res.sendRedirect(req.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		if (path.contains("/owner/") && !role.equalsIgnoreCase("OWNER")) {
			res.sendRedirect(req.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		if (path.contains("/user/") && !role.equalsIgnoreCase("USER")) {
			res.sendRedirect(req.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		chain.doFilter(request, response);
	}
}