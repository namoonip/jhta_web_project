<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 추가한 CSS -->
<link rel="stylesheet" href="/css/style.css">

<!-- 파일경로  -->
</head>

<!-- 모든유저가 보는 네비바 -->
<%@include file="/nav.jsp"%>

<!-- Admin의 네비바 -->
<%@include file="adminNav.jsp"%>

<body>
<!-- LogingCheck And Admin Check -->
<%
	if(session == null) {
	response.sendRedirect("/main.jsp?err");
	return;
	}
	request.setCharacterEncoding("utf-8");
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if(!"admin".equals(user.getId())) {
		response.sendRedirect("/main.jsp?YourNotManager!");
		return;
	}
%>

	<div class="container">
		<div class="row">
			<div class="col-md-12" id="naviTarget">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>
						<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
						상품 등록</h3>
					</div>
					<div class="panel-body">
						<form action="/itemregister" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>카테고리</label>
								<select class="form-control" id="categoryNo-field" name="categoryNo">
									  <option selected="selected" value="1">1.코트</option>
									  <option value="2" >2.패딩</option>
									  <option value="3" >3.자켓</option>
									  <option value="4" >4.가디건</option>
									  <option value="5" >5.블레이져</option>
									  <option value="6" >6.맨투맨</option>
									  <option value="7" >7.티셔츠</option>
									  <option value="8" >8.니트</option>
									  <option value="9" >9.후드</option>
									  <option value="10">10.셔츠</option>
									  <option value="11" >11.청바지</option>
									  <option value="12" >12.반바지</option>
									  <option value="13" >13.트레이닝 팬츠</option>
									  <option value="14" >14.슬랙스</option>
									  <option value="15" >15.벨트</option>
									  <option value="16" >16.모자</option>
									  <option value="17" >17.시계</option>
									  <option value="18" >18.선글라스</option>
								</select>
							</div>
							<div class="form-group">
								<label>상품명</label>
								<input type="text" class="form-control" id="name-field" placeholder="상품명을 입력해주세요" name="name">
							</div>
							<div class="form-group">
								<label>수량</label>
								<input type="text" class="form-control" id="count-field" placeholder="수량을 입력해주세요" name="count" onkeyup="countOnlyForNumber();" >
							</div>
							<div class="form-group">
								<label>가격</label>
								<input type="text" class="form-control" id="price-field" placeholder="가격을 입력해주세요" name="price" onkeyup="priceOnlyForNumber();" >
							</div>
							<div class="form-group">
								<label>색상</label>
								<input type="text" class="form-control" id="color-field" placeholder="색상을 입력해주세요" name="color">
							</div>
							<div class="form-group">
								<label>사이즈</label>
									<select class="form-control" name="size" id="size-field">
										<option value="XS"> XS </option>
										<option value="S"> S </option>
										<option value="M" selected="selected"> M </option>
										<option value="L"> L </option>
										<option value="XL"> XL </option>
										<option value="FREE"> FREE </option>
									</select>
							</div>
							<div class="form-group">
								<label>상품그룹번호</label>
								<input type="text" class="form-control" id="groupNo-field" placeholder="상품그룹번호를 입력해주세요" name="groupNo" onkeyup="groupOnlyForNumber();">
							</div>
							<div class="form-group">
								<label>썸네일 이미지</label>
								<input type="file" class="form-control" id="src" name="src">
							</div>
							<div class="form-group">
								<label>상세정보 이미지</label>
								<input type="file" class="form-control" id="viewSrc" name="viewSrc">
							</div>
							<div class="form-group">
								<label>기타사항</label>
								<input type="text" class="form-control" id="etc-field" placeholder="기타사항을 입력해주세요" name="etc">
							</div>
							<div class="form-group">
								<button type="submit" class="w3-btn w3-hover-green pull-right btn-lg" id="submitBtn"> 
								<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
								등록 </button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

/* 카테고리 숫자만 입력 가능 */
function categoryOnlyForNumber() {
var categoryInput = document.getElementById('categoryNo-field');
var categoryValue = categoryInput.value;
var categoryarr = categoryValue.split('');
var categoryArr = categoryarr.filter(function(item) {
    var pattern = /[0-9]/;
    return pattern.test(item);
});

categoryInput.value = categoryArr.join("");
}

/* 수량 숫자만 입력 가능 */
function countOnlyForNumber() {
var countInput = document.getElementById('count-field');
var countValue = countInput.value;
var countarr = countValue.split('');
var countArr = countarr.filter(function(item){
    var pattern = /[0-9]/;
    return pattern.test(item);
});

countInput.value = countArr.join("");
}

/* 가격 숫자만 입력 가능 */
function priceOnlyForNumber() {
var priceInput = document.getElementById('price-field');
var priceValue = priceInput.value;
var pricearr = priceValue.split('');
var priceArr = pricearr.filter(function(item){
    var pattern = /[0-9]/;
    return pattern.test(item);
});

priceInput.value = priceArr.join("");
}

/* 그룹번호 숫자만 입력 가능 */
function groupOnlyForNumber() {
var groupNoInput = document.getElementById('groupNo-field');
var groupValue = groupNoInput.value;
var grouparr = groupValue.split('');
var groupArr = grouparr.filter(function(item){
    var pattern = /[0-9]/;
    return pattern.test(item);
});

groupNoInput.value = groupArr.join("");
}



</script>
</html>