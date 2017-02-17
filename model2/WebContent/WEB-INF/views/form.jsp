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
	<h1>신규 고객 등록 폼</h1>
	<form action="add.hta" method="post">
		<div class="form-group">
			<label for="user-id">아이디</label>
			<input type="text" class="form-control" id="user-id" name="id"/>
		</div>
		<div class="form-group">
			<label for="user-pwd">비밀번호</label>
			<input type="text" class="form-control" id="user-pwd" name="pwd"/>
		</div>
		<div class="form-group">
			<label for="user-name">이름</label>
			<input type="text" class="form-control" id="user-name" name="name"/>
		</div>
		<div class="form-group">
			<label for="user-phone">전화번호</label>
			<input type="text" class="form-control" id="user-phone" name="phone"/>
		</div>
		<div class="form-group">
			<label for="user-addr">주소</label>
			<input type="text" class="form-control" id="user-addr" name="addr"/>
		</div>
		<div class="form-group pull-right">
			<button type="submit" class="w3-btn">등록</button>
		</div>
	</form>
</div>
</body>
</html>