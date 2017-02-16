<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.2/css/bootstrap.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>To Do Form</title>
</head>
<body>
	<div class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar bradn">Home</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="">리스트</a></li>
				<li><a href="">1</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="">회원가입</a></li>
				<li><a href="">로그인</a></li>
			</ul>				
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-offset-4 well">
				<form method="post" action="registProcess.jsp">
					<div class="panel panel-info">
						<div class="panel-heading">입력 정보 폼</div>
						<div class="panel-body">
							<div class="form-group">종류
								<p class="form-control">
								회사<input name="category" type="radio" value="회사" >
								개인<input name="category" type="radio" value="개인" checked><br />
								</p>
							</div>
							<div class="form-group"><label for="">제목</label><input name="title" type="text" class="form-control" placeholder="제목"/></div>
							<div class="form-group"><label for="">내용</label><textarea name="description" id="" cols="30" rows="10" class="form-control" placeholder="내용을 입력하세요"></textarea></div>
							<div class="form-group"><label for="">장소</label><input name="location" type="text" class="form-control" placeholder="장소"/></div>
							<div class="form-group"><label for="">일시</label><input name="day" type="date" class="form-control" /></div>
						</div>
						<div class="panel-footer pull-right">
						<button class="btn btn-success" type="submit">등록</button>
						<a href="index.jsp" class="btn btn-default">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>