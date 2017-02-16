<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
 
 <%
	request.setCharacterEncoding("utf-8");
 	
	int buyNo = Integer.parseInt(request.getParameter("buyno"));
	
	AdminOnlyDAO adminDAO = new AdminOnlyDAO();
	adminDAO.deliveryOK(buyNo);
	
	response.sendRedirect("/admin/adminPurchaseList.jsp");
%>
  