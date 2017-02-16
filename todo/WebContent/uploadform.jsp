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
<title>Upload</title>
</head>
<body>
<%@ include file="common/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
		<div class="panel-group">
			<div class="panel panel-success">
				<form action="upload.hta" method="post" enctype="multipart/form-data">
					<div class="panel-heading panel-success" style="font-size: medium;"><strong>Picture Record</strong></div>
					<div class="panel-body">
						<table class="table">
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" class="form-control" placeholder="제목"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="contents" cols="30" rows="10" class="form-control" placeholder="내용"></textarea></td>
							</tr>
							<tr>
								<th>장소</th>
								<td><input type="text" name="location" class="form-control" placeholder="장소" /></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><input type="date" name="day" class="form-control" /></td>
							</tr>
							<tr>
								<th>업로드</th>
								<td><input type="file" name="photofile" class="form-control" style="vertical-align: bottom;"/></td>
							</tr>
						</table>
						<button class="btn btn-success pull-right">업로드</button>
						<a class="btn btn-danger" href="list.jsp?pno=1">취소</a>
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>