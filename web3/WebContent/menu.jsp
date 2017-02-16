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
<title>Example</title>
</head>
<body>
<div class="w3-container">
	<h1>TV에 나올 맛집</h1>
	<div class="w3-panel">
		<label for="kind-box" class="w3-label">종류</label>
		<select name="kindbox" id="kind-box" class="w3-select" onchange="getMenu();">
			<option value="" selected>-- 선택하세요 --</option>
			<option value="kr"> 한식</option>
			<option value="ch"> 중식</option>
			<option value="jp"> 일식</option>
		</select>
	</div>
	
	<div class="w3-panel">
		<label for="menu-box" class="w3-label">메뉴  </label>
		<select name="menubox" id="menu-box" class="w3-select">
			<option value="" selected>-- 종류를 먼저 선택하세요 --</option>
			
		</select>
	</div>
</div>
<script type="text/javascript">
	function getMenu() {
		// 선택된 중류 가져오기
		var kind = document.getElementById('kind-box').value;
		if(kind) {
			// xhr 생성하기
			var xhr = new XMLHttpRequest();
			
			// xhr에 콜백함수 등록하기
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// 서버가 보낸 응답 데이터 처리하기
					var data = xhr.responseText;
					console.log(data);
					var menuItems = data.split(',');
					
					var selectContents = "";
					for (var i=0; i<menuItems.length; i++) {
						selectContents += "<option value="+i+">"+menuItems[i]+"</option>"
					}
					
					document.getElementById('menu-box').innerHTML = selectContents;
				}
			}
		
			// xhr 초기화
			xhr.open("GET", "menuitem.jsp?kind=" + kind);			
					
			// xhr 전송하기
			xhr.send(null);
		}
	}
</script>
</body>
</html>