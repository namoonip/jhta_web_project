<%@page import="dao.MemberDAO"%>
<%@page import="vo.UserVO"%>
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

</head>
<body>
	<%@include file="/nav.jsp"%>
	<!--로그인한 세션 가져오기-->
	<%
		if (session== null) {
			response.sendRedirect("/member/view/loginForm.jsp?err=deny");
			return;
		}
	
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");	
		
		if (user == null) {
			response.sendRedirect("/member/view/loginForm.jsp?err=deny");
			return;
		}
		%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>
							<span>My Account</span>
						</h3>
					</div>
					<form method="post" action="/mypage/pro/editMyAccount.jsp" onsubmit="return pwdCheck();">
						<div class="panel-body">
							<div class="form-group ">
							<div class="form-group">
								<label>Membership</label>
								<div class="btn-group">
									<button class="btn <%=user.getGrade().equals("Silver") ? "btn-info" : ""%>" disabled="disabled">Silver</button>
									<button class="btn <%=user.getGrade().equals("Gold") ? "btn-info" : ""%>" disabled="disabled">Gold</button>
									<button class="btn <%=user.getGrade().equals("VIP") ? "btn-info" : ""%>" disabled="disabled">VIP</button>
								</div>
							</div>
								<label>Email</label> <input type="text" class="form-control" id="disabledId" name="disabledId" value="<%=user.getId()%>" disabled>
							</div>
							<div class="form-group ">
								<label>Name</label> <input type="text" class="form-control" id="disabledName" name="disabledName" value="<%=user.getName()%>" disabled>
							</div>
							<div class="form-group ">
								<label>Phone</label> <input type="text" class="form-control" id="updatePhone" name="updatePhone" value="<%=user.getPhone()%>">
							</div>
							<div class="form-group ">
								<label>Birthday</label> <input type="text" class="form-control" 	id="updateBirth" name="updateBirth" value=" <%=user.getBirth()%>">
							</div>
							<div class="form-group">
								<label>Address</label> <input type="text" class="form-control" id="updateAddr" name="updateAddr" value="<%=user.getAddr()%>">
							</div>
							<div class="form-group">
								<label>Point</label> <input type="text" class="form-control" 	id="disabledPoint" name="disabledPoint" value="<%=user.getTotalPoint()%>" disabled="disabled">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="text" class="form-control" id="pw" name="pw" placeholder="최소 1개의 대문자를 포함한 영문자+숫자+특수문자를 조합한 6자리 이상 ">
							</div>
							<div class="form-group">
								<label>Confirm Password</label> <input type="text" 	class="form-control" id="confirmPw" name="confirmPw" placeholder="enter password">
							</div>
						</div>
						<div class="panel-footer">
							<button type="submit" class="btn btn-info btn-lg btn-block">
								<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function pwdCheck() {
		var pw = document.getElementById("pw").value.trim();
		var confirmPw = document.getElementById("confirmPw").value.trim();
		
		// 비밀번호가 공백인지 체크
		if (pw == "" || confirmPw == "") {
			alert("비밀번호를 입력하세요");
			document.getElementById("pw").focus();
			return false;
		}
		
		var pattern2 = /^(?=.*[a-zA-Z])(?=.*[$@#!%*?&+-=])(?=.*[0-9]).{6,}$/;
		if (!pattern2.test(pw)) {
			alert("최소 1개의 대문자와 소문자, 숫자, 특수문자를 포함한 6글자 이상의 비밀번호를 입력해야 합니다.");
			document.getElementById("pw").focus();
			return false;
		}

		if (confirmPw != pw) {
			alert("비밀번호를 다시 확인해주세요");
			document.getElementById("pw").focus();
			return false;
		}

		return true;
		alert("로그인화면으로 돌아갑니다");
		location.href='/main.jsp?logout&edit';
	}
</script>
</html>