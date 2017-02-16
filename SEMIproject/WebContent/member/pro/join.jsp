<%@page import="util.MailSend"%>
<%@page import="java.util.Random"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	// 회원가입폼에 입력한 값 받아오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");
	
	// 비밀번호를 암호화한다. 32자리의 암호문으로 바뀜
	String secuPwd = MD5.hash(pw);
	
	// user디비에 저장한다.
	UserVO user = new UserVO();
	user.setId(id);
	user.setPw(secuPwd);
	user.setName(name);
	user.setPhone(phone);
	user.setAddr(addr);
	user.setBirth(birth);
	
	MemberDAO dao = new MemberDAO();
	
	//임시비밀번호 발급
	String words = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ123456789";
	Random random = new Random();
	 	
	String emailCode = "";
	for (int i=0; i<64; i++) {
		// 36개 문자중에서 랜덤으로 하나씩 뽑는다. 4번반복
		int result = random.nextInt(60);
		String w = String.valueOf(words.charAt(result));
		emailCode +=w;
	}
	
	 // 고객에게 이메일 확인 인증번호 발송		
	MailSend mailsend = new MailSend();
	String title = "+[SARA C]+ 이메일 인증";
	String link = "http://localhost/member/pro/verifyEmail.jsp?code="+ emailCode; 
			
	String contents = "";
	contents += "<html>";
	contents += "<body>";
	contents += "<h1>이메일 주소 인증 관련 메세지</h1>";
	contents += "<p>아래의 링크를 클릭해주세요</p>";
	contents += "<p><a href='"+link+"'> Sara C </a></p>";
	contents += "</body>";
	contents += "</html>";
	
	mailsend.sendmailForHtml(title, id, contents);
	user.setEmailcode(emailCode);
	dao.join(user);		
	
	response.sendRedirect("/member/view/welcomePageForm.jsp");
%>