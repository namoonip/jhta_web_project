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
<title>Login</title>
<style type="text/css">
	div#wrapper {width: 300px; margin-left: 15px;}
	label {display: inline-block; width: 100px;}
</style>
</head>
<body>
<div id="wrapper">
	<h1>Login Form</h1>
	
	<%
		String err = request.getParameter("err");
		String errorMessage = null;
		if (err != null) {
			if (err.equals("fail")) {
				errorMessage = "아이디 혹은 비밀번호가 올바르지 않습니다.";
			} else if (err.equals("deny")) {
				errorMessage = "해당 서비스는 로그인 후 사용 가능합니다.";
			}
		}

		if (errorMessage != null) {
	%> 
		<!-- div class="alert alert-danger"></div>  -->
		<p style="font-type:italic;color:red;"><%=errorMessage %></p>
	<%			
		}
	%>
	
	<form method="post" action="loginprocess.jsp">
		<p><label>ID</label> <input type="text" name="id" /></p>
		<p><label>PASSWORD</label> <input type="password" name="pwd" /></p>
		<p style="text-align: right;"><button>Login</button>
		<input type="reset" value="Cancel" onClick="history.back()"/></p>
	</form>
</div>
</body>
</html>