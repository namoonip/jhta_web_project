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
	$("#start-line, #end-line").change(function() {
		var lineNumber = $(this).val();
		
		var stationId = $(this).attr("id").replace("line", "station");
		
		if(lineNumber != "") {
			$.ajax({
				type: "GET",
				url:"../subway?line="+lineNumber,
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
			<form action="" class="form-horizontal">
				<div class="form-group">
					<label for="start-line" class="control-label col-xs-1">출발역</label>
					<div class="col-xs-2">
						<select name="" id="start-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>
							<option value="2">2호선</option>
							<option value="3">3호선</option>
							<option value="4">4호선</option>
							<option value="5">5호선</option>
							<option value="6">6호선</option>
							<option value="7">7호선</option>
							<option value="8">8호선</option>
							<option value="9">9호선</option>
							<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>
							<option value="B">분당선</option>
							<option value="A">공항철도</option>
							<option value="G">경춘선</option>
							<option value="S">신분당선</option>
							<option value="SU">수인선</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select name="" id="start-station" class="form-control"></select>
					</div>
					<label for="end-line" class="control-label col-xs-1">도착역</label>
					<div class="col-xs-2">
						<select name="" id="end-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>
							<option value="2">2호선</option>
							<option value="3">3호선</option>
							<option value="4">4호선</option>
							<option value="5">5호선</option>
							<option value="6">6호선</option>
							<option value="7">7호선</option>
							<option value="8">8호선</option>
							<option value="9">9호선</option>
							<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>
							<option value="B">분당선</option>
							<option value="A">공항철도</option>
							<option value="G">경춘선</option>
							<option value="S">신분당선</option>
							<option value="SU">수인선</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select name="" id="end-station" class="form-control"></select>
					</div>
					<div class="col-xs-2">
						<button type="submit" id="search-btn" class="btn btn-primary">조회</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>