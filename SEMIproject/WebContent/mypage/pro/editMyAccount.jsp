<%@page import="dao.MemberDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	// 로그인 세션 가져오기
	HttpSession session = request.getSession(false);
	if (session== null) {
		response.sendRedirect("/member/view/loginForm.jsp?err=deny");
		return;
	}

	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");	
	
	if (user == null) {
		response.sendRedirect("/member/view/loginForm.jsp?err=deny");
		return;
	}	
	
	// 수정한 항목의 값 받아오기
	String phone = request.getParameter("updatePhone");
	String birth = request.getParameter("updateBirth");
	String addr = request.getParameter("updateAddr");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");

	//비밀번호 암호화
	String secuPwd = MD5.hash(pw);

	// user디비에 업데이트		
	UserVO vo = new UserVO();
	vo.setPhone(phone);
	vo.setBirth(birth);
	vo.setAddr(addr);
	vo.setPw(secuPwd);
	vo.setNo(user.getNo());
	
	MemberDAO dao = new MemberDAO();
	dao.updateUserInfo(vo);
	
	response.sendRedirect("/member/pro/logout.jsp");
%>