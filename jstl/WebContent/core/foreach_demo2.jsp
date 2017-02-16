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
		<h1>Core 태그라이브러리의 forEach 태그</h1>
		<!-- 
			items : EL표현식이며 
					반복처리할 대상이 되는 값을 지정
					(컬렉션이 들어간다.)
			var : 변수명
				     반복처리 중인 항목이 저장된다.
		 -->
		
		<h2>단순한 값을 가진 배열</h2>
		<c:forEach var="a" items="${names }">
			${a }
		</c:forEach>
		<hr />
		
		<h2>객체를 값으로 가진 콜렉션</h2>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>가격</th>
					<th>출판일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="a" items="${bookList }">
					<tr>
						<td>${a.no }</td>
						<td>${a.title }</td>
						<td>${a.author }</td>
						<td>${a.publisher }</td>
						<td>${a.price }</td>
						<td>${a.pubdate} </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

