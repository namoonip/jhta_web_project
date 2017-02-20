package ex;

import java.util.ArrayList;
import java.util.Scanner;

public class SameWordCheck {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		for(;;) {
			boolean isSame = false;
			
			System.out.println("단어 입력");
			System.out.print(">");
			String words = sc.nextLine();
			ArrayList<String> strList = new ArrayList<>();
			
			if("0".equals(words)) {
				System.out.println("프로그램 종료");
				sc.close();
				break;
			}
			
			for(int i=0; i<words.length(); i++) {
				strList.add(String.valueOf(words.charAt(i)));
			}
			
			int trueCount = 0;
			for(int index=0; index<=((int) (strList.size()/2)); index++) {
				
				if(strList.get(index).equals(strList.get(strList.size()-1-index))) {
					trueCount++;
				}
			}
			if(trueCount == strList.size()/2+1) {
				isSame = true;
			}
			
			System.out.println("앞뒤가 같은 단어 인가?" + isSame);
		}
	}
}
