package ex;


import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import javafx.scene.control.Label;

public class SameWords {
	
	public class ConvertTest {
		
		@Test
		public void TestRebackCheck() {
			
			
			
		}
		
		public class StrReBackCheck {
			
			public boolean checkingStr(String str) {
				boolean isSame = false;
				ArrayList<String> strCheck = new ArrayList<>();
				
				for(int i=0; i<str.length(); i++) {
					strCheck.add(String.valueOf(str.charAt(i)));
				}
				
				return true;
			}
			
		}
	}
}
