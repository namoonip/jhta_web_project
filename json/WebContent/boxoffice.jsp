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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#search-btn').click(function(event) {
			event.preventDefault();
			
			// input의 값은 text()가 아닌 val()
			var searchDate = $('#search-date').val();
			
			if(searchDate) {
				// '-' 없애기
				searchDate = searchDate.replace(/-/g, '');
				
				// ajax를 활용해 날짜 전송하기
				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4 && xhr.status == 200) {
						/*
						// jsonText가 url을 통해 내려온다.
						var jsonText = xhr.responseText;
						// object로 JSON text를 불러온다.
						var boxoffice = JSON.parse(jsonText);
						// json의 사용하고자하는 내용을 배열로 불러온다.
						var boxofficeList = boxoffice.boxOfficeResult.dailyBoxOfficeList;
						
						var htmlContent = "";
						for(var i=0; i<boxofficeList.length; i++) {
							var movie = boxofficeList[i];
							
							htmlContent += "<tr>";
							htmlContent += "<td>" + movie.rank + "</td>";
							htmlContent += "<td>" + movie.movieNm + "</td>";
							htmlContent += "<td>" + movie.openDt + "</td>";
							htmlContent += "<td>" + movie.salesShare + " %</td>";
							htmlContent += "<td>" + movie.audiAcc + " 명</td>";
							htmlContent += "</tr>";
						}
						$("tbody").html(htmlContent);
						*/
					};
				};
				xhr.open("GET", "boxoffice?date=" + searchDate);
				xhr.send(null);
			};
			
		});
	})
</script>
<title>Example</title>
</head>
<body>
	<div class="container">
		<h1>일일 박스오피스 조회</h1>
		
		<div class="row well">
			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
					<label for="" class="control-label col-xs-2">날짜</label>
					<div class="col-xs-8">
						<input type="date" class="form-control" id="search-date" />
					</div>
					<div class="col-xs-2">
						<button class="btn btn-default" id="search-btn">조회</button>	
					</div>
				</div>
			</form>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
					<th>개봉일</th>
					<th>티켓 예매율</th>
					<th>누적 관객수</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
</body>
</html>