package com.RentNest.controller.user;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.User;
import com.RentNest.model.Wishlist;
import com.RentNest.service.WishlistService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/user/wishlist" })
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WishlistService wishlistService = new WishlistService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		List<Wishlist> wishlist = wishlistService.getWishlistByUserId(user.getUserId());

		request.setAttribute("wishlist", wishlist);
		request.getRequestDispatcher("/WEB-INF/pages/user/wishlist.jsp").forward(request, response);
	}

	/*
	 * Handles POST requests Supports add and delete operations for wishlist
	 */
	@Override
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

				if (wishlistService.wishlistExists(user.getUserId(), propertyId)) {
					request.getSession().setAttribute("error", "This property is already in your wishlist.");
				} else {
					Wishlist wishlist = new Wishlist();
					wishlist.setUserId(user.getUserId());
					wishlist.setPropertyId(propertyId);

					boolean result = wishlistService.addWishlist(wishlist);

					if (result) {
						request.getSession().setAttribute("success", "Property added to wishlist.");
					} else {
						request.getSession().setAttribute("error", "Failed to add property to wishlist.");
					}
				}

				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			if ("delete".equals(action)) {
				int wishlistId = Integer.parseInt(request.getParameter("wishlistId"));

				boolean result = wishlistService.deleteWishlist(wishlistId);

				if (result) {
					request.getSession().setAttribute("success", "Property removed from wishlist.");
				} else {
					request.getSession().setAttribute("error", "Failed to remove property from wishlist.");
				}

				response.sendRedirect(request.getContextPath() + "/user/wishlist");
				return;
			}

			request.getSession().setAttribute("error", "Invalid wishlist action.");

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Something went wrong.");
		}

		response.sendRedirect(request.getContextPath() + "/user/wishlist");
	}
}