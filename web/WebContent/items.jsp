<%@page import="vo.UserVO"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession(false);
	if (session == null) {
		response.sendRedirect("loginform.jsp?err=deny");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?err=deny");
		return;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Item List</title>
<style type="text/css">
</style>
</head>
<body>
<div class="container">
<h1>Product List</h1>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Maker</th>
			<th>Price</th>
			<th>PubDate</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<%
		ItemDAO dao = new ItemDAO();
		ArrayList<ItemVO> items = dao.getAllItems();
		
		for (ItemVO item : items) {	
	%>	
		<tr>
			<th><%=item.getName() %></th>
			<th><%=item.getMaker() %></th>
			<th><%=item.getPrice() %></th>
			<th><%=item.getPubdate() %></th>
			<th><a href="addcart.jsp?ino=<%=item.getNo()%>">장바구니 담기</a></th>
		</tr>
	<%
		}
	%>
	</tbody>
</table>
<form action="main.jsp">
<p class="text-right padding-left: 10px;">
<button>홈</button>
<input type="reset" value="Cancel" onClick="history.back()"/>
</p>
</form>
</div>
</body>
</html>