<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<% 
	String err = request.getParameter("err");
	String errMsg = "";
	if(err != null) {
		if(err.equals("fail")) {
			errMsg = "아이디 혹은 비밀번호가 일치하지 않습니다.";
		}
		if(err.equals("deny")) {
			errMsg = "로그인 후 이용 가능합니다.";
		}
%>
		<p style="font-style: italic; color:red; font-size: medium;"><strong><%=errMsg %></strong></p>
<%
	}
%>
</body>
</html>