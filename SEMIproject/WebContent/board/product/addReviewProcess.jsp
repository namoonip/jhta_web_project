<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
request.setCharacterEncoding("utf-8");
HttpSession session = request.getSession(false);
if(session == null) {
	response.sendRedirect("/member/view/loginForm.jsp?err=deny");
	return;
}

UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
if(user == null) {
	response.sendRedirect("/member/view/loginForm.jsp?err=deny");
	return;
}

String bNo = request.getParameter("bno");
String pno = request.getParameter("pno");
String tno = request.getParameter("tno");
int bno = 0;
ReviewVO review = new ReviewVO();
String contents = request.getParameter("reviewContents");
if(bNo != null) {
	bno = Integer.parseInt(bNo);
	review.setReviewGroupNo(bno);
}
review.setReviewContents(contents);
review.setReviewUserNo(user.getNo());
review.setReviewUserName(user.getName());
ReviewDAO reviewDAO = new ReviewDAO();
reviewDAO.addReviewInBoard(review);

response.sendRedirect("/board/boardDetail.jsp?bno="+bNo+"&tno="+tno+"&pno="+pno);
%>