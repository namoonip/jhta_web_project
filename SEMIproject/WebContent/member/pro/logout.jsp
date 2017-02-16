<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession(false);

	if (session != null) {
		session.invalidate();
	}
	// 저장소에 변경을 가하면 redirect
	response.sendRedirect("/main.jsp");
%>