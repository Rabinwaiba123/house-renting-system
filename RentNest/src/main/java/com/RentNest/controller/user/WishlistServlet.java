package com.RentNest.controller.user;

import java.io.IOException;
import java.util.List;

import com.RentNest.dao.WishlistDAO;
import com.RentNest.model.User;
import com.RentNest.model.Wishlist;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/user/wishlist" })
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WishlistDAO wishlistDAO = new WishlistDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		List<Wishlist> wishlist = wishlistDAO.getWishlistByUserId(user.getUserId());
		request.setAttribute("wishlist", wishlist);

		request.getRequestDispatcher("/WEB-INF/pages/tenant/wishlist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		String action = request.getParameter("action");

		try {
			if ("add".equals(action)) {
				int propertyId = Integer.parseInt(request.getParameter("propertyId"));

				if (wishlistDAO.wishlistExists(user.getUserId(), propertyId)) {
					request.getSession().setAttribute("error", "This property is already in your wishlist.");
				} else {
					Wishlist wishlist = new Wishlist();
					wishlist.setUserId(user.getUserId());
					wishlist.setPropertyId(propertyId);

					wishlistDAO.addWishlist(wishlist);
					request.getSession().setAttribute("success", "Property added to wishlist.");
				}

				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			if ("delete".equals(action)) {
				int wishlistId = Integer.parseInt(request.getParameter("wishlistId"));
				wishlistDAO.deleteWishlist(wishlistId);

				request.getSession().setAttribute("success", "Property removed from wishlist.");
				response.sendRedirect(request.getContextPath() + "/user/wishlist");
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Something went wrong.");
		}

		response.sendRedirect(request.getContextPath() + "/user/wishlist");
	}
}