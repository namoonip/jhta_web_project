<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<%
	String no = request.getParameter("no");
	String rno = request.getParameter("rno"); 
	String pwd = request.getParameter("pwd");

	BlogDAO dao = new BlogDAO();
	dao.deleteReviewByNo(Integer.parseInt(rno));
	
	response.sendRedirect("blogdetail.jsp?no="+no+"&pwd="+pwd);
%>