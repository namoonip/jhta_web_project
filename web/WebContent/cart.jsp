<%@page import="vo.ItemVO"%>
<%@page import="vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ItemDAO"%>
<%@page import="vo.UserVO"%>
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
<title>Cart</title>
</head>
<body>
	<%
		// 로그인한 사람의 정보 차지
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("loginform.jsp?err=deny");
			return;
		}
		// HttpSession객체에서 사용자 정보가 저장된 객체 가져오기
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
		if (user == null) {
			response.sendRedirect("loginform.jsp?err=deny");
			return;
		}
		
		// 아이디를 통해 Cart의 정보를 가져요기
		ItemDAO dao = new ItemDAO();
		ArrayList<CartVO> cartItems = dao.getCartItemsByUser(user.getId());
		
	%>
	<div class="container">
		<h1>장바구니</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Maker</th>
					<th>Price</th>
					<th>Register Date</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
	<%
		if(!cartItems.isEmpty()) {
			for (CartVO cart:cartItems) {
				ItemVO item = cart.getItem();
	%>
				<tr>
					<td><%=item.getName() %></td>
					<td><%=item.getMaker() %></td>
					<td><%=item.getPrice() %></td>
					<td><%=cart.getRegdate() %></td>
					<td><a href="delete.jsp?cno=<%=cart.getNo()%>">Delete</a></td>
				</tr>
	<%
			}
		} else {
	%>
				<tr>
					<td colspan="4" class="text-center">장바구니에 등록된 상품이 없습니다.</td>
				</tr>	
	<%			
		}
	%>		
	</tbody>
	</table>
	<p class="text-right"><a href="items.jsp">쇼핑 계속하기</a></p>
	</div>
</body>
</html>