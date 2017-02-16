<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String no = request.getParameter("no");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>PWD check</title>
</head>
<body>
<%@ include file="/common/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form action="blogdetail.jsp" method="post" onsubmit="return pwdcheck();">
					<div class="panel panel-info">
						<div class="panel-heading">비밀번호 확인</div>
						<div class="panel-body">
						<label for="">비밀번호 :
						<input type="password" name="pwd" id="blog-pwd"/></label>
						</div>
						<input type="hidden" name="no" value="<%=no%>"/>
						<div class="panel-footer panel-info text-right">
						<button class="btn btn-sm" type="submit">확인</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function pwdcheck() {
		var pwdEL = document.getElementById("blog-pwd");
		var pwd = pwdEL.value.trim();
		if(pwd=="") {
			alert("패스워드를 입력하세요");
			pwdEL.focus();
			return false;
		}
		
		var pwdPattern = /[0-9]{4,4}/;
		if (!pwdPattern.test(pwd)) {
			alert("4자리 숫자가 아닙니다.");
			pwdEL.focus();
			return false;
		}
		<%
		BlogDAO dao = new BlogDAO();
		dao.addReadCount(Integer.parseInt(no));
		%>
		return true;
	}

</script>
</html>