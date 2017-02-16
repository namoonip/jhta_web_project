<%@page import="vo.GalVO"%>
<%@page import="dao.GallDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	int fno = Integer.parseInt(request.getParameter("fno"));
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
	
	GallDAO dao = new GallDAO();
	dao.deleteFile(fno);
	
	response.sendRedirect("showGallery.jsp");
%>