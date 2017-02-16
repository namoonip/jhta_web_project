<%@page import="vo.ReviewVO"%>
<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="common/logincheck.jsp" %>
<%		
	String contents = request.getParameter("contents");	
	String pwd = request.getParameter("pwd");

	BlogDAO dao = new BlogDAO();
	ReviewVO review = new ReviewVO();
	review.setBlogNo(Integer.parseInt(request.getParameter("bno")));
	review.setUserId(user.getId());
	review.setContents(contents);
	dao.addReview(review);
	
	response.sendRedirect("blogdetail.jsp?no="+review.getBlogNo()+"&pwd="+pwd);
%>