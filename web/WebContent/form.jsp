<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Form</title>
<style type="text/css">
	div#wrapper {width: 300px; margin-left: 15px;}
	label {display: inline-block; width: 120px;}
</style>
</head>
<body>
<div id="wrapper">
	<h1>Sign Up</h1>
	<form method="post" action="register.jsp">
		<p><label>ID</label> <input type="text" name="id" /></p>
		<p><label>PASSWORD</label> <input type="password" name="pwd" /></p>
		<p><label>NAME</label> <input type="text" name="name" /></p>
		<p><label>PHONE</label> <input type="text" name="phone" /></p>
		<p><label>ADDRESS</label> <input type="text" name="addr" /></p>
		<p style="text-align: right;"><button>Sign up</button>
		<input type="reset" value="Cancel" onClick="history.back()"/></p>
	</form>
</div>
</body>
</html>