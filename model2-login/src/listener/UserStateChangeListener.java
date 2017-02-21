package listener;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.UserDao;
import vo.UserVO;

public class UserStateChangeListener implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("sessionCreated ...........");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
		if(user != null) {
			UserDao userDao = new UserDao();
			try {userDao.changUserStateN(user.getId());} 
			catch (SQLException e) {e.printStackTrace();}
			System.out.println("sessionDestroyed ...........");
		}		
	}
}
