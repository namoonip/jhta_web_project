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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Example</title>
</head>
<body>
	<div class="container">
		<h1>내 정보</h1>
		
		<table class="table">
			<tr>
				<th>ID</th>
				<td>${LOGINED_USER.id }</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${LOGINED_USER.name }</td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td>${LOGINED_USER.phone }</td>
			</tr>
			<tr>
				<th>ADDRESS</th>
				<td>${LOGINED_USER.addr }</td>
			</tr>
		</table>
		<div class="pull-right">
			<a href="home.hta" class="w3-btn">List</a>
		</div>
	</div>
</body>
</html>