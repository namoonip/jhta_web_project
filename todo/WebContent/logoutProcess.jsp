<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession();
	session.invalidate();
	response.sendRedirect("main.jsp");
%>