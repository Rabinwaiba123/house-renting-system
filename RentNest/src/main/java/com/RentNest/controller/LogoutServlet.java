package com.RentNest.controller;

import java.io.IOException;

import com.RentNest.util.CookieUtil;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true, urlPatterns = { "/logout"})
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LogoutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SessionUtil.invalidate(request);
		CookieUtil.deleteCookie(response, "rememberEmail");

		response.sendRedirect(request.getContextPath() + "/home");
	}
}