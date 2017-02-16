package app;

import org.junit.Assert;
import org.junit.Test;

public class ConvertTest {

	@Test
	public void testUpperCase() {
		TextConvert convert = new TextConvert();
		String result = convert.upper("ABC");
		
		Assert.assertEquals("abc", result);
		
	}
	
}
