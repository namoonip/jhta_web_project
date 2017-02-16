<%@page import="dao.MemberDAO"%>
<%@page import="dao.itemRegisterDAO"%>
<%@page import="dao.ItemDetailDAO"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.util.Random"%>
<%@page import="vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CartDAO"%>
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
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file="/nav.jsp" %>
	<%
		if (session == null) {
			
			response.sendRedirect("/member/view/loginForm.jsp");
			return;
			
		}
	
		String[] no = request.getParameterValues("no");
		String[] qty = request.getParameterValues("qty");
		String deliveryPrice = request.getParameter("deliveryPrice");
		CartDAO dao = new CartDAO();
		ArrayList<CartVO> cartList = null;
		UserVO user = (UserVO)session.getAttribute("LOGINED_USER");
	%>
		<div class="container">
			<div class="jumbotron text-center">
				<p>주문서 작성</p>
				<h6 hidden="false" id="userId"><%=user.getId() %></h6>
			</div>
			<div class="row">
				<table class="table table-striped table-hover text-center">
					<thead>
						<tr>
							<th class="text-center">상품정보</th>
							<th class="text-center">판매가</th>
							<th class="text-center">수량</th>
							<th class="text-center">배송구분</th>
							<th class="text-center">합계</th>
						</tr>
					</thead>
					<tbody>
				<%
				MemberDAO memberDAO = new MemberDAO();
				UserVO userVO = memberDAO.getUserByNo(user.getNo()); 
				itemRegisterDAO itemDAO = new itemRegisterDAO();
				int totalPrice = 0;
				for (int i=0; i<no.length; i++) {
					
					int productNumber = Integer.parseInt(no[i]);
					int counts = Integer.parseInt(qty[i]);
					cartList = dao.finalCart(user.getNo(),productNumber);
					for (CartVO cart : cartList) {

						totalPrice += cart.getItem().getPrice()*counts;
				%>
						<tr class="trCount">
							<td hidden="false">
								<h6 hidden="false" class="itemNo"><%=cart.getItem().getItemNo() %></h6>
								<h6 hidden="false" class="counts"><%=itemDAO.getItemByNo(cart.getItem().getItemNo()) %></h6>
							</td>
							<td>
								<div class="row">
									<strong><%=cart.getItem().getName() %></strong>
								</div>
								<div class="row">
									<small><span id="color"><%=cart.getColor() %></span>,<span id="size"><%=cart.getSize() %></span></small>
								</div>
							</td>
							<td>
								<%=cart.getItem().getPrice() %>
							</td>
							<td class="count">
								<%=counts %>
							</td>
							<td>
								기본배송
							</td>
							<td>
								<%=cart.getItem().getPrice()*counts%>
							</td>
						</tr>
				<%
					}
				}
				%>
					</tbody>
				</table>
				<div class="well">
					<small>[기본배송]</small>
					<%
						if	(totalPrice < 50000)	{
					%>
							<small class="pull-right">상품구매금액<small> <%=totalPrice %>원</small> + 배송비<small> <%=deliveryPrice %>원</small> = 합계: <strong id="pricePointCheck"><%=totalPrice + Integer.parseInt(deliveryPrice) %></strong>원</small>
					<%
						}else {
					%>
							<small class="pull-right">상품구매금액<small> <%=totalPrice %>원</small> + 배송비<small> 0원</small> = 합계: <strong id="pricePointCheck"><%=totalPrice%></strong>원</small>
					<%
						}
					%>
				</div>
				<hr>
				<div class="well">
					<h4>주문자 정보</h4>
					<small class="pull-right"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"> 필수입력사항</span></small>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-10">
						<small class="pull-right">카드결제</small><input class="pull-right" type="checkbox" id="cardCheck">
					</div>
					<div id="cardContent" class="col-md-2 col-md-offset-10">
					</div>
				</div>
				<div class="well">
					<form class="form-horizontal">
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>주문하시는 분</label>
					    <div class="col-sm-3">
					      <input class="form-control" name="user-name" type="text" id="userName"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>주소</label>
					    <div class="col-sm-6">
					      <input class="form-control" name="user-addr" type="text" id="userAdd"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>전화번호</label>
					    <div class="col-sm-3">
					      <input class="form-control" name="user-phone" type="text" id="userPhone"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall">이메일</label>
					    <div class="col-sm-3">
					      <input class="form-control" name="user-email" type="text"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall">포인트 사용여부 </label>
					    <div class="col-sm-3">
					    	<input type="checkbox" id="pointCheck" />
					    	<div id="pointForm">
					    	</div>
					    	<div><small><strong>사용가능한 포인트:</strong></small><small id="userPoint"> <%=userVO.getPoint() %></small></div>
					    </div>
					  </div>
					  <div><small style="color:#B70000;" id="alertText"></small></div>
					</form>
				</div>
				<div class="well">
					<h4>배송지 정보</h4>
					<small class="pull-right"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"> 필수입력사항</span></small>
				</div>
				<div class="well">
					<form class="form-horizontal">
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall">배송지 선택</label>
					  	<label class="check-inline">
  							<input type="checkbox" id="isCheck"> <small><strong>주문 정보와 동일</strong></small>
						</label>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>받으시는 분</label>
					    <div class="col-sm-3">
					      <input class="form-control" name="delibery-name" type="text" id="deliberyName"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>주소</label>
					    <div class="col-sm-6">
					      <input class="form-control" name="delivery-add" type="text" id="deliveryAdd"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall"><span style="color:#B70000;" class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>전화번호</label>
					    <div class="col-sm-3">
					      <input class="form-control" name="delivery-phone" type="text" id="deliveryPhone"/>
					    </div>
					  </div>
					  <hr>
					  <div class="form-group form-group-sm">
					  	<label class="col-sm-2 control-label" for="formGroupInputSmall">배송 메세지</label>
					    <div class="col-sm-10">
					      <textarea class="form-control" name="delivery-etc" id="deliveryEtc" rows="3"></textarea>
					    </div>
					  </div>
					</form>
				</div>
				<div class="well">
					<h4>결제 예정 금액</h4>
				</div>
				<div class="well">
					<table class="table table-striped table-hover text-center">
						<tr>
							<th class="text-center">총 주문 금액</th>
							<th class="text-center">할인금액</th>
							<th class="text-center">총 결제예정 금액</th>
						</tr>
						<tr>
							<td><strong id="totalPrice"><%=totalPrice+Integer.parseInt(deliveryPrice) %></strong> 원</td>
							<td><strong id="salePrice">0</strong> 원</td>
							<td><strong id="finalPrice"><%=totalPrice+Integer.parseInt(deliveryPrice) %></strong> 원</td>
						</tr>
					</table>
				</div>
				<form id="nextForm" method="post" action="addBuy.jsp"></form>
				<input type="hidden" id="overPoint" value="Y">
				<input type="hidden" id="deletePoint" value="Y">
				<button onclick="check();" style="margin-left:5px;" type="submit" class="w3-btn w3-white w3-border w3-round-large w3-hover-black pull-right">결제 하기</button>
			</div>
		</div>
	<%@include file="/footer.jsp" %>
</body>
<script src="/js/cartRegisterJavaScript.js"></script>
</html>