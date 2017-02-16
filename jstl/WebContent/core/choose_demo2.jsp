<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container">
		<div class="text-center">
			<p>현재 페이지 번호 : ${param.pno}</p>
		
			<ul class="pagination">
				<c:forEach var="num" begin="1" end="10">
					<c:choose>
						<c:when test="${param.pno eq num }">				
							<li class="active"><a href="choose_demo2.jsp?pno=${num}">${num}</a></li>
						</c:when>
						<c:otherwise>							
							<li><a href="choose_demo2.jsp?pno=${num}">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<hr />
			
			<ul class="pagination">
				<c:forEach var="num" begin="1" end="10">
					<c:if test="${param.pno eq num }">			
						<li class="active"><a href="choose_demo2.jsp?pno=${num}">${num}</a></li>
					</c:if>
					<c:if test="${param.pno ne num }">			
						<li><a href="choose_demo2.jsp?pno=${num}">${num}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>