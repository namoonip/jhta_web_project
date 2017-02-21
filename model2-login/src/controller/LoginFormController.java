package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model2.Controller;

public class LoginFormController implements Controller{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "forward:loginform.jsp";
	}
}
