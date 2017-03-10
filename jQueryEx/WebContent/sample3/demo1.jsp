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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
   $("#search-btn").click(function(e){
      e.preventDefault();
   	  // var 변수이름에 -를 사용할 수 없다. _(언더바)를 사용한다.
      $.ajax({
         type:"GET",
         url:"https://apis.daum.net/search/book",
         data: $("#search-form").serialize(),
         dataType:'jsonp',
         jsonp:'callback',
         success:function(data) {
            var $tbody = $('tbody').empty(); 
            $.each(data.channel.item, function(index, item) {
               var $tr = $("<tr></tr>");
               $tr.append("<td><img src='"+item.cover_s_url+"' /></td>");
               $tr.append("<td><a href='"+item.link+"' target='_blank' data-toggle='tooltip' title='"+item.description+"'>"+item.title+"</a></td>");
               $tr.append("<td>"+item.author+"</td>");
               $tr.append("<td>"+item.pub_nm+"</td>");
               $tr.append("<td>"+item.list_price+"</td>");
               $tr.append("<td>"+item.status_des+"</td>"); 
               $tbody.append($tr);
            });
         },
         error:function(xhr) {     
         }
      });
   });
});
</script>
</head>
<body>
<div class="container">
   <h1>책 검색</h1>
   <div class="row well" >
      <form id="search-form">
         <input type="hidden" name="apikey" value="05275c954707eb54df656ca07f9e8e8f">
         <input type="hidden" name="output" value="json" >
         <div class="form-group" >
            <label>검색어</label>
            <input type="text" class="form-control" name="q" /> 
         </div>
         <div class="form-group" >
            <label>출력 갯수(최대 20개)</label>
            <input type="text" class="form-control" name="result" value="10"/> 
         </div>
         <div class="form-group" >
            <label>정렬순서</label>
            <select name='sort' class="form-control">
               <option value="popular">판매량순</option>
               <option value="accu">정확도순</option>
               <option value="date">최신자료순</option>
            </select>
         </div>
         <div class="form-group" >
            <label>검색유형</label>
            <select name='searchType' class="form-control">
               <option value="all">전체에서</option>
               <option value="title">제목에서</option>
               <option value="keyword">주제어</option>
               <option value="overview">책소개</option>
               <option value="publisher">출판사</option>
            </select>
         </div>
         <div class="form-group">
            <button type="submit" id="search-btn" class="btn btn-default">검색</button>
         </div>
      </form>
   </div>
   <div class="row">
      <table class="table table-condensed">
         <thead>
            <tr>
               <th>표지</th>
               <th>제목</th>
               <th>저자</th>
               <th>출판사</th>
               <th>가격</th>
               <th>상태</th>
            </tr>
         </thead>
         <tbody></tbody>
      </table>
   </div>
</div>
</body>
</html>