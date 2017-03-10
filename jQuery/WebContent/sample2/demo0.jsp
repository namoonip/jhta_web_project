<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h1>사원 정보 조회</h1>
	<button onclick="getData();">조회</button>
</div>
</body>
<script type="text/javascript">
// 받아온 데이터를 사용할 함수를 보여주기

function getData() {
	// <body>아래에 <script>태그를 만들어 해당 url에서 소스를 받기.
	$("<script><\/script>")
		.attr("type", "text/javascript")
		.attr("src", "http://192.168.10.116/jquery/getData?callback=abc")
		.appendTo("body");	
}

function abc(data) {
	alert(JSON.stringify(data));
}
</script>
</html>