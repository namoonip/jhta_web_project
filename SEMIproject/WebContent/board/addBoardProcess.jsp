<%@page import="util.NumberUtil"%>
<%@page import="util.MD5"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%	
	request.setCharacterEncoding("utf-8");
	
	HttpSession session = request.getSession(false);
	if(session==null) {
		response.sendRedirect("http://localhost/member/view/loginForm.jsp");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	if(user==null) {
		response.sendRedirect("/member/view/loginForm.jsp");
		return;
	}
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	int tno = 1;
	String pNo = request.getParameter("pno");
	int pno = Integer.parseInt(pNo);
	vo.setBoardType(Integer.parseInt(request.getParameter("boardType")));
	if (request.getParameter("boardType").equals("1")) {
		vo.setBoardCategory("교환/반품 문의");
		tno = 1;
	} else if (request.getParameter("boardType").equals("2")) {
		vo.setBoardCategory("배송전 요청문의");
		tno = 2;
	} else if (request.getParameter("boardType").equals("3")) {
		vo.setBoardCategory("상품 문의");
		tno = 3;
	} else if (request.getParameter("boardType").equals("4")) {
		tno = 4;
		vo.setBoardCategory("기타 문의");
	} else if (request.getParameter("boardType").equals("6")) {
		tno = 6;
		vo.setBoardCategory("구매 후기");
	}
	vo.setBoardTitle(request.getParameter("boardTitle"));
	vo.setBoardContents(request.getParameter("boardContents"));
	vo.setUccURL(request.getParameter("uccUrl"));
	vo.setBoardFileName1(request.getParameter("boardFileName1"));
	vo.setBoardFileName2(request.getParameter("boardFileName2"));
	vo.setBoardFileName3(request.getParameter("boardFileName3"));
	vo.setBoardFileName4(request.getParameter("boardFileName4"));
	vo.setBoardFileName5(request.getParameter("boardFileName5"));
	if (request.getParameter("boardPwd")==null) {
		vo.setBoardPwd("0");
	} else {
		String pwd = request.getParameter("boardPwd");
		String secuPwd = MD5.hash(pwd);
		vo.setBoardPwd(secuPwd);
	}
	
	vo.setSecret(request.getParameter("secret"));
	vo.setUserName(user.getName());
	vo.setBoardUserNo(user.getNo());
	
	String iNo = request.getParameter("ino");
	int ino = NumberUtil.StringToInt(iNo, 1);
	if(iNo != null) {
		ino = Integer.parseInt(iNo);
		vo.setBoardItemNo(ino);	
	} else {
		vo.setBoardItemNo(2301);	
	}
	
	if(request.getParameter("rating-input-1") != null) {
		vo.setBoardSatis(Double.parseDouble(request.getParameter("rating-input-1")));
	}
	dao.addBoard(vo);
	
	response.sendRedirect("/board/product/productBoard.jsp?tno="+tno+"&pno="+pNo);
%>