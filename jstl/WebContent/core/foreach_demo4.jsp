<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h1>Core 태그 라이브러리의 forEach 태그</h1>
		<hr />
		
		<table class="w3-table-all">
			<thead>
				<tr>
					<th>index</th>
					<th>count</th>
					<th>first</th>
					<th>last</th>
					<th>name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="name" items="${names }" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${status.count}</td>
						<td>${status.first}</td>
						<td>${status.last}</td>
						<td>
						<c:if test="${status.first }">
							<strong class="text-danger">${name }</strong>
						</c:if>
						<c:if test="${not status.first }">
							${name }
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
		<hr />
	</div>
</body>
</html>