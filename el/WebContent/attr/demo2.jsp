<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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
<title>Example</title>
</head>
<body>
<div class="w3-container">
	<h2>demo1.jsp에서 요청객체에 저장한 속성값 표현한기</h2>
	
	<h3>* 요청 객체에 단순한 값을 저장한 경우: 정수, 실수, 불린, 문자열</h3>
	<p>팀명 : ${team}</p>
	<hr />
	
	<h3>* 요청 객체에 배열객체를 값으로 저장한 경우 : 배열의 요소는 단순한 값이다.</h3>
	<p>멤버 : ${members[0]}, ${members[1]}, ${members[2]}, ${members[3]}, ${members[4]}, ${members[5]}</p>
	<hr />
	
	<h3>* 요청객체에 List객체를 값으로 저장한 경우 : List의 요소는 단순한 값이다.</h3>
	<p>앨범 : ${albums[0]}, ${albums[1]}, ${albums[2]}, ${albums[3]} </p>
	<hr />
	
	<h3>* 요청객체에 VO객체가 값으로 저장된 경우 : </h3>
	<p>곡 정보	: ${song }				</p>
	<p>곡명 : ${song.title }(${song['title']})</p>
	<p>아티스트 : ${song.artist.name}/ ${song.artist.company}/ ${song.artist.age}</p>
	<p>런닝 타임 : ${song.runningTime2 }	</p>
	<p>발매사 : ${song.company }		</p>
	<hr />
	
	<h3>* 요청 객체에 Map객체가 값으로 저장된 경우</h3>
	<p>영화 정보 : ${movie }</p>
	<p>제목 : ${movie.title }</p>
	<p>주연배우 : ${movie.actor }</p>
	<p>감독 : ${movie.director }</p>
	<p>장르 : ${movie.genre }</p>
	<p>상영 시간 : ${movie['running-time']}</p>
	<hr />
</div>
</body>
</html>