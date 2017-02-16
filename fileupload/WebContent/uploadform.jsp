<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Example</title>
</head>
<body>
	<div class="container">
		<h1>첨부파일 업로드 폼</h1>
		<div class="well">
			<form method="post" action="upload.hta" enctype="multipart/form-data">
				<div class="form-group">
					<label for="">작성자</label> 
					<input type="text" name="username"class="form-control"/>
				</div>
				<div class="form-group">
					<label for="">설명</label> 
					<textarea rows="3" name="description" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label for="">사진</label> 
					<input type="file" name="photofile" class="form-control"/>
				</div>
				<div class="form-group text-right">
					<input type="submit" class="btn btn-default" value="사진올리기"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>