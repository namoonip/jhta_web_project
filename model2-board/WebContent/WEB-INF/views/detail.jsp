<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<h1>작성글 보기</h1>
		<table class="table">
			<tr>
				<th>no</th>
				<td><c:out value="${board.no}"/></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><c:out value="${board.title }"></c:out> </td>
			</tr>
			<tr>
				<th>Writer</th>
				<td><c:out value="${board.writer }"></c:out> </td>
			</tr>
			<tr>
				<th>Contents</th>
				<td>
					<textarea id="" cols="30" rows="10" disabled="disabled" class="form-control"><c:out value="${board.contents}"></c:out></textarea>
				</td>
			</tr>
			<tr>
				<th>Regdate</th>
				<td><fmt:formatDate value="${board.regdate }" type="date"/></td>
			</tr>
			<tr>
				<th>Likes</th>
				<td><c:out value="${board.likes }"></c:out> </td>
			</tr>
			<tr>
				<th>IP</th>
				<td><c:out value="${board.ip }"></c:out> </td>
			</tr>
		</table>
		<div class="pull-right">
			<a href="list.hta" class="w3-btn">List</a>
			<a href="editForm.hta?no=${board.no }" class="w3-btn" style="color: purple;">Edit</a>
		</div>
	</div>
</body>
</html>