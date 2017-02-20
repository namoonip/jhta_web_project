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
		<h1>작성글 수정</h1>
		
		<form action="edit.hta" method="post">
			<input type="hidden" name="no" value="${EditBoard.no }"/>			
		
			<table class="table">
				<tr>
					<th>no</th>
					<td><c:out value="${EditBoard.no}"></c:out> </td>
				</tr>
				<tr>
					<th>Title</th>
					<td><input type="text" value="${EditBoard.title }" name="title" class="form-group"/></td>
				</tr>
				<tr>
					<th>Writer</th>
					<td><c:out value="${EditBoard.writer }"></c:out> </td>
				</tr>
				<tr>
					<th>Contents</th>
					<td>
						<textarea name="contents" id="" cols="30" rows="10" class="form-control"><c:out value="${EditBoard.contents}"></c:out></textarea>
					</td>
				</tr>
				<tr>
					<th>Regdate</th>
					<td><fmt:formatDate value="${EditBoard.regdate }" type="date"/></td>
				</tr>
				<tr>
					<th>Likes</th>
					<td><c:out value="${EditBoard.likes }"></c:out> </td>
				</tr>
				<tr>
					<th>IP</th>
					<td><c:out value="${EditBoard.ip }"></c:out> </td>
				</tr>
			</table>
			<div class="pull-right">
				<a href="list.hta" class="w3-btn">List</a>
				<button class="w3-btn" style="color: green;" type="submit">Edit</button>
			</div>
		</form>
	</div>
</body>
</html>