<%@page import="vo.UserVO"%>
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
	<div class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="list.jsp?pno=1" class="navbar-brand">Todo App</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="list.jsp?pno=1"><span class="glyphicon glyphicon-home">Home</span></a></li>
				<li><a href="list.jsp?pno=1"><span class="glyphicon glyphicon-th-list">TodoList</span></a></li>				
				<li><a href="showGallery.jsp"><span class="glyphicon glyphicon-picture">Gallery</span></a></li>
				<li><a href="bloglist.jsp"><span class="glyphicon glyphicon-blackboard">BulletinBoard</span></a></li>
				<li><a href="logoutProcess.jsp"><span class="glyphicon glyphicon-off">Logout</span></a></li>
			</ul>		
		</div>
	</div>
</body>
</html>