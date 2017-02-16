<%@page import="util.NumberUtil"%>
<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String rNo = request.getParameter("rno");
	int rno = NumberUtil.StringToInt(rNo, 1);
	if(rNo != null) {
		rno = Integer.parseInt(rNo);
	}
	
	ReviewDAO dao = new ReviewDAO();
	dao.deleteReviewByReviewNo(rno);
	
	out.write('Y');
%>