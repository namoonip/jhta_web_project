<%@page import="java.util.Date"%>
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
<c:set var="today" value="<%=new Date()%>"/>
<div class="container">
	<h1>fmt 태그 라이브러리 formatDate</h1>
	
	<p>날짜 : <fmt:formatDate value="${today }" type="date"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" type="time"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" type="both"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd hh:mm:ss"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy년 M월 d일"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE a"/> </p>
	<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE a hh:mm:ss"/> </p>
	
</div>
</body>
</html>