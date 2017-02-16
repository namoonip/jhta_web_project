<%@page import="java.util.Date"%>
<%@page import="vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
	Book book = new Book(100, "이것이 자바다.", "신용권", "한빛 미디어", 35000, new Date());
	request.setAttribute("mybook", book);
%>
	<div class="container">
		<h1>Core 태그 라이브러리 set 태그</h1>
		<c:set var="name" value="홍길동" scope="page"/>
		<c:set var="owner" value="${name}"/>
		<c:set var="yourbook" value="${mybook }"/>
		
		<c:set target="${yourbook}" property="title" value="자바의 정석"/>
		
		<c:remove var="owner"/>

		<p>이름 : ${name}</p>
		<p>소유자 : ${owner}</p>
		<p>제목 : ${yourbook.title}</p>
		<p>제목 : ${mybook.title}</p>
	</div>
</body>
</html>
