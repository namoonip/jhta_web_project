<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h1>게시글 리스트</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>Writer</th>
				<th>Title</th>
				<th>Regdate</th>
				<th>Likes</th>
				<th>IP</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boards}">
				<tr>
					<td>${board.no }</td>
					<td>${board.writer }</td>
					<td><a href="detail.hta?no=${board.no}">${board.title }</a></td>
					<td><fmt:formatDate value="${board.regdate }" type="date"/></td>
					<td>${board.likes }</td>
					<td>${board.ip }</td>
					<td><a href="del.hta?no=${board.no}" class="w3-btn" style="color: red;">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pull-right">
		<a href="form.hta" class="w3-btn">글 등록</a>
	</div>
	</div>
</body>
</html>