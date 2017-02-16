<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
.btn btn-default {
	text-align: right;
}
</style>
</head>
<body>
	<%@include file="/nav.jsp"%>
	<%
		if (isLogined) {
			session.invalidate();
		}
		String err = request.getParameter("err");
		if (err != null) {
			if (err.equals("deny")) {
	%>
	<script type="text/javascript">
		alert("로그인 후 이용 가능합니다.");
	</script>
	<%
		}
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Forgot Your Password?!</h4>
					</div>
					<div class="panel-body">
						<p>Please enter your email address below. You will receive a code to reset your password.</p>
						<form class="form-horizontal" action="/member/pro/searchMyPw.jsp">
							<div class="form-group">
								<br /> <label class="control-label col-sm-1" for="email">Email:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="id" name="id" placeholder="가입한 이메일주소 입력">
								</div>
								<br />
								<br />
								<br />
								<div class="form-group">
									<div class="col-sm-offset-5 col-sm-10">
										<button type="submit" class="btn btn-default">Submit</button>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>