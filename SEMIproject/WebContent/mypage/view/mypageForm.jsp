<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.orderlistVO"%>
<%@page import="vo.CartVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
/* #editbtn{
    background-color: #000000;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
 */


}
</style>
</head>
<body>
	<%@include file="/nav.jsp"%>
	<!--로그인한 세션 가져오기-->
	<%
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
		String id = request.getParameter(user.getId());
		String begin = request.getParameter("startDate");
		String end = request.getParameter("endDate");
	%>
	<h3 align="center">My page</h3>
	<p align="center">회원정보 수정과 구매내역을 조회할 수 있습니다.</p>
	<div class="container">
		<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">

			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#myaccount" id="myaccount-tab" role="tab" data-toggle="tab" aria-controls="myaccount" aria-expanded="true">내정보수정</a></li>
				<li role="presentation"><a href="#mypoint" role="tab" id="mypoint-tab" data-toggle="tab" aria-controls="mypoint">구매이력확인</a></li>
				<li role="presentation"><a href="#box" role="tab" id="box-tab" data-toggle="tab" aria-controls="box">배송조회</a></li>
			</ul>

			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="myaccount" aria-labelledBy="myaccount-tab">
					<div class="container">
						<div class="">
							<div class="btn-group">
								<br/> <br />
								<!-- 삼항연산자 -->
								<button type="button" data-toggle="tooltip" data-placement="top" title="누적포인트 20만원 이상" <%=user.getGrade().equals("Silver") ? "class='btn btn-warning'" : "class='btn btn-default' "%>>Silver</button>
								<button type="button" data-toggle="tooltip" data-placement="top" title="누적포인트 20만원 이상 100만원 이하" <%=user.getGrade().equals("Gold") ? "class='btn btn-warning'" : "class='btn btn-default' "%>>Gold</button>
								<button type="button" data-toggle="tooltip" data-placement="bottom" title="누적포인트 100만원 이상" <%=user.getGrade().equals("VIP") ? "class='btn btn-warning'" : "class='btn btn-default' "%>>VIP</button>
								<br /> <br /><br />
							</div>
						</div>
						<table class="table table-hover">
						<!-- 	<thead>
								<tr>
									<th></th>
									<th></th>
								</tr>
							</thead> -->
							<tbody>
								<tr>
									<%
										MemberDAO dao = new MemberDAO();
										UserVO userInfo = dao.getUserByNo(user.getNo());
									%>
									<td>ID</td>
									<td><label id="id-field"><%=userInfo.getId()%></label></td>
								</tr>
								<tr>
									<td>Name</td>
									<td><label id="Name-field"><%=userInfo.getName()%></label></td>
								</tr>
								<tr>
									<td>Point</td>
									<td><label id="Point-field"><%=userInfo.getPoint()%></label></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td><label id="Phone-field"><%=userInfo.getPhone()%></label></td>
								</tr>
								<tr>
									<td>Address</td>
									<td><label id="Address-field"><%=userInfo.getAddr()%></label></td>
								</tr>
								<tr>
									<td>Birthday</td>
									<td><label id="Birthday-field"><%=userInfo.getBirth()%></label></td>
								</tr>
								<tr>
									<td></td>
									<td class="text-right"><label id="empty-field">
					<a href="/mypage/view/editMyAccountForm.jsp" class="btn btn-default" id="editbtn"><span class="glyphicon glyphicon-pencil" aria-hidden="true">Edit</span></a>
								</label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p>					
					</p>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="mypoint" aria-labelledBy="mypoint-tab">
					<br /> <br />
					<div class="container">
						<form action="/mypage/view/mypageForm.jsp">
							<p align="center">
								<span class="glyphicon glyphicon-search" aria-hidden="true">조회기간</span>
								<input type="date" id="start-date-field" name="startDate" value="" /> ~ <input type="date" name="endDate" id="end-date-field" value="" />
								<button type="submit" onclick="test()" class="btn btn-default btn-sm">검색</button>
							</p>
						</form>
						<p align="center">
							<button type="button" class="btn btn-default btn-xs" onclick="setOneWeek()" value="">1주일</button>
							<button type="button" class="btn btn-default btn-xs" onclick="setOneMonth() ">1개월</button>
							<button type="button" class="btn btn-default btn-xs" onclick="setThreeMonths()">3개월</button>
						</p>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>구매날짜</th>
								<th>상품명</th>
								<th>사이즈</th>
								<th>수량</th>
								<th>가격</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<%
									ArrayList<orderlistVO> list = new ArrayList<>();
									if (begin != null && end != null) {
										list = dao.getOrderlistByDate(user.getId(), begin, end);
									}
									for (orderlistVO v : list) {
										String date = v.getOrder_date().substring(0, 10);
										String deliveringMessage = "";										
								%>
								<td><span id=""><%=date%></span></td>
								<td><span id="productName-field"><%=v.getProduct_name()%></span></td>
								<td><span id="size-field"><%=v.getProduct_size()%></span></td>
								<td><span id="count-field"><%=v.getProduct_count()%></span></td>
								<td><span id="price-field"><%=v.getProduct_price()%></span></td>
								<%
									if ("YES".equals(v.getDelivering())) {
										deliveringMessage = "배송완료";
								%>
								<td><span id="delivery-field"><button type="button" class="w3-btn w3-slim w3-pale-red w3-small">&nbsp;&nbsp;<%=deliveringMessage%>&nbsp;</button></span></td>
								<%
									} else {
										deliveringMessage = "배송준비중";
								%>
								<td><span id="delivery-field"><button type="button" class="w3-btn w3-slim w3-sand w3-small"><%=deliveringMessage%></button></span></td>
								<%
									}
								%>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="box" aria-labelledBy="box-tab">
					<div class="container">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="panel-body">
								<iframe width="100%" height="1000px" src="http://www.iviewcore.com/data/parcel.html"></iframe>
							</div>
							<div class="col-md-2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
<%if (begin != null && end != null) {%>
	$("#mypoint-tab").trigger("click");
<%}%>
	var el1 = document.getElementById("start-date-field");
	var el2 = document.getElementById("end-date-field");
	var id = document.getElementById("id-field").textContent;

	// 오늘날짜
	var today = new Date();
	var todayString = getDateString(today);
	el1.value = todayString;
	el2.value = todayString;

	function setOneWeek() {
		var time = 60 * 60 * 24 * 7 * 1000;

		var beforeOneWeek = today.getTime() - time;
		var date = new Date(beforeOneWeek);
		var dateString = getDateString(date);

		el1.value = dateString;
	}

	function setOneMonth() {
		var time = 60 * 60 * 24 * 30 * 1000;

		var beforeOneMonth = today.getTime() - time;
		var date = new Date(beforeOneMonth);
		var dateString = getDateString(date);

		el1.value = dateString;
	}

	function setThreeMonths() {
		var time = 60 * 60 * 24 * 90 * 1000;

		var beforeThreeMonths = today.getTime() - time;
		var date = new Date(beforeThreeMonths);
		var dateString = getDateString(date);

		el1.value = dateString;
	}

	// Date 객체를 전달받아서 문자열로 변환하는 함수 
	function getDateString(d) {
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var date = d.getDate();

		var dateText = "";
		dateText += year;
		dateText += '-';
		dateText += (month < 10 ? '0' + month : month);
		dateText += '-';
		dateText += (date < 10 ? '0' + date : date);

		return dateText;
	}
</script>
</html>