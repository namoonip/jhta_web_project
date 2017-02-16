<%@page import="util.MD5"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
 <% 
 	request.setCharacterEncoding("utf-8");
 	String id = request.getParameter("id");
 	String pwd = request.getParameter("pwd");
 	
 	UserDAO dao = new UserDAO();
 	UserVO user = dao.getUserById(id);
 	
 	if (user == null) {
 		response.sendRedirect("main.jsp?err=fail");
 		return;
 	}
 	
 	String secuPwd = MD5.hash(pwd);
 	if (secuPwd.equals(user.getPwd())) {
 		HttpSession session = request.getSession(true);
 		session.setAttribute("LOGIN_USER", user);
 		response.sendRedirect("list.jsp?pno=1");
 		return;
 		
 	} else {
 		
 		response.sendRedirect("main.jsp?err=fail");
 		return;
 	}

 %>