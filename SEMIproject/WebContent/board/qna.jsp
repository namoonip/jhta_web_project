<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<%@include file="../nav.jsp"%>
	<div class="container" style="padding-bottom: 180px">
		<div style="padding-bottom: 40px; padding-top: 60px; text-align: center;">
		<h3>Q&amp;A</h3>
		<p><strong style="font-size: 35px;"></strong>
			해당 게시판의 특성과 맞지 않는 게시물, <br />
			또한 관련성 없는 비방성의 글들은 임의로 삭제됩니다
		</p><br />
		</div>
		<div class="row">
			<div class="col-md-3" style="padding: 5px;">
				<a href="/board/product/productBoard.jsp?tno=1&pno=1"><img class="w3-opacity w3-hover-opacity-off" src="/board/boardImg/qna_exchange.gif" alt="img"/></a>
			</div>
			<div class="col-md-3" style="padding: 5px;">
				<a href="/board/product/productBoard.jsp?tno=2&pno=1"><img class="w3-opacity w3-hover-opacity-off" src="/board/boardImg/qna_change.gif" alt="img" /></a>
			</div>
			<div class="col-md-3" style="padding: 5px;">
				<a href="/board/product/productBoard.jsp?tno=3&pno=1"><img class="w3-opacity w3-hover-opacity-off" src="/board/boardImg/qna_product.gif" alt="img" /></a>
			</div>
			<div class="col-md-3" style="padding: 5px;">
				<a href="/board/product/productBoard.jsp?tno=4&pno=1"><img class="w3-opacity w3-hover-opacity-off" src="/board/boardImg/qna_etc.gif" alt="img" /></a>
			</div>
		</div>
	</div>
<%@include file="../../footer.jsp" %>
</body>
</html>