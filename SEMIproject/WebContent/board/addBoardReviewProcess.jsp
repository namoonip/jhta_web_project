<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@page import="util.NumberUtil"%>
<%@page import="util.MD5"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.UserVO"%>
<%	
	request.setCharacterEncoding("utf-8");
	
	HttpSession session = request.getSession(false);
	if(session==null) {
		response.sendRedirect("member/view/loginForm.jsp");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	if(user==null || user.getNo() != 0) {
		response.sendRedirect("/member/view/loginForm.jsp");
		return;
	}
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	int tno = 1;
	int pno = 1;
	String bno = request.getParameter("bno");
	String gNo = request.getParameter("gno");
	int gno = NumberUtil.StringToInt(gNo, 1);
	if(gNo != null) {
		gno = Integer.parseInt(gNo);
		vo.setBoardGroupNo(gno);
	} else {
		vo.setBoardGroupNo(0);
	}
	vo.setBoardType(Integer.parseInt(request.getParameter("boardType")));
	if (request.getParameter("boardType").equals("1")) {
		tno = 1;
	} else if (request.getParameter("boardType").equals("2")) {
		tno = 2;
	} else if (request.getParameter("boardType").equals("3")) {
		tno = 3;
	} else if (request.getParameter("boardType").equals("4")) {
		tno = 4;
	} else if (request.getParameter("boardType").equals("6")) {
		tno = 6;
		vo.setBoardCategory("후기 답변");
	}
		vo.setBoardCategory("문의 답변");
	vo.setBoardTitle(request.getParameter("boardTitle"));
	vo.setBoardContents(request.getParameter("boardContents"));
	BoardVO vo2 = dao.getBoardDetailByNo(Integer.parseInt(bno));
	vo.setBoardPwd(vo2.getBoardPwd());
	if("0".equals(vo2.getBoardPwd())) {
		vo.setSecret("n");
	} else {
		vo.setSecret("y");
	}
	vo.setUserName("운영자");
	vo.setBoardUserNo(Integer.parseInt(request.getParameter("uno")));
	dao.addBoardReview(vo);
	
	response.sendRedirect("/board/product/productBoard.jsp?tno="+tno+"&pno=1");
%>