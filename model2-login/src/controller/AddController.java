package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.User;

import dao.UserDao;
import model2.Controller;
import vo.UserVO;

public class AddController implements Controller{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		user.setName(name);
		user.setPhone(phone);
		user.setAddr(addr);
		user.setPoint(0);
		
		UserDao userDao = new UserDao();
		userDao.addNewUser(user);
		
		return "redirect:home.hta";
	}
}
