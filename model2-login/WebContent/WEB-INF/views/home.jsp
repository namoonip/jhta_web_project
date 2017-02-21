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
		<h1>Home Page</h1>
		
		<c:if test="${LOGINED_USER.name eq 'kkk' }">		
			<p><a href="list.hta" class="w3-btn  w3-purple">고객 조회</a></p>	
		</c:if>
		
		<c:choose>
			<c:when test="${empty LOGINED_USER }">
				<p><a href="form.hta" class="w3-btn w3-khaki">회원 가입</a></p>
				<p><a href="loginform.hta" class="w3-btn w3-lime">로그인</a></p>
			</c:when>
			<c:when test="${not empty LOGINED_USER }">
				<p><c:out value="${LOGINED_USER.name }"/> 님 환영합니다.</p>
				<p><a href="myinfo.hta" class="w3-btn w3-red">내 정보보기</a></p>
				<p><a href="logout.hta" class="w3-btn w3-teal">로그아웃</a></p>
			</c:when>
		</c:choose>
	</div>
</body>
</html>