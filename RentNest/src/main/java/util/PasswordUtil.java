package util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

	private static final int COST = 10;

	public static String getHashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt(COST));
	}

	public static boolean checkPassword(String inputPassword, String storedHashPassword) {
		return BCrypt.checkpw(inputPassword, storedHashPassword);
	}
}