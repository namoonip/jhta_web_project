package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.Controller;

public class FormController implements Controller{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "forward:form.jsp";
	}
}
