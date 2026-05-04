package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.SessionUtil;

@WebFilter({ "/admin/*", "/owner/*", "/tenant/*" })
public class AuthFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		Object user = SessionUtil.getAttribute(req, "user");

		if (user == null) {
			res.sendRedirect(req.getContextPath() + "/login?error=loginRequired");
			return;
		}

		chain.doFilter(request, response);
	}

	public void destroy() {
	}
}