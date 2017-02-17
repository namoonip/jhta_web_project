package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.Controller;

public class HomeController implements Controller{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HomeController의 Process가 실행되었습니다...");
		
		request.setAttribute("msg", "홈페이지에 오신 것을 환영합니다.");
		return "forward:home.jsp";
	}
}
