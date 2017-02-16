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
	<div class="w3-container w3-margin">
		<h3>사원 정보</h3>
		<div class="w3-panel">
			<table class="w3-table w3-striped w3-border">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원명</th>
						<th>이메일</th>
						<th>소속부서</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${emp.id }</td>
						<td>${emp.name }</td>
						<td>${emp.email }</td>
						<td>${emp.dept}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>