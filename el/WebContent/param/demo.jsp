<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
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
	<div class="w3-container">
		<h1> 상품 리스트</h1>
		
		<p>현재 페이지 : ${param.pno}</p>
		
		<ul class="w3-pagination">
			<li><a href="demo.jsp?pno=1">1</a></li>
			<li><a href="demo.jsp?pno=2">2</a></li>
			<li><a href="demo.jsp?pno=3">3</a></li>
			<li><a href="demo.jsp?pno=4">4</a></li>
			<li><a href="demo.jsp?pno=5">5</a></li>
		</ul>
		
		<form action="demo2.jsp" class="form-group">
			검색어 : <input type="text" name="keyword"/><br />
			취미 : <input type="checkbox" name="hobby" value="game" id="game"/> <label for="game">게임하기</label>
				<input type="checkbox" name="hobby" value="music" id="music"/> <label for="music"> 노래하기</label>
				<input type="checkbox" name="hobby" value="sports" id="sports"/> <label for="sports"> 운동하기</label>
				<input type="checkbox" name="hobby" value="etc" id="etc"/> <label for="etc"> 기타</label>
			<button type="submit" class="w3-btn">검색</button>
		</form>
	</div>
</body>
</html>