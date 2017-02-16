package util;

public class NumberUtil {
	
	public static int StringToInt(String str, int defaultValue) {
		if (str == null) {
			return defaultValue;			
		}
		
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultValue;
		}		
	}
	
}
