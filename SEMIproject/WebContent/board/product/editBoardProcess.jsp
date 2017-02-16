<%@page import="vo.UserVO"%>
<%@page import="util.NumberUtil"%>
<%@page import="vo.BoardVO"%>
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
request.setCharacterEncoding("utf-8");
String tNo = request.getParameter("tno");
String bNo = request.getParameter("bno");
String pNo = request.getParameter("pno");
String boardPwd = request.getParameter("boardPwd");
int bno = NumberUtil.StringToInt(bNo, 1);
int tno = NumberUtil.StringToInt(tNo, 1);
String category = "잘못된 접근";
if(bNo != null && tNo != null) {
	bno = Integer.parseInt(bNo);
	tno = Integer.parseInt(tNo);
	category = request.getParameter("boardType");
} else {
	response.sendRedirect("/board/product/productBoard.jsp?tno="+tno+"&pno="+pNo+"&err=deny");
}
String pno = request.getParameter("pno");
String title = request.getParameter("boardTitle");
String contents = request.getParameter("boardContents");

BoardVO board = new BoardVO();
if (request.getParameter("boardType").equals("1")) {
	board.setBoardCategory("교환/반품 문의");
	tno = 1;
} else if (request.getParameter("boardType").equals("2")) {
	board.setBoardCategory("배송전 변경문의");
	tno = 2;
} else if (request.getParameter("boardType").equals("3")) {
	board.setBoardCategory("상품 문의");
	tno = 3;
} else if (request.getParameter("boardType").equals("4")) {
	tno = 4;
	board.setBoardCategory("기타 문의");
} else if (request.getParameter("boardType").equals("6")) {
	tno = 6;
	board.setBoardCategory("상품 후기");
}
board.setBoardType(tno);
System.out.println(tno);
System.out.println(category);

if(request.getParameter("rating-input-1") != null) {
	board.setBoardSatis(Double.parseDouble(request.getParameter("rating-input-1")));
}
board.setBoardNo(bno);
board.setBoardTitle(title);
board.setBoardContents(contents);
BoardDAO dao = new BoardDAO();
dao.updateBoard(board);
response.sendRedirect("/board/boardDetail.jsp?tno="+category+"&pno="+pno+"&bno="+bNo+"&bpwd="+boardPwd);
%>