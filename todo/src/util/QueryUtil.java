package util;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class QueryUtil {
	
	private static Properties prop;
	
	public static String getSql(String key) {
		
		try{
			if (prop == null) {
				prop = new Properties();	// prop가 null일 경우 읽어와 실행해라.
				prop.load(new FileReader("src/sample5/sql.properties"));
			}
		} 
		catch (IOException e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		String sql = prop.getProperty(key);
		return sql;		
	}
}
