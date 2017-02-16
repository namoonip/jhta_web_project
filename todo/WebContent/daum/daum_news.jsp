<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.2/css/bootstrap.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Daum</title>
<style>
#otherNews {
	font-size: 3px;
	color: #708090;
	align: justify;
}
#nowRanking {
	color: #00CCCC;
	font-weight: bold;
}
#upAndDown {
	font-size: 1px;
	color: #708090;
}
#upAndDownNew {
	color: #FF0000;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="http://www.daum.net"> <img src="img/logo.jpg"
					class="pull-left" /></a> <a href="" class="navbar-brand">뉴스</a>
				<ul class="nav navbar-nav">
					<li><a href="">사회</a></li>
					<li><a href="">정치</a></li>
					<li><a href="">경제</a></li>
					<li><a href="">국제</a></li>
					<li><a href="">문화</a></li>
					<li><a href="">IT</a></li>
					<li><a href="">랭킹</a></li>
					<li><a href="">연재</a></li>
					<li><a href="">포토</a></li>
					<li><a href=""></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="panel">
					<div class="panel-heading">
						<strong>이 시각 뉴스</strong>
					</div>
					<div class="panel-body">
						<div class="row">
							<!-- 바디 5:7 -->
							<div class="col-md-5">
								<div class="row">
									<div class="caption">
										<a href=""> <img src="img/d1.jpg" alt="" />
											<p>[이재용 구속영장 청구]삼성 법적 대응은..법무팀 300여명에 외부 영입까지 '총동원'</p>
										</a>
									</div>
								</div>
								<div class="row">
									<div class="caption">
										<a href=""> <img src="img/d2.jpg" alt="" />
											<p>미국산 달걀 풀리는데.. 미국 달걀 시장, 한국과 비교해보니</p>
										</a>
									</div>
								</div>
							</div>
							<div class="col-md-7">
								<div class="row">
									<table class="table">
										<tr>
											<td><a href="">[헌재 5차변론]'돈 먹었다''걔네들이''뻗었다...</a></td>
											<td id="otherNews">해럴드경제</td>
										</tr>
										<tr>
											<td><a href="">[이슈탐색] 장애 아동의 가혹한 현실.. 학대 대부</a></td>
											<td id="otherNews">세계일보</td>
										</tr>
										<tr>
											<td><a href="">미국산 달결 풀리는데.. 미국 달걀 시장, 한국과...</a></td>
											<td id="otherNews">한국일보</td>
										</tr>
										<tr>
											<td><a href="">"충신으로 남으려다 누명.. 대통령은 다 모르는...</a></td>
											<td id="otherNews">한국일보</td>
										</tr>
										<tr>
											<td><a href="">아프리카TV 잇따라 떠나는 스타BJ들.. 라이브 ...</a></td>
											<td id="otherNews">이데일리</td>
										</tr>
										<tr>
											<td><a href="">인도군인, SNS로 비리 고발.. 육참총장 '입단속'</a></td>
											<td id="otherNews">연합뉴스</td>
										</tr>
										<tr>
											<td><a href="">박지원-인명진 상견례서 신경전.."문제는 대통...</a></td>
											<td id="otherNews">연합뉴스</td>
										</tr>
										<tr>
											<td><a href="">'4차 산업혁명'은 인간을 자유롭게 할까</a></td>
											<td id="otherNews">한겨례</td>
										</tr>
										<tr>
											<td><a href="">올해도 목마른 해외건설 수주.. 전망 엇갈려</a></td>
											<td id="otherNews">뉴스토마토</td>
										</tr>
										<tr>
											<td colspan="2" style="color: bule;"><a href="">핫이슈
													ㆍ 새누리 인적청산 갈등</a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 맨 오른쪽 열 -->
			<div class="col-md-4">
				<div class="row">
					<div class="panel">
						<div class="panel-heading">실시간 검색어</div>
						<div class="panel-body">
							<table>
								<colgroup>
									<col width="10%" />
									<col width="75%" />
									<col width="*" />
								</colgroup>
								<tr>
									<td id="nowRanking">1</td>
									<td>공효진</td>
									<td id="upAndDown"><img src="img/up.jpg" alt="" />218</td>
								</tr>
								<tr>
									<td id="nowRanking">2</td>
									<td>김이브</td>
									<td id="upAndDown"><img src="img/up.jpg" alt="" />167</td>
								</tr>
								<tr>
									<td id="nowRanking">3</td>
									<td>역적</td>
									<td id="upAndDown"><img src="img/down.jpg" alt="" />54</td>
								</tr>
								<tr>
									<td id="nowRanking">4</td>
									<td>아육대 도시락</td>
									<td id="upAndDownNew"><img src="img/up.jpg" alt="" />new</td>
								</tr>
								<tr>
									<td id="nowRanking">5</td>
									<td>김구라 한은정</td>
									<td id="upAndDown"><img src="img/up.jpg" alt="" />6</td>
								</tr>
								<tr>
									<td id="nowRanking">6</td>
									<td>지금은 라디오시대</td>
									<td id="upAndDown"><img src="img/down.jpg" alt="" />133</td>
								</tr>
								<tr>
									<td id="nowRanking">7</td>
									<td>도깨비 중국</td>
									<td id="upAndDown"><img src="img/up.jpg" alt="" />1</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<a href="">
						<img src="img/d3.jpg" alt="" align="middle" width="250"/>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>