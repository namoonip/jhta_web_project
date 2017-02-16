<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Melon main</title>
<style>
#sixboxName{
	font-size : 12px;
	font-weight: bold;
}
#sixboxValue{
	font-size : 11px;
	color: #808080;
}
#melonMarketingKind{
	font-size : 11px;
	color: #56B055;
}
#sixBoxWathcing {
	font-size : 10px;
	color: #808080;
}
#nowClock{
	align: right;
}
#nowRankingTop3{
	font-size: 16px;
	foint-style: italic;
	color: #59DD57;
}
#nowRanking{
	font-size: 16px;
	color: #A7ACA7;
}
#nowRankingUpAndDown{
	font-size: 12px;
	color: #808080;
}
#nowRankingSinger{
	color: #808080;
}
.panel-heading {
	font-weight: bold;
}

</style>
</head>
<body>
<div class="navbar">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="http://www.melon.com/"> <img src="img/melonlogo.jpg" class="pull-left" /></a> 
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="panel">
				<div class="panel-heading">인기있어요 <font size="1px;" color="808080;">지금 이슈가 되는 아티스트의 인기 컨텐츠입니다.</font></div>
				<div class="panel-body">
				<div class="row">
					<div class="col-md-4">
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m11.png" alt="[유스케]볼빨간 사춘기 - 좋다고 말해"/><br />
										<font id="sixboxName">[유스케]볼빨간 사춘기 - 좋다고 말해</font><br />
										<font id="sixboxValue">일주일을 버티게 해줄 과즙팡팡 소녀둘</font><br />
									</a>
									<a href="">	<font id="melonMarketingKind">	멜론매거진	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 1,492	</font>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m12.png" alt="'9와 숫자들'을 있게한 Playlist113" /><br />
										<font id="sixboxName">'9와 숫자들'을 있게한 Playlist113</font><br />
										<font id="sixboxValue">9,0,3,4가 모이면? 완벽한 취저밴드!</font><br />
									</a>
										<a href="">	<font id="melonMarketingKind">	멜론매거진	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 333	</font>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m21.png" alt="[불후의명곡] 전율의 LIVE! 정동하" /><br />
										<font id="sixboxName">[불후의명곡] 전율의 LIVE! 정동하</font><br />
										<font id="sixboxValue">첫 무대 신기록 세우며, 당당히 합류!</font><br />
									</a>
									<a href="">	<font id="melonMarketingKind">	멜론TV	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 14,130	</font>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m22.png" alt="[K팝스타6] 크리샤X전민주 Problem" /><br />
										<font id="sixboxName">[K팝스타6] 크리샤X전민주 Problem</font><br />
										<font id="sixboxValue">시청률 정점을 찍었던 순간, 다시보기</font><br />
									</a>
										<a href="">	<font id="melonMarketingKind">	멜론TV	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 81,882	</font>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m31.png" alt="음색여신 케이시 [Dream] 컴백 티저" /><br />
										<font id="sixboxName">음색여신 케이시 [Dream] 컴백 티저</font><br />
										<font id="sixboxValue">보컬리스트의 면모를 제대로 보여줄께!</font><br />
									</a>
									<a href="">	<font id="melonMarketingKind">	멜론TV	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 1,359	</font>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="caption">
									<a href="">
										<img src="img/m32.png" alt="재즈아티스트들의 디즈니 헌정앨범♥" /><br />
										<font id="sixboxName">재즈아티스트들의 디즈니 헌정앨범♥</font><br />
										<font id="sixboxValue">소장가치200% 디즈니 덕후 모여라!</font><br />
									</a>
										<a href="">	<font id="melonMarketingKind">	멜론매거진	</font>
									</a>
									<font id="sixBoxWathcing">	| 조회 797	</font>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel">
				<div class="panel-heading" >
					<a href="">멜론차트 ></a>
					<small class="nowClock pull-right">2017-01-16 23:00 기준</small>
				</div>
				<div class="panel-body">
					<table class="table table-striped">
						<colgroup>
							<col width="6%" />
							<col width="5%" />
							<col width="*" />
							<col width="35%" />
						</colgroup>
						<tr>
							<td id="nowRankingTop3">1</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">첫눈처럼 너에게 가...</td>
							<td id="nowRankingSinger">에일리</td>
						</tr>
						<tr>
							<td id="nowRankingTop3">2</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">Beautiful</td>
							<td id="nowRankingSinger">Crush</td>
						</tr>
						<tr>
							<td id="nowRankingTop3">3</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">당신의 밤(Feat. 오)...</td>
							<td id="nowRankingSinger">황광히 X 개코</td>
						</tr>
						<tr>
							<td id="nowRanking">4</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">에라 모르겠다</td>
							<td id="nowRankingSinger">BIGBANG</td>
						</tr>
						<tr>
							<td id="nowRanking">5</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">Stay With Me</td>
							<td id="nowRankingSinger">찬열 (CHA..)</td>
						</tr>
						<tr>
							<td id="nowRanking">6</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">좋다고 말해</td>
							<td id="nowRankingSinger">볼발간사춘기</td>
						</tr>
						<tr>
							<td id="nowRanking">7</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">I Miss You</td>
							<td id="nowRankingSinger">소유</td>
						</tr>
						<tr>
							<td id="nowRanking">8</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">이쁘다니까</td>
							<td id="nowRankingSinger">에디킴</td>
						</tr>
						<tr>
							<td id="nowRanking">9</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">오랜 날 오랜 밤</td>
							<td id="nowRankingSinger">악동뮤지션</td>
						</tr>
						<tr>
							<td id="nowRanking">10</td>
							<td id="nowRankingUpAndDown">-0</td>
							<td id="nowRankingName">Who Are You</td>
							<td id="nowRankingSinger">샘김 (SAM...)</td>
						</tr>
					</table>
				</div>
				<div class="panel-footer text-right">
					<form action="">
					<button style="button" class="btn btn-default pull-left">TOP10 듣기</button>
					<a href="" class="">더 보기></a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>