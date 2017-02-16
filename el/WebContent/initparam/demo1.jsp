<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Example</title>
</head>
<body>
	<h1>initParam ...</h1>
	
	<p>회사명 : ${initParam.company }</p>
	<p>주소 : ${initParam.address }</p>
	<hr />
	
	<p><img src="../${initParam.icon_path }/cat1.gif" alt="cat.img" /></p>
	<hr />
	
	<h2>pageContext ...</h2>
	<p>클라이언트 IP : ${pageContext.request.remoteAddr }</p>
</body>
</html>