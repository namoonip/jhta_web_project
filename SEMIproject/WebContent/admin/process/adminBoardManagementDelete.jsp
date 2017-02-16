<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
 
<%
	request.setCharacterEncoding("utf-8");

	int BoardDelNo = Integer.parseInt(request.getParameter("BoardDelNo"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	
	AdminOnlyDAO adminDAO = new AdminOnlyDAO();
	adminDAO.boardDelete(BoardDelNo);
	  
	response.sendRedirect("/admin/adminBoardManagement.jsp?pno="+pno);
%>
