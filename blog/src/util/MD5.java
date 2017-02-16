package util;

import java.security.MessageDigest;

public class MD5 {
	
	public static String hash(String text) throws Exception {
		
		// 텍스트를 MD5암호와 알고리즘을 사용해 암호화한다.
		MessageDigest md = MessageDigest.getInstance("MD5");
		// Byte[]로 암호를 받는다.
		md.update(text.getBytes());
		byte[] byteData = md.digest();
				
		// byte데이터를 16진수 문자열로 변환하기
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1)); 
		}
		
		return sb.toString();
	}
	
}

