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
		$('button').click(function() {
			var nationCode = $(this).attr('id').replace('-btn','');
			
			var reqUrl = "../food?na=" + nationCode;
			$.get(reqUrl, function(data) {
				alert(data);
			});
			
			/*$.ajax({
				type:"GET",
				url:"../food?na="+nationCode,
				success: function(data) {
					var foodArray = data.split(",");

                    // empty로 안의 요소를 지움
                    $("#food-list").empty();
                    
                    $.each(foodArray, function(index, item) {
                    	var htmlContent = "<li class='list-group-item'>"+item+"</li>";
                    	
                    	$("#food-list").append(htmlContent);
                    });
				}
			});*/
		});		
	})
</script>
<title>Example</title>
</head>
<body>
	<div class="container">
      <h1>메뉴 고르기</h1>
      <div>
         <button id="kr-btn" class="btn btn-default">한국</button>
         <button id="ch-btn" class="btn btn-default">중국</button>
         <button id="ja-btn" class="btn btn-default">일본</button>
      </div>
      
      <hr />
      
      <ul id="food-list" class="list-group">
         <li class="list-group-item">없음</li>
      </ul>
   </div>
</body>
</html>