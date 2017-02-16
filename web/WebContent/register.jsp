<%@page import="util.MD5"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	// 한글처리를 위한 인코딩
	request.setCharacterEncoding("UTF-8");
		
	UserDAO dao = new UserDAO();
	UserVO user = new UserVO();
	
	user.setId(request.getParameter("id"));
	
	// 비밀번호 암호화하기
	user.setPwd(MD5.hash(request.getParameter("pwd")));
	user.setName(request.getParameter("name"));
	user.setPhone(request.getParameter("phone"));
	user.setAddr(request.getParameter("addr"));
	dao.addUser(user);
	
	response.sendRedirect("main.jsp");
%>