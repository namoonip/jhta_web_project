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
		<h1>게시글 추가하기</h1>
		
		<form action="add.hta" method="post">
			<div class="form-group">
				<label for="">Writer</label>
				<input type="text" class="form-control" name="writer"/>
			</div>
			<div class="form-group">
				<label for="">Title</label>
				<input type="text" class="form-control" name="title"/>
			</div>
			<div class="form-group">
				<label for="">Contents</label>
				<textarea id="" cols="30" rows="10" class="form-control" name="contents"></textarea>
			</div>
			<div class="pull-right">
				<button type="submit" class="w3-btn">완료</button>
			</div>
		</form>
	</div>
</body>
</html>