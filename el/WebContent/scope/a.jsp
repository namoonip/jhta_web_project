<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%	pageContext.setAttribute("p", "페이지스코프의 값입니다.");
	request.setAttribute("r", "페이지스코프의 값입니다.");
	session.setAttribute("s", "페이지스코프의 값입니다.");
	application.setAttribute("a", "페이지스코프의 값입니다.");
	
	// 1. 페이지 이동 redirect
	//response.sendRedirect("b.jsp");
	
	// 2. 페이지 이동 forward
	RequestDispatcher rd = request.getRequestDispatcher("b.jsp");	
	rd.forward(request, response);
%>