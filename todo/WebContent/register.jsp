<%@page import="dao.TodoDAO"%>
<%@page import="vo.TodoVO"%>
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
	if (user == null) {
		response.sendRedirect("main.jsp?err=deny");
		return;		
	}
	
	// 아래는 세션 객체도 있고, 로그인된 사용자 정보도 있는 경우
	String category = request.getParameter("category");
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String day = request.getParameter("day");
	String location = request.getParameter("loaction");
	
	TodoVO todo = new TodoVO();
	todo.setCategory(request.getParameter("category"));
	todo.setTitle(request.getParameter("title"));
	todo.setDescription(request.getParameter("description"));
	todo.setLocation(request.getParameter("location"));
	todo.setDay(request.getParameter("day"));
	todo.setUserId(user.getId());
	
	TodoDAO dao = new TodoDAO();
	dao.addTodo(todo);
	
	response.sendRedirect("list.jsp?pno=1");
	
%>