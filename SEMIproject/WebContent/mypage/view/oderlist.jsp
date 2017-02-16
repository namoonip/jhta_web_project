<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/nav.jsp" %>
<%
	UserVO user = new UserVO();
%>
	<div class="container">
	<p>
		조회기간 <input type="date" id="start-date-field" /> ~ <input type="date" id="end-date-field" />
	</p>

	<p>
		<button type="button" class = "btn btn-default" onclick="setOneWeek()">1주일</button>
		<button type="button" class = "btn btn-default"onclick="setOneMonth() ">1개월</button>
		<button type="button" class = "btn btn-default"onclick="setThreeMonths()">3개월</button>
	</p>
	</div>
</body>
<script type="text/javascript">
	var el1 = document.getElementById("start-date-field");
	var el2 = document.getElementById("end-date-field");

	// 오늘
	var today = new Date();
	var todayString = getDateString(today);
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

		var beforeOneWeek = today.getTime() - time;
		var date = new Date(beforeOneWeek);
		var dateString = getDateString(date);

		el1.value = dateString;
	}
	
	function setThreeMonths() {
		var time = 60 * 60 * 24 * 90 * 1000;

		var beforeOneWeek = today.getTime() - time;
		var date = new Date(beforeOneWeek);
		var dateString = getDateString(date);

		el1.value = dateString;
	}

	// Date 객체를 전달받아서 문자열로 변환하는 함수 
	function getDateString(d) {
		var year = d.getFullYear();
		var month = d.getMonth()+1;
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