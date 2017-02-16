<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="common/logincheck.jsp" %>
<%
	String no = request.getParameter("no");
	String idCheck = request.getParameter("check");
	BlogDAO dao = new BlogDAO();
	
	String loginedId = user.getId();
	if(loginedId.equals(idCheck)) {
		dao.deleteBlogByNo(Integer.parseInt(no));			
		response.sendRedirect("bloglist.jsp");
		return;
	} else {
		response.sendRedirect("bloglist.jsp?err=fail&failNum="+no);
		return;
	}
	
%>