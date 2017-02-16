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
	<div class="container">
		<div class="row">
			<form action="signupProcess.jsp" method="post">
				<div class="col-md-5 col-md-offset-3">
					<div class="panel panel-info">
						<div class="panel-heading"><b>회원가입</b></div>
						<div class="panel-body">
						<table class="table">
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="id" placeholder="아이디"/></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="pwd" placeholder="비밀번호"/></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" placeholder="이름"/></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="phone" placeholder="전화번호"/></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="addr" placeholder="주소"/></td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="panel-footer text-left">
							<button class="btn btn-info pull-right">등록</button>
							<a href="loginform.jsp" class="btn btn-default">취소</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>