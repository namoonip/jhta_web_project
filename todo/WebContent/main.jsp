<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession(false);
	if (session != null) {
		response.sendRedirect("logoutProcess.jsp");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Main</title>
<style>
	.container{
		margin-top: 100px;
	}
</style>
</head>
<body>
<% 
	String err = request.getParameter("err");
	if(err != null) {
		if(err.equals("fail")) {
%>
			<script type="text/javascript"> alert("아이디 혹은 비밀번호가 일치하지 않습니다.");</script>
<%
		}
		if(err.equals("deny")) {
%>
		<script type="text/javascript"> alert("로그인 후 이용 가능합니다.");</script>
<%
		}
	}
%>
<%@ include file="common/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 div col-md-offset-4">
			<div class="panel panel-info">
				<div class="panel-heading">로그인</div>
				<div class="panel-body">
				<% %>
					<form method="post" action="loginprocess.jsp">
						<div class="form-group"><label for="">아이디</label><input type="text" name="id" class="form-control" /></div>
						<div class="form-group"><label for="">비밀번호</label><input type="password" name="pwd" class="form-control" /></div>
						<a href="signup.jsp" class="btn btn-default">회원가입</a>
						<button class="btn btn-info pull-right">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>