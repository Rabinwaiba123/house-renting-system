package com.RentNest.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {

	public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {

		Cookie cookie = new Cookie(name, value);

		cookie.setMaxAge(maxAge);

		cookie.setPath("/");

		response.addCookie(cookie);
	}

	public static void deleteCookie(HttpServletResponse response, String name) {

		Cookie cookie = new Cookie(name, "");

		cookie.setMaxAge(0);

		cookie.setPath("/");

		response.addCookie(cookie);
	}
}