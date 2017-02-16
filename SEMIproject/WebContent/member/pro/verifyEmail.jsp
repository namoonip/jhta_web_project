<%@page import="dao.MemberDAO"%>
<%@page import="util.MailSend"%>
<%@page import="util.MD5"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

 <%
	request.setCharacterEncoding("utf-8");
 
 	String code = request.getParameter("code");
 	
 	MemberDAO dao = new MemberDAO();
 	dao.verifyEmail(code);
 	
 	
 	response.sendRedirect("/member/view/verifyEmailSuccess.jsp");
 %>