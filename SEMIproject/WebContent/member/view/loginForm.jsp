<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
#loginbtn{
text-align: pull-right
}
</style>
</head>
<body>
<%@include file="/nav.jsp" %>
<% 
	if(isLogined) {
	session.invalidate();
	}
   String err = request.getParameter("err");
   if(err != null) {
	   if(err.equals("deny")) {
	%>
	      <script type="text/javascript"> alert("로그인 후 이용 가능합니다.");</script>
	<%
	      }
	   }
	%>
	<div class="container">
		<br /><br />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Sign In</h3>
						</div>
					<div class="panel-body">
							<div class="checkbox">
								<label><input type="checkbox"> Remember me </label>
							</div>
						<form class="form-inline" action="/member/pro/login.jsp">
							
							<div class="input-group col-xs-5">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								 <input id="email" type="text" class="form-control" name="email" placeholder="Email Please!">
							</div>
							<div class="input-group col-xs-5">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
								<input id="password" 	type="password" class="form-control" name="password" placeholder="Password Please!">
							</div>							
							
							<button type="submit" class="w3-btn w3-round-xlarge" id="loginbtn"> LOGIN</button><br/>
							
							<a href="SearchMyPwForm.jsp" style="color:IndianRed">Forgot Password?</a>							
							<br/><br/>
 						 	<h5>New Customer?</h5>
  							<a href="/member/view/termsnconditionsForm.jsp" class="w3-btn w3-white w3-border w3-border-black w3-round-xlarge w3-btn-block">JOIN</a> 
  							<br/><br/>  							
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2">				
			</div>
		</div>
	</div>
</body>
</html>

