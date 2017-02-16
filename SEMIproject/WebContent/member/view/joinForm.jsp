<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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

.panel-heading {
	text-align: center;
}

.btn btn-default {
	text-align: right;
}

.glyphicon glyphicon-ok {
	color: blue;
}
.btn{    
    background-color: #000000;
    border: none;
    color: white;
    padding: 10px 14px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
   text-align: right;
}
</style>
</head>
<body>
	<%@include file="/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>
							<span>Create an Account</span>
						</h3>
					</div>
					<div class="panel-body">
						<form method="post" id="loginform" action="/member/pro/join.jsp" onsubmit="return formcheck();">
							<div class="form-group">
								<label for="">*Email</label> <input type="text" class="form-control" id="id" name="id" onkeyup="duplicateCheck();" placeholder="Email Please!" />								
								<!-- 중복체크 결과 -->
								<input type="hidden" id="dupcheckResult" value="">
								<div id="result-box"></div>
							</div>							
							<div class="form-group ">
								<label>*Password</label>
								<input type="password" class="form-control" id="pw" name="pw" placeholder="최소 1개의 대문자를 포함한 영문자+숫자+특수문자를 조합한 6자리 이상">
							</div>
							<div class="form-group ">
								<label>*Confirm Password</label>
								<input type="password" class="form-control" id="confirmPw" name="confirmPw" placeholder="비밀번호를 재입력해주세요">
							</div>
							<div class="form-group ">
								<label>*Name</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요">
							</div>
							<div class="form-group ">
								<label>*Phone</label>
								<input type="text" class="form-control" id="phone" name="phone" placeholder="010-***-****">
							</div>							  	
							<div class="form-group ">
								<label>*Address</label>
								<input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력해주세요">
							</div>
							<div class="form-group ">
								<label>Birthday</label>
								<input type="date" class="form-control" id="birth" name="birth" placeholder="생일을 선택하세요">
							</div>
							<div class="col-sm-offset-5 col-sm-10">
								<button type="submit" class="w3-btn w3-round-xlarge" id="sumbitBtn" name="sumbitBtn" ><span>JOIN</span></button>
							</div>							
							<div class="form-group">
								<p  style="color:IndianRed">Already a member?</p><a href="/member/view/loginForm.jsp" class="w3-btn w3-white w3-border w3-border-black w3-round-xlarge"><span>LOGIN NOW</span></a>
							</div>							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function duplicateCheck() {
		
		var id = document.getElementById("id").value;		
		var dupcheckResultEL = document.getElementById("dupcheckResult");
	
		// XHR생성
		var xhr = new XMLHttpRequest();
		
		// XHR에 콜백함수등록
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			if (xhr.readyState == 4 && xhr.status == 200) {				
				var idcheckResult = xhr.responseText;
			
				var box = document.getElementById("result-box");
				
				if (idcheckResult == "Y") {
					box.innerHTML = "<p class='text-danger'>이미 사용중인 아이디입니다.</p>";
					dupcheckResultEL.value = 'Y';
				} else if (idcheckResult == "N") {
					box.innerHTML = "<p class='text-success'>사용가능한 아이디입니다.</p>";
					dupcheckResultEL.value = 'N';					
				}
			}
		}
		
		// XHR에게 요청 URL 지정하기
		xhr.open("GET", "/member/pro/idcheck.jsp?id=" + id);

		// 서버에게 요청하기
		xhr.send(null);	
	}
	
	function formcheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var confirmPw = document.getElementById("confirmPw").value;		
		var name = document.getElementById("name").value;
		var phone = document.getElementById("phone").value;
		var birth = document.getElementById("birth").value;
		var addr = document.getElementById("addr").value;
		var dupcheckResult = document.getElementById("dupcheckResult").value;
		
	  	// 이메일체크
		if (id == "") {
			alert("이메일을 입력해주세요.");
			document.getElementById("id").focus();
			return false;
		}

		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if (!pattern.test(id)) {
				alert("올바른 이메일 형식이 아닙니다.");
				document.getElementById("id").focus();
				return false;
		}
		
		if (dupcheckResult != 'N') {
			alert("이미 사용중인 아이디 입니다.");
			document.getElementById("id").focus();		
			return false;
		}	
								
		// 패스워드가 최소1개의 대문자와 특수문자+영문자+숫자=6자리 이상 입력되었는지		
		if (pw == "") {
			alert("비밀번호를 입력해주세요.");
			document.getElementById("pw").focus();
			return false;
		}
		
		var pattern2 = /^(?=.*[a-zA-Z])(?=.*[$@#!%*?&+-=])(?=.*[0-9]).{6,}$/;
		if (!pattern2.test(pw)) {
			alert("최소 1개의 대문자와 소문자, 숫자, 특수문자를 포함한 6글자 이상의 비밀번호를 입력해야 합니다.");
			document.getElementById("pw").focus();
			return false;
		}
		
		if (confirmPw == "") {
			alert("비밀번호를 재입력해주세요.");
			document.getElementById("confirmPw").focus();
			return false;
		}
		
		//패스워드와 컨펌 패스워드가 일치하는지
		if (pw != confirmPw) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
			document.getElementById("pw").focus();
			return false;
		}
		
		// 이름이 2글자 이상 입력되었는지
		if (name == "") {
			alert("이름을 입력해주세요.");
			document.getElementById("name").focus();
			return false;
		}
		
		var pattern3=/^[a-zA-Z]|[가-힣]{2,10}$/;
		if (!pattern3.test(name)) {
			alert("이름을 올바르게 입력해주세요");
			document.getElementById("name").focus();
			return false;
		}
		
		// 올바른 전화번호 형식인지 	
		var pattern4 = /^\d{2,3}-\d{3,4}-\d{4}$/;	
		if(!pattern4.test(phone)) {
			alert("올바른 연락처를 입력하세요");
			document.getElementById("addr").focus();
			return false;
		}
		
		// 주소를 입력했는지
		if (addr == " ") {
			alert("주소를 입력해주세요.");
			document.getElementById("addr").focus();
			return false;
		}		
		return true;
	}
	</script>
</html>
