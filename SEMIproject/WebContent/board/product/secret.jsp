<%@page import="util.MD5"%>
<%@page import="vo.BoardVO"%>
<%@page import="util.NumberUtil"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	// 파라미터 방어 코드
	String tNo = request.getParameter("tno");
	String pno = request.getParameter("pno");
	String bNo = request.getParameter("bno");
	int tno = NumberUtil.StringToInt(tNo, 1);
	int bno = NumberUtil.StringToInt(bNo, 1);
	if(tNo != null) {
		tno = Integer.parseInt(tNo);
	} else {
		response.sendRedirect("/member/view/loginForm.jsp?err=deny");
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../../nav.jsp"%>
<%

if(!isLogined) {
	response.sendRedirect("/member/view/loginForm.jsp?err=deny");
	return;
}
	String err = request.getParameter("err");
	if(err != null) {
		if(err.equals("deny")) {%>
		<script type="text/javascript"> alert('비밀번호가 틀립니다.');</script>
		<%} 
}%>
<div class="container" style="padding-bottom: 50px;">
	<div style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
	<h5><%if(tno == 1)  { %>
		교환/반품요청
	<%} else if (tno == 2) { %> 
		배송전 변경
	<%} else if (tno == 3) { %> 
		상품 문의
	<%} else if (tno == 4) { %> 
		기타 문의<%}%></h5>
	<p><strong style="font-size: 15px;">/</strong><br />
			해당 게시판의 특성과 맞지 않는 게시물, <br />
			또한 관련성 없는 비방성의 글들은 임의로 삭제됩니다
	</p><br />
	</div>
	<form action="/board/boardDetail.jsp" method="post" onsubmit="return pwdCheck();">
		<input type="hidden" name="tno" value="<%=tNo %>"/>
		<input type="hidden" name="pno" value="<%=pno %>"/>
		<input type="hidden" name="bno" value="<%=bno %>"/>
		<div style="padding-top: 2px; text-align: center;  border:1px solid gray;">
			<h4><strong>비밀글 보기</strong></h4><br />
			<p style="font-size : 15px;">
				이 글은 비밀글입니다. <span style="color:#008bcc;">비밀번호를 입력하여 주세요.</span> <br />
			</p> <br />
			<p>
				<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
				비밀번호 <input type="password" id="board-Pwd" name="boardPwd"/>	
			</p>
			<div style="padding-top: 2px; text-align: center;">
				<p>
				<a href="productBoard.jsp?tno=<%=tNo %>&pno=<%=pno %>" class="btn btn-default">목록</a>
				<button type="submit" class="btn btn-info">확인</button>
				</p>
			</div>
		</div>
	</form>
</div>
<%@include file="../../footer.jsp"%>	
</body>
<script type="text/javascript">
	function pwdCheck() {
	var pwdEL = document.getElementById("board-Pwd");
	var pwd = pwdEL.value.trim();
	if(pwd=="") {
		alert("패스워드를 입력하세요");
		pwdEL.focus();
		return false;
	}
	return true;
	}
</script>
</html>