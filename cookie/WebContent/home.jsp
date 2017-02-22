<%@page import="util.CookieUtil"%>
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
		<div class="row">
			<div class="col-sm-8">
				<h2>새 상품</h2>
				<ul class="list-group">
					<li class="list-group-item"><a href="product.jsp?name=macbook">macbook</a></li>
					<li class="list-group-item"><a href="product.jsp?name=ipad">ipad</a></li>
					<li class="list-group-item"><a href="product.jsp?name=iphone7">iphone7</a></li>
					<li class="list-group-item"><a href="product.jsp?name=galaxynote7">galaxynote7</a></li>
					<li class="list-group-item"><a href="product.jsp?name=v20">v20</a></li>
					<li class="list-group-item"><a href="product.jsp?name=crema">crema</a></li>
				</ul>
			</div>
			<div class="col-sm-4">
				<h2>최근 본 상품</h2>
				<ul class="list-group">
						
				<%Cookie[] cookies = request.getCookies();
					String cookieValue = CookieUtil.getValue(cookies, "recent-product");
					
					String[] valueArr = cookieValue.split(":");
					String[] valueBackArr = new String[valueArr.length];
					for(int i=0; i<valueArr.length; i++) {
						valueBackArr[valueArr.length-i-1] = valueArr[i];
					}
					for(String value : valueBackArr) {%>						
						<li class="list-group-item"><%=value %></li>					
				<%	}%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>