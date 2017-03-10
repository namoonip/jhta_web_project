<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('button').click(function() {
			$.ajax({
				type:"GET",
				url:"../getData",
				dataType:"jsonp",
				jsonp:'callback', // 콜백 메서드의 이름을 적는다.
				success: function(data) {
					// stringify는 json객체를 다시 text로 변환
					console.log(JSON.stringify(data));
				}
			});
		});
	})
</script>
</head>
<body>
 <div class="container">
 	<h1>사원 정보</h1>
 	<div><button>조회하기</button></div>
 	<div id="view-box"></div>
 </div>
</body>
</html>