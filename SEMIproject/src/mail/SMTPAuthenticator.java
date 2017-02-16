package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
	
	// 이부분은 보고도 못본척 해주세요
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("was0413","dmd3dl12");
	}
}
