<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>로그인</title>
<style type="text/css">
	label {display: inline-block; width: 100px;}
</style>
<body>
	<div class="container" id="wrapper">
		<div class="row">
		  	<div class="col-md-4 col-md-offset-3">
					<form action="loginProcess.jsp" method="post">
						<div class="panel panel-info">
						<div class="panel-heading"><strong>Login</strong></div>
						<div class="panel-body">
						<%
							String err = request.getParameter("err");
							String errMsg = null;
							if (err != null) {
								if (err.equals("fail")){
									errMsg = "아이디 혹은 비밀번호가 일치하지 않습니다.";
								}
								else if (err.equals("deny")){
									errMsg = "로그인 후 사용 가능합니다.";
								}
							}
							
							if(errMsg != null) {
						%>
						
						<p style="font-type:itelci; color: red;"><%=errMsg %></p>						 
						<%
							}
						%>
							<div class="form-group">
								<label for="">ID</label><input type="text" name="id" placeholder="ID"/>
							</div>
							<div class="form-group">
								<label for="">PASSWORD</label><input type="password" name="pwd" placeholder="PASSWORD"/>
							</div>
						</div>
						<div class="panel-footer text-left">
							<a href="signup.jsp" class="btn btn-default">회원가입</a>
							<button class="btn btn-info pull-right">로그인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>