<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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
<title>demo2</title>
</head>
<body>
	<h1>demo2.jsp에 제출된 폼 입력값 표현하기</h1>
	<p>검색어 : ${param.keyword}</p>
	
	<p>검색어 : <input type="text" name="prevKeyword" value="${param.keyword}"/>
	</p>
	<hr />
	
	<p>체크된 취미 : ${paramValues.hobby[0] }, ${paramValues.hobby[1] }</p>
	<p>${header['Accept-Language'] }</p>
</body>
</html>