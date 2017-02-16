package util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import mail.SMTPAuthenticator;

public class MailSend {
	
	public void sendmailForHtml(String title, String target, String content) {
		
		// 꼭 인증정보와 동일한 계정 사용할것.
		// http://godlvkhj.tistory.com/125
		String from = "was0413@naver.com";
		
		// Java.Util에있는 프로퍼티 사용
		Properties properties = new Properties();
		
		//네이버 SMTP 정보 입력
		properties.put("mail.smtp.host","smtp.naver.com");
		
		//네이버 SMTP 추가 정보 입력
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		
		try {
			
			// 인증정보 생성
			Authenticator auth = new SMTPAuthenticator();
			
			// 메일세션에 인증정보와 프로퍼티 태우기
			Session mailSession = Session.getInstance(properties,auth);
			
			mailSession.setDebug(true);
			
			// 새로운 MimeMessage를 만듦
			Message message = new MimeMessage(mailSession);
			
			// Set From
			message.setFrom(new InternetAddress(from));
			
			// Set To
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(target));
			
			// Set 제목
			message.setSubject(title);
			
			// Set 내용
			message.setContent(content, "text/html;charset=utf-8");
			
			// send Message
			Transport.send(message);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void sendmail(String title,String target,String content) {
		
		// 꼭 인증정보와 동일한 계정 사용할것.
		// http://godlvkhj.tistory.com/125
		String from = "was0413@naver.com";
		
		// Java.Util에있는 프로퍼티 사용
		Properties properties = new Properties();
		
		//네이버 SMTP 정보 입력
		properties.put("mail.smtp.host","smtp.naver.com");
		
		//네이버 SMTP 추가 정보 입력
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			
			// 인증정보 생성
			Authenticator auth = new SMTPAuthenticator();
			
			// 메일세션에 인증정보와 프로퍼티 태우기
			Session mailSession = Session.getInstance(properties,auth);
			
			mailSession.setDebug(true);
			
			// 새로운 MimeMessage를 만듦
			Message message = new MimeMessage(mailSession);
			
			// Set From
			message.setFrom(new InternetAddress(from));
			
			// Set To
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(target));
			
			// Set 제목
			message.setSubject(title);
			
			// Set 내용
			message.setContent(content, "text/html;charset=utf-8");
			
			// send Message
			Transport.send(message);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
