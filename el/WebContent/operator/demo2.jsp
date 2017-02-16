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
<title>Example</title>
</head>
<body>
	<div class="container">
	<hr />
	<h1>EL의 연산자</h1>
	
	<p>국어 점수: ${kor }</p>
	<p>영어 점수: ${eng }</p>	
	<p>수학 점수: ${math }</p>
	<p>총점 : ${kor + eng + math }</p>
	<p>평균 : ${(kor+eng+math) div 3 }</p>
	
	<p>국어점수 과락여부 ${kor lt 40 }</p>
	
	<p>전 과목이 80점 이상인가? ${(kor ge 80) and (eng ge 80) and (math ge 80) }</p>
	<hr />
	
	<h2>empty 연산자...</h2>
	<p>개봉영화 정보 ${movies }</p>
	<p>개봉영화 정보가 비어 있는가? ${empty movies}</p>
	<p></p>
	<hr />
	</div>
</body>
</html>