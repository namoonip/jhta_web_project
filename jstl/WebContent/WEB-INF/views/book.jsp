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
		<h1>책 상세 정보</h1>
		
		<table class="w3-table w3-bordered" style="width: 55%">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tr>
				<th>번호</th>
				<td><c:out value="${book.no }"></c:out></td>
			</tr>		
			<tr>
				<th>제목</th>
				<td><c:out value="${book.title }"></c:out></td>
			</tr>		
			<tr>
				<th>저자</th>
				<td><c:out value="${book.author }"></c:out></td>
			</tr>		
			<tr>
				<th>출판사</th>
				<td><c:out value="${book.publisher }"></c:out></td>
			</tr>		
			<tr>
				<th>가격</th>
				<td><c:out value="${book.price }"></c:out></td>
			</tr>		
			<tr>
				<th>출판일</th>
				<td><c:out value="${book.pubdate }"></c:out></td>
			</tr>		
		</table>
			<div class="w3-panel text-center">
				<a href="books.hta" class="w3-btn">뒤로가기</a>
			</div>
	</div>
</body>
</html>