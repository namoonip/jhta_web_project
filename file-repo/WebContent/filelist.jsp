<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1>파일 리스트</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th>순번</th>
					<th>파일명</th>
					<th>사이즈</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%
				// 디렉토리 정보를 가지는 File 객체 생성
				File directory = new File("c:/web_project/repo");
				File[] fileList = directory.listFiles();
				for (int i=0; i<fileList.length; i++) {
					File file = fileList[i];
					
					String filename = file.getName();
					long filesize = file.length();
					// 날짜를 long 타입으로 반환하는 lastModified();
					Date createDate = new Date(file.lastModified()); %> 
				<tr>
					<td><%=i+1 %></td>
					<td><a href="download?name=<%=filename %>"><%=filename %></a></td>
					<td><%=filesize %> 바이트</td>
					<td><%=createDate.toLocaleString() %></td>
				</tr>			
			<%	}%>
			</tbody>
		</table>
	</div>
</body>
</html>