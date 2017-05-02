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
<script type="text/javascript">
	$(function() {
		
		$.ajax({
			type:"GET",
			url:"../jQuery/book.do?no=23",
			dataType:"xml",
			success: function(xmlDoc) {
				$("#span1").text($(xmlDoc).find('title').text());
				$("#span2").text($(xmlDoc).find('author').text());
				$("#span3").text($(xmlDoc).find('price').text());
			}
		});
		
	})
</script>
</head>
<body>
	<div class="container">
		<p>제목 : <span id="span1"></span></p>
		<p>저자 : <span id="span2"></span></p>
		<p>가격 : <span id="span3"></span></p>
	</div>
</body>
</html>