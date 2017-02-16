<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
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
<title>sample</title>
</head>
<body>
<%
	List<ProductVO> productList = Arrays.asList(
			new ProductVO(1, "ipad pro", 800000),
			new ProductVO(3, "macbook", 2600000),
			new ProductVO(5, "ipad mini", 600000),
			new ProductVO(22, "imac", 3000000),
			new ProductVO(26, "iphone 6s", 850000),
			new ProductVO(31, "ipod", 200000),
			new ProductVO(36, "mac pro", 3700000));
%>
	<div class="container">
		<h1>장바구니 리스트</h1>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>선택</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
			<%
			for (ProductVO p : productList) {
			%>
				<tr>
					<td><input type="checkbox" name="pno" value="<%=p.getNo()%>"/></td>
					<td><%=p.getName() %></td>
					<td><%=p.getPrice() %></td>
					<td><input type="number" id="qty-field-<%=p.getNo()%>" value="1"></td>
				</tr>
			<%	
			}
			%>
			</tbody>
		</table>
		
		<div class="text-right">
			<button class="btn btn-success" onclick="addFormEL()">구매하기</button>
		</div>
	
		<form id="order-form" method="post" action="order.jsp"></form>
	</div>
	
	<script type="text/javascript">
		function addFormEL() {
			
			var html = "";	
		
			var checkboxList = document.getElementsByName("pno");
			for (var i=0; i<checkboxList.length; i++) {
				var checkbox = checkboxList[i];
				if (checkbox.checked) {
					var productNo = checkbox.value;
					var qty = document.getElementById('qty-field-' + productNo).value;
					
					html += '<input type="hidden" name="pno" value="'+productNo+'">';
					html += '<input type="hidden" name="qty" value="'+qty+'">';
				}				
			}
			
			var form = document.getElementById('order-form');
			form.innerHTML = html;
			form.submit();
		}
	</script>
	
</body>
</html>
<%!
	class ProductVO {
		private int no;
		private String name;
		private int price;
		
		public ProductVO(int no, String name, int price) {
			this.no = no;
			this.name = name;
			this.price = price;
		}
		public int getNo() {return no;}
		public String getName() {return name;}
		public int getPrice() {return price;}
	}
%>





