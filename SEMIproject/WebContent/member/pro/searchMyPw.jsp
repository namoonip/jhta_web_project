<%@page import="dao.MemberDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@page import="java.util.Random"%>
<%@page import="util.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<%
	request.setCharacterEncoding("utf-8");
	
	// 임시비밀번호 발급하기 
	String words = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ123456789";
	Random random = new Random();
	
	String pwd = "";
	for (int i=0; i<6; i++) {
		int result = random.nextInt(60);
		String ch = String.valueOf(words.charAt(result));
		pwd += ch;
	}	
	
	// 암호화
	String secuPw = MD5.hash(pwd);
	
	// 입력한 아이디의 디비를 찾아 암호화한것을 디비에 업데이트를 한다. 
	String title = "+[SARA C]+ 임시비밀번호 발급";
	String id = request.getParameter("id");
	String contents = "♡임시비밀번호♡ " + pwd;
	
	MemberDAO dao = new MemberDAO();
	dao.userinfoById(id, secuPw);
	
	// 고객에게 그 비밀번호를 쏴줌		
	MailSend mailsend = new MailSend();
	mailsend.sendmail(title, id, contents);
		
	response.sendRedirect("/member/view/loginForm.jsp");
 
%>