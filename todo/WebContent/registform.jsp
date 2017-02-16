<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file ="common/logincheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>todo app</title>
</head>
<body>	
<%@ include file="common/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form method="post" enctype="application/x-www-form-urlencoded" action="register.jsp">
					<div class="panel panel-success">
						<div class="panel-heading">
							일정 등록하기
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label>종류</label>
								<input type="text" class="form-control" name="category">
							</div>
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" name="title">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea name="description" rows="5" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<label>장소</label>
								<input type="text" class="form-control" name="location">
							</div>
							<div class="form-group">
								<label>일시</label>
								<input type="date" class="form-control" name="day">
							</div>
						</div>
						<div class="panel-footer text-right">
							<button type="submit" class="btn btn-success">등록</button>
							<a href="list.jsp?pno=1" class="btn btn-default">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>