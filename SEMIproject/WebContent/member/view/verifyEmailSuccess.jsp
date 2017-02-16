<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko"><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<%@include file="/nav.jsp"%>
	<div class="container">
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;이메일 인증이 완료되었습니다.</h3>
					</div>
					<div class="panel-body">
						<p style="text-align: center">
							<a href="/member/view/loginForm.jsp"><span style="color: brown"><b>로그인 페이지</b></span></a>로 이동하기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>