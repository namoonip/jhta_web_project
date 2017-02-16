<%@page import="vo.ItemVO"%>
<%@page import="dao.itemRegisterDAO"%>
<%@page import="vo.CartVO"%>
<%@page import="dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="nav.jsp" %>
	
	<%
	
		if (session == null) {
			response.sendRedirect("/member/view/loginForm.jsp");
			return;
		}
	
		CartDAO dao = new CartDAO();
		UserVO user = (UserVO)session.getAttribute("LOGINED_USER");
		ArrayList<CartVO> cartList = dao.testCart(user.getNo());
		
	%>
	<div class="jumbotron text-center">
		<p>my cart</p>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="text-right">
					<table class="table table-striped table-hover text-center">
						<thead>
							<tr>
								<th class="text-center">
									<input id="checkbox" type="checkbox" checked="checked">
								</th>
								<th class="text-center">productName</th>
								<th class="text-center">count</th>
								<th class="text-center">price</th>
								<th class="text-center"></th>
							</tr>
						</thead>
						<tbody>
						<% 
							for (CartVO cart : cartList) {
								itemRegisterDAO itemDAO = new itemRegisterDAO();
								int count = itemDAO.getItemByNo(cart.getItem().getItemNo());
						%>
							<tr>
								<td>
									<input name="isCheck" type="checkbox" checked="checked"  value="<%=cart.getCartNo() %>">
								</td>
								<td>
									<div class="row">
										<span class="itemName"><%=cart.getItem().getName()%></span>
									</div>
								<hr>
									<div class="row">
										<small><%=cart.getColor() %>,<%=cart.getSize() %></small>
									</div>
								</td>
								<td>
									<small class="counts" id="qty-<%=cart.getItem().getItemNo()%>">
										<%=cart.getCount() %>
							          </small>
								</td>
								<td class="price"><%=cart.getItem().getPrice() %></td>
								<td class="text-center">
									<a href="deleteCartProcess.jsp?dno=<%=cart.getCartNo() %>" class="btn btn-default btn-xs">상품 삭제</a>
								</td>
								<td hidden="false">
									<small hidden="false" class="itemCount"><%=count %></small>
								</td>
							</tr>
						<%
							}
						%>
						</tbody>	
					</table>
					<hr>
					<p align="center">
					<button onclick="generateForm();" class="btn btn-default btn-md" >상품 주문</button>
					</p >
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<div class="well">
								<p class="text-center">상품 최종금액: <span id="productPrice"></span>원 + 배송료 <span id="delivery">2500</span>원  합산금액 <span id="totalPrice"></span>원</p>
								<p class="text-center" style="color:red;">총 구매금액이 5만원 이상이면 배송비가 무료입니다.</p>
							</div>
						</div>
					</div>
				</div>
				<form id="my-form" method="post" action="cartRegister.jsp">
				</form>
			</div>
		</div>
	</div>
	<hr>
	<%@include file="footer.jsp" %>
</body>
<script src="/js/cartJavaScript.js"></script>
</html>