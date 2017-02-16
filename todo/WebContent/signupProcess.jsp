<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = MD5.hash(request.getParameter("pwd")); 
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	UserVO user = new UserVO();
	user.setId(id);
	user.setPwd(pwd);
	user.setName(name);
	user.setPhone(phone);
	user.setAddr(addr);
	
	UserDAO dao = new UserDAO();
	dao.addUser(user);
	
	response.sendRedirect("main.jsp");
%>