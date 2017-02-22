package util;

import javax.servlet.http.Cookie;

public class CookieUtil {

	public static String getValue(Cookie[] cookies, String name) {
		if(cookies == null) {
			return "";
		}
		
		String value = "";
		for(Cookie cookie : cookies) {
			if(name.equals(cookie.getName())) {
				value = cookie.getValue();
			}
		}
		return value;
	}
	
}