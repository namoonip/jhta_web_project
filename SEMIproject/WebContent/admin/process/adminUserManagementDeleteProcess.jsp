<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
 
<%
	request.setCharacterEncoding("utf-8");

	int userNO = Integer.parseInt(request.getParameter("userNO"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	
	AdminOnlyDAO adminDAO = new AdminOnlyDAO();
	adminDAO.userDelete(userNO);
	 
	response.sendRedirect("/admin/adminUserManagement.jsp?pno="+pno);
%>