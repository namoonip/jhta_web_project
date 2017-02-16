<%@page import="util.MailSend"%>
<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
 
<%
	request.setCharacterEncoding("utf-8");
	
	String mailTitle = request.getParameter("mailTitle");
	String mailTarget = request.getParameter("mailTarget");
	String mailContents = request.getParameter("mailContents");
	
	MailSend mailsend = new MailSend();
	mailsend.sendmail(mailTitle,mailTarget,mailContents);
	
	response.sendRedirect("/admin/adminBoardManagement.jsp");
%>


