<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Example</title>
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		
		<c:if test="${param.err eq 'fail'}">
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 아이디 혹은 비빌번호가 올바르지 않습니다.
			</div>
		</c:if>
		
		<c:if test="${param.err eq 'deny'}">
			<div class="alert alert-danger">
				<strong>접속 거부</strong> 로그인 후 이용 가능합니다.
			</div>		
		</c:if>
		
		<form action="login.hta" method="post">
			<div class="form-group">
				<label for="user-id">ID</label>
				<input type="text" class="form-control" name="userid" id="user-id"/>
			</div>
			<div class="form-group">
				<label for="user-pwd">Password</label>
				<input type="password" class="form-control" name="userpwd" id="user-pwd"/>
			</div>
			<div class="form-group">
				<button type="submit" class="w3-btn w3-red">Login</button>
			</div>
		</form>
	</div>
</body>
</html>