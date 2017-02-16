<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원가입</title>
</head>
<body>
<%@ include file="common/header.jsp" %>
	<div class="container">
		<div class="row">
				<div class="col-md-5 col-md-offset-3">
					<div class="panel panel-info">
						<form action="signupProcess.jsp" method="post">
						<div class="panel-heading panel-info"><b>회원가입</b></div>
						<div class="panel-body">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i></span>
								<input style="padding: 5px; vertical-align: bottom;" type="text" name="id" class="fonm-control" placeholder="ID"/>
								</div>
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-lock"></i></span>
								<input style="padding: 5px; vertical-align: bottom;" type="password" name="pwd" class="fonm-control" placeholder="PASSWORD"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-pencil"></i></span>
								<input style="padding: 5px; vertical-align: bottom;" type="text" name="name" class="fonm-control" placeholder="User Name"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i></span>
								<input style="padding: 5px; vertical-align: bottom;" type="text" name="phone" class="fonm-control" placeholder="Phone Number"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-home"></i></span>
								<input style="padding: 5px; vertical-align: bottom;" type="text" name="addr" class="fonm-control" placeholder="Address"/>
							</div>
						</div>
						<div class="panel-footer text-left">
							<button class="btn btn-info pull-right">등록</button>
							<a href="main.jsp" class="btn btn-default">취소</a>
						</div>
						</form>
					</div>
				</div>
		</div>
	</div>
</body>
</html>