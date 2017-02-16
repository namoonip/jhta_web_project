<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");

	HttpSession session = request.getSession(false);
	
	if (session == null) {
		response.sendRedirect("main.jsp?err=deny");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGIN_USER");
	if(user == null) {
		response.sendRedirect("main.jsp?err=deny");
		return;
	}
%>