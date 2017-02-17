package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model2.Controller;
import vo.UserVO;

public class ListController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListController의 Process가 실행되었습니다...");
		
		UserDao userDao = new UserDao();
		List<UserVO> userList = userDao.getAllUsers();
		
		request.setAttribute("users", userList);
		return "forward:list.jsp";
	}
}
