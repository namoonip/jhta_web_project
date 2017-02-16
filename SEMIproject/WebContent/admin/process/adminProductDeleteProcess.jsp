<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>

<%
	request.setCharacterEncoding("utf-8");	

	int productNO = Integer.parseInt(request.getParameter("productNO"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	
	AdminOnlyDAO adminDAO = new AdminOnlyDAO();
	adminDAO.productDelete(productNO);
	 
	response.sendRedirect("/admin/adminIndex.jsp?pno="+pno);
%>
