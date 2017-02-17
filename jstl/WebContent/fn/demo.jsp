<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Example</title>
</head>
<body>
	<c:set var="productName" value="Galaxy 7"/>
	<c:set var="email" value="jhta1234@yahoo.co.kr"/>
	<c:set var="files" value="메모.txt,자기소개.ppt,이력서.doc"/>
	
	<div class="container">

		<p>상품명 : ${fn:toUpperCase(productName) }</p>
		<p>상품명 : ${fn:toLowerCase(productName) }</p>
		
		<p>계정명 : ${fn:substring(email, 0, 6) }</p>
		<p>계정명 : ${fn:substring(email, 0, fn:indexOf(email, "@")) }</p>
		<p>호스트명 : ${fn:substringAfter(email, "@") }</p>
		<hr />
		
		<c:forEach var="filename" items="${fn:split(files, ',') }">
			<p>
				<c:choose>
					<c:when test="${fn:endsWith(filename, 'txt')}">
					${filename }<i class="fa fa-file-text-o"></i>
					</c:when>	
					<c:when test="${fn:endsWith(filename, 'ppt')}">
					${filename }<i class="fa fa-file-pdf-o"></i>
					</c:when>
					<c:when test="${fn:endsWith(filename, '')}">
					${filename }<i class="fa fa-file-o"></i>
					</c:when>
				</c:choose>
			
			</p>
		</c:forEach>
	</div>
</body>
</html>