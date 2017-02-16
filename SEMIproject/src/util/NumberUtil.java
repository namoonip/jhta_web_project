package util;

public class NumberUtil {

	public static int StringToInt(String str, int defaultvalue) {
		if (str == null) {
			return defaultvalue;
		}
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultvalue;
		}
	}
}
