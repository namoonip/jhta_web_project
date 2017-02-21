package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model2.Controller;
import vo.UserVO;

public class LoginController implements Controller{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		UserDao userDao = new UserDao();
		UserVO user = userDao.getUserById(userid);
		
		if(user == null) {
			return "redirect:loginform.hta?err=fail";
		}
		if(!user.getPwd().equals(userpwd)) {			
			return "redirect:loginform.hta?err=fail";
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute("LOGINED_USER", user);
		
		// 로그인 상태로 컬럼의 값 변경하기.
		userDao.changUserStateY(userid);		
		
		return "redirect:home.hta";
	}
}