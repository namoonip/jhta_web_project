<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<fmt:bundle basename="bundle.message">
	<fmt:message key="login.hint.id" var="idhint"/>
	<fmt:message key="login.hint.pwd" var="pwdhint"/>
	
	<div class="container">
	
		<h1><fmt:message key="login.title"/></h1>
		
		<form action="login.jsp" method="post">
			<div class="form-group">
				<label for="user-id"><fmt:message key="login.label.id"/></label>
				<input type="text" class="form-control" name="userid" placeholder="${idhint }"/>
			</div>
			<div class="form-group">
				<label for="user-pwd"><fmt:message key="login.label.pwd"/></label>
				<input type="password" class="form-control" name="userpwd" placeholder="${pwdhint }"/>
			</div>
			<div class="form-group">
				<button class="w3c-btn" type="submit"><fmt:message key="login.btn"/></button>
			</div>
		</form>
		
	</div>
</fmt:bundle>
</body>
</html>