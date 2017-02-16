<%@page import="vo.BoardVO"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
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
String tno = request.getParameter("tno");
String bno = request.getParameter("bno");
BoardDAO dao = new BoardDAO();
BoardVO vo = null;
if(bno!=null) {
	vo = new BoardVO();
	vo = dao.getBoardDetailByNo(Integer.parseInt(bno));
}
if(user.getNo() != vo.getBoardUserNo() && user.getNo() != 0) {
	response.sendRedirect("/board/boardDetail.jsp?tno="+tno+"&bno="+bno+"&err=deny");
	return;
}
if(bno != null) {
	dao.deleteBoardByNo(bno);
	response.sendRedirect("/board/product/productBoard.jsp?tno="+tno);
	return;
} else {
	response.sendRedirect("/board/product/productBoard.jsp?tno="+tno+"&err=deny");
	return;
}
%>