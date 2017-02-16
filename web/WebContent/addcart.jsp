<%@page import="dao.ItemDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	HttpSession session = request.getSession(false);
	if (session == null) {
		response.sendRedirect("logindform.jsp?err=deny");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if (user == null) {
		response.sendRedirect("loginedform.jsp?err=deny");
		return;
	}
	
	// user가 null이 아닌 상황
	String userId = user.getId();
	int ino = Integer.parseInt(request.getParameter("ino"));
	
	ItemDAO dao = new ItemDAO();
	dao.addcart(ino, userId);
	
	// 장바구니 리스트 목록 페이지를 다시 요청하기
	response.sendRedirect("cart.jsp");
	
%>