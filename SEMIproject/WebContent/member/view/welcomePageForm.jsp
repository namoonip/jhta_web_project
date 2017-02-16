<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head><meta charset="utf-8">
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
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;가입을 축하합니다.	</h3>
					</div>
					<div class="panel-body">
						<p>가입이 완료되었습니다.</p>
						<!-- <p>An email will be sent to the email address you have specified. This email will provide you with a link to complete the verification process.</p> -->
						<p>가입한 메일주소로 인증코드가 포함된 링크가 발송되었습니다.</p>
						<p>이메일 인증을 해주세요</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>