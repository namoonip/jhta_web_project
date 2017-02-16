<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>Core 태그 라이브러리의 choose, when, otherwise</h1>
		
		<p>고객 등급 : ${grade }</p>
		
		<c:choose>
			<c:when test="${grade eq '골드' }">
				<p>구매금액의 5%가 포인트로 적립됩니다.</p>
			</c:when>
			<c:when test="${grade eq '실버' }">				
				<p>구매금액의 3%가 포인트로 적립됩니다.</p>
			</c:when>
			<c:when test="${grade eq '브론즈' }">				
				<p>구매금액의 1%가 포인트로 적립됩니다.</p>
			</c:when>
			<c:otherwise>			
				<p>비회원은 포인트가 적립되지 않습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>