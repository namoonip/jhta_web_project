package util;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class QueryUtil {

	private static Properties prop;

	public static String getSql(String key) {

		try {
			if (prop == null) {
				prop = new Properties();
				prop.load(new FileReader("src/horse/sql.properties"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		String sql = prop.getProperty(key);

		return sql;
	}
}