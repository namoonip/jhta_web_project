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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function() {
	$("#search-btn").click(function(event) {
		// 자기 자신한테 제출할때 초기화되는 것을 방지하기위한 Prevent Event사용
		event.preventDefault();
		var departure = $("#start-station").val();
		var arrival = $("#end-station").val();
		if(departure && arrival) {
			$.ajax({  // type은 알아서할 것
				type:"POST", url:"../quick",
				// data는 보내는 데이터를 name:value 한 쌍으로 보낸다
				data:{d:departure, a:arrival},
				success: function(data) {
					// 최단시간과 최소환승정보를 불러온다.
					var route = data.shortestRouteList[0];
					var shtTimeStation = route.shtStatnNm;
					var shtTimeMsg = route.shtTransferMsg;
					var shtTimeId = route.shtStatnId.split(",");
					var minTransStation = route.minStatnNm;
					var minTransMsg = route.minTravelMsg;
					var minTransId = route.minStatnId.split(",");
					
					$("#sht-time-body").empty();
					var html1 = "<ul class='list-group'>";
					$.each(shtTimeStation.split(","), function(index, item) {
						html1 += "<li class='list-group-item'>" + item + "</li>";
					});
					html1 += "</ul>";
					$("#sht-time-body").html(html1);
					$("#sht-time-footer").html(shtTimeMsg);
					
					$("#sht-trans-body").empty();
					var html2 = "<ul class='list-group'>";
					$.each(minTransStation.split(","), function(index, item) {
						html2 += "<li class='list-group-item'>" + item + "</li>";
					});
					html2 += "</ul>";
					$("#sht-trans-body").html(html2);
					$("#sht-trans-footer").html(minTransMsg);
				}
			});
		}
	});
	
	$("#start-line, #end-line").change(function() {
		var lineNumber = $(this).val();
		var stationId = $(this).attr("id").replace("line", "station");
		if(lineNumber != "") {
			$.ajax({
				type: "GET",	url:"../subway?line="+lineNumber,
				success: function(data) {
					$("#" + stationId).empty();			
					$.each(data.SearchSTNBySubwayLineService.row, function(index, item) {
						var option = "<option>"+ item.STATION_NM +"</option>";
						$("#" + stationId).append(option);
					})
				}
			});
		}
	});
})
</script>
</head>
<body>
	<div class="container">
		<h1>지하철 최단경로 조회하기</h1>
		<div class="row well">
			<form class="form-horizontal">
				<div class="form-group">
					<label for="start-line" class="control-label col-xs-1">출발역</label>
					<div class="col-xs-2">
						<select name="" id="start-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>	<option value="2">2호선</option>
							<option value="3">3호선</option>	<option value="4">4호선</option>
							<option value="5">5호선</option>	<option value="6">6호선</option>
							<option value="7">7호선</option>	<option value="8">8호선</option>
							<option value="9">9호선</option>	<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>	<option value="B">분당선</option>
							<option value="A">공항철도</option>	<option value="G">경춘선</option>
							<option value="S">신분당선</option>	<option value="SU">수인선</option>
						</select>	</div>
					<div class="col-xs-2">
						<select name="" id="start-station" class="form-control"></select>	</div>
					<label for="end-line" class="control-label col-xs-1">도착역</label>
					<div class="col-xs-2">
						<select name="" id="end-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>		<option value="2">2호선</option>
							<option value="3">3호선</option>		<option value="4">4호선</option>
							<option value="5">5호선</option>		<option value="6">6호선</option>
							<option value="7">7호선</option>		<option value="8">8호선</option>
							<option value="9">9호선</option>		<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>		<option value="B">분당선</option>
							<option value="A">공항철도</option>		<option value="G">경춘선</option>
							<option value="S">신분당선</option>		<option value="SU">수인선</option>
						</select>	</div>
					<div class="col-xs-2">
						<select name="" id="end-station" class="form-control"></select>	</div>
					<div class="col-xs-2">
						<button type="submit" id="search-btn" class="btn btn-primary">조회</button> </div>
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">최단시간 경로</h3>
					</div>
					<div class="panel-body" id="sht-time-footer"></div>
					<div class="panel-body" id="sht-time-body"></div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">최소환승 경로</h3>
					</div>
					<div class="panel-body" id="sht-trans-footer"></div>
					<div class="panel-body" id="sht-trans-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>