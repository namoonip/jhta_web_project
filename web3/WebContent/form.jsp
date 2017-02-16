<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>form</title>
</head>
<body>
	<div class="container">
		<div class="w3-panel" style="padding: 40px; border: 1px solid;">
			<div class="panel-heading" style="padding: 20px;">
				<h1>회원 가입 폼</h1>
			</div>
			<form action="post" action="register.jsp">
				<div class="form-group">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="user-id" name="userid" onkeyup="duplicateCheck()"/>
					<div id="result-box"></div>
				</div>
				<div class="form-group">
					<label for="">이름</label>
					<input type="text" class="form-control" id="user-name" name="username"/>
				</div>
				<div class="form-group pull-right">
					<button type="submit" class="w3-btn">전송</button>
				</div>
			</form>
		</div>	
	</div>
</body>
<script type="text/javascript">
	function duplicateCheck() {
		var userid = document.getElementById('user-id').value;
			//console.log(userid);
		
		// 1. XHR 생성하기
		var xhr = new XMLHttpRequest(); // Chrome, IE7+, Safari, Opera
		
		// 4. XHR에서 이벤트 바랭시 실행될 콜백함수 등록하기
		xhr.onreadystatechange = function() {
			//console.log(xhr.readyState);
			if(xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText.trim();
				console.log('중복여부:', result);
				
				var box = document.getElementById('result-box');
				
				if(result == "Y") {
					box.innerHTML = "<p class='text-danger'>이미 사용중인 아이디 입니다.</p>";
				} else if (result == "N") {
					box.innerHTML = "<p class='text-success'>사용가능한 아이디 입니다.</p>";
				}
			}
		}
		
		// 2. XHR에게 요청 URL 지정하기
		xhr.open("GET", "check.jsp?userid=" + userid);
		
		// 3. 서버에게 요청을 보내기("get방식일 때 url뒤의 값이 null이기 때문에 null을 사용한다.")
		xhr.send(null);
	}
</script>
</html>