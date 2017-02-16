<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
request.setCharacterEncoding("utf-8");

ReviewDAO reviewDAO = new ReviewDAO();
String bno = request.getParameter("bno");
String tno = request.getParameter("tno");
String pno = request.getParameter("pno");
String rNo = request.getParameter("rno");
int rno = 1;
if(rNo!=null) {
	rno = Integer.parseInt(rNo);
}



Cookie[] cookies = request.getCookies();
Cookie viewCookie = null;
if(cookies != null && cookies.length > 0) {
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("VIEWCOOKIE"+rNo)) {
			viewCookie = cookies[i];
		}
	}
}
// 뷰쿠기가 없을 때 readcount 증가
if(viewCookie == null) {
	reviewDAO.addReviewLikeByReviewNo(rno);
	Cookie newCookie = new Cookie("VIEWCOOKIE"+rNo, "|"+rNo+"|");
	newCookie.setMaxAge(20*60);
	response.addCookie(newCookie);
} else {
	String value = viewCookie.getValue();
	if (value.indexOf("|"+rNo+"|") < 0) {
		value = value + "|" + rNo + "|";
		viewCookie.setValue(value);
		response.addCookie(viewCookie);
	}
}

response.sendRedirect("/board/boardDetail.jsp?bno="+bno+"&tno="+tno+"&pno="+pno);
%>