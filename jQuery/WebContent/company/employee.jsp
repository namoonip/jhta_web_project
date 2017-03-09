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
	$("#emp-table").hide();
		
	// 사원 목록을 클릭했을 때 사원의 정보를 보여줄 미래의 클릭 이벤트 구현하기 
	$("#emp-list").on('click', 'li', function() {
		var empId = $(this).attr('id').replace("emp-", "");
		
		$('#emp-list li').removeClass('active');
		$(this).addClass('active');
		
		$.ajax({
			type:"GET",
			url:"../emp?id="+empId,
			success: function(data) {
				
				$("td:eq(0)").text(data.id);
				$("td:eq(1)").text(data.firstName + " " + data.lastName);
				$("td:eq(2)").text(data.phone);
				$("td:eq(3)").text(data.jobId);
				$("td:eq(4)").text(data.salary);
				$("td:eq(5)").text(data.commission);
				
				$("#emp-table").show();
			}
		});
	});
	
	// 부서 목록을 클릭했을 때 사원의 이름을 보여줄 미래의 클릭 이벤트 구현하기 
	$('#dept-list').on('click', 'li', function() {		
		$("#emp-table").hide();
		
		var deptId = $(this).attr('id').replace("dept-", "");
		
		$('#dept-list li').removeClass('active');
		$(this).addClass('active');
		
		$.ajax({
			type:"GET",
			url:"../emps?id="+deptId,
			success: function(data) {
				
				$("#emp-list").empty();
				
				$.each(data, function(index, item) {
					var $li = $("<li class='list-group-item'></li>");
					$li.attr("id", "emp-" + item.id);
					$li.text(item.firstName + "," + item.lastName);
					
					$('#emp-list').append($li);
				});
			}
			
		});
	});
	
	// JSON형식의 텍스트를 aJax low level interface를 사용해 append하기
	$.ajax({
		type:"GET",
		url:"../depts",
		success: function(data) {
			$.each(data, function(index, item) { // item = {id:~, name:~}			
				$("#dept-list").append('<li class="list-group-item" id="dept-'+ item.id +'">' + item.name + '</li>');
			});
		}
	});
})
</script>
<title>Example</title>
</head>
<body>
	<div class="container">
		<h1>사원 정보 조회</h1>
		<div class="row">
			<div class="col-xs-4">
				<h3>부서 리스트</h3>
				<ul id="dept-list" class="list-group" style="height: 400px; overflow: auto;"></ul>
			</div>
			<div class="col-xs-4">
				<h3>사원 리스트</h3>
				<ul id="emp-list" class="list-group" style="height: 400px; overflow: auto;"></ul>
			</div>
			<div class="col-xs-4">
				<h3>사원 정보</h3>
				<table id="emp-table" class="table table-bordered">
					<colgroup>
						<col width="30%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>사원아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>이름</th>
						<td></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td></td>
					</tr>
					<tr>
						<th>업무</th>
						<td></td>
					</tr>
					<tr>
						<th>급여</th>
						<td></td>
					</tr>
					<tr>
						<th>커미션</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>