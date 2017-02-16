<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 추가한 CSS -->
<link rel="stylesheet" href="/css/style.css">

</head>

<!-- 모든유저가 보는 네비바 -->
<%@include file="/nav.jsp"%>

<!-- Admin의 네비바 -->
<%@include file="adminNav.jsp"%>

<body>
	<!-- LogingCheck And Admin Check -->
	<%
		if (session == null) {
			response.sendRedirect("/main.jsp?err");
			return;
		}
		request.setCharacterEncoding("utf-8");

		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");

		if (!"admin".equals(user.getId())) {
			response.sendRedirect("/main.jsp?YourNotManager!");
			return;
		}
	%>

	<div class="container" id="naviTarget">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>
							<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							메일 보내기
						</h3>
					</div>
					<div class="panel-body">
					<form action="/admin/process/adminBoardSendMailProcess.jsp" method="post" >
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" id="mailTitle" placeholder="메일 제목을 입력해주세요" name="mailTitle">
							</div>
							<div class="form-group">
								<label>받는사람</label>
								<input type="text" class="form-control" id="mailTarget" placeholder="받는사람 메일주소를 적어주세요" name="mailTarget">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="6" id="mailContents" placeholder="메일내용을 입력해주세요" name="mailContents" style="resize: none;" ></textarea>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success pull-right btn-lg"> 
								<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
								</button>
							</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>