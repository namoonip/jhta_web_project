<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	int dno = Integer.parseInt(request.getParameter("dno"));
	CartDAO dao = new CartDAO();
	dao.deleteCart(dno);
	
	response.sendRedirect("http://localhost/cart.jsp");
	
%>