<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");

	HttpSession session = request.getSession(false);
	if(session==null) {
		response.sendRedirect("http://localhost/member/view/loginForm.jsp");
		return;
	}

	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	if(user==null) {
		response.sendRedirect("http://localhost/member/view/loginForm.jsp");
		return;
	}
%>