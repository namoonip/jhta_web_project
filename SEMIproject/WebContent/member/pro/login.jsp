<%@page import="dao.MemberDAO"%>
<%@page import="util.MD5"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%	
	request.setCharacterEncoding("utf-8");
	
	// 아이디랑 비번을 받는다
	String id = request.getParameter("email");
	String pw = request.getParameter("password");

	MemberDAO dao = new MemberDAO();

	//디비에서 아이디에 해당하는 사용자 정보 조회
	UserVO user = dao.getUserById(id);
	
	// 입력한 아이디에 해당하는 사용자 정보가 없는 경우
	if (user == null) {
		response.sendRedirect("/member/view/loginForm.jsp?err=idfail");
		return;
	}
	
	if ("N".equals(user.getEmailcheck())) {
		response.sendRedirect("/member/view/welcomePageForm.jsp");
		return;		
	}

	// 사용자가 입력한 아이디를 디비에 저장된 암호화된 비밀번호와 비교하기 위해서 암호화한다.
	String secuPwd = MD5.hash(pw);

	// 비밀번호가 서로 일치하지 않는 경우 
	if (!secuPwd.equals(user.getPw())) {
		response.sendRedirect("/member/view/loginForm.jsp?err=pwfail");
		return;
	}

	// 사용자 정보도 존재하고, 비밀번호도 서로 일치하는 경우에만 이 부분은 실행한다.
	HttpSession session = request.getSession(true);
	session.setAttribute("LOGINED_USER", user);
	response.sendRedirect("/main.jsp?mycc/main");
%>
