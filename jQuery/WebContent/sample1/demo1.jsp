<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<title>JSP</title>
<script type="text/javascript">
    $(function () {
        $("button").click(function () {
        	
        	$('button').removeClass('btn-success').addClass("btn-default");
        	
        	$(this).removeClass('btn-default').addClass('btn-success');       	
        	
        	
         var nationCode = $(this).attr('id').replace('-btn','');
         
         var xhr = new XMLHttpRequest();
         
         // 비동기 로직
         xhr.onreadystatechange = function() {
             // readyState가 4(서버에서 응답을 보냄)이고, http응답코드가 200(서버에서 성공적인 응답이옴)
                if(xhr.readyState == 4 && xhr.status == 200) {
                    // xhr객체의 responseText에는 서버가 보낸 응답데이터가 들어있다.
                    var data = xhr.responseText;
                    var foodArray = data.split(",");
                    
                    // empty로 안의 요소를 지움
                    $("#food-list").empty();
                    
                    $.each(foodArray, function(index, item) {
                    	var htmlContent = "<li class='list-group-item'>"+item+"</li>";
                    	
                    	$("#food-list").append(htmlContent);
                    });
                    
                }
            }
         xhr.open("GET","../food?na="+nationCode);
         xhr.send(null);
        });
    })
</script>
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