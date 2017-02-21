package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model2.Controller;
import vo.UserVO;

public class LogoutController implements Controller{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
			
			// user가 null일 때 null Exception이 나므로 null 체크
			if(user != null) {
				UserDao userDao = new UserDao();
				userDao.changUserStateN(user.getId());
			}
			session.invalidate();
		}		
		return "redirect:home.hta";
	}
}
