<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.logging.Formatter"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.thumbnailDAO"%>
<%@page import="dao.SearchDAO"%>
<%@page import="util.PageNationUtil"%>
<%@page import="util.NumberUtil"%>
<%@page import="dao.MainDAO"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.itemRegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<head>
<title>SARA C</title>
</head>
<body>
	<%@include file="nav.jsp"%>
	<div class="container">
	<div class = "row">
	<table class="w3-table">
	<thead>
	</thead>
		<tbody>
				<tr>
					<td>
						<div class="w3-content w3-section" style="max-width:100%">
							<div class="col-md-10">
					  		  <img class="mySlides w3-animate-fading" src="/itemImage/aaaa3.jpg" style="width:1105px">
							  <img class="mySlides w3-animate-fading" src="/itemImage/aaaa1.jpg" style="width:1105px">
							  <img class="mySlides w3-animate-fading" src="/itemImage/aaaa7.jpg" style="width:1105px">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<br />
						<div class="col-md-10">
 						<video poster="/itemImage/aaaa7.jpg" autoplay="autoplay" loop="loop" width="1105" height="500">
							<source src="/itemImage/model.mp4" type="video/mp4" />
						</video>
						</div>
					</td>
				</tr>
		</tbody>
	</table>
	</div>
	</div>
	<br />
	<div class="container">
		  <div class="row" id="tabTarget">
	  				    <ul id="myTab" class="nav nav-tabs" role="tablist">
					      <li role="presentation" class="active" style="width: 50%"><a href="#itemdetail" id="item-detail" role="tab" data-toggle="tab" aria-controls="itemContents" aria-expanded="true"><strong style="text-shadow: 30%"><font size="5">NEW</font></strong></a></li>
					      <li role="presentation" style="width: 50%"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profileitem" aria-expanded="true" ><strong style="text-shadow: 30%"><font size="5">BEST</font></strong></a></li>    
					    </ul>
					    <div id="myTabContent" class="tab-content">
								<%
									MainDAO maindao = new MainDAO();
									
						
									String searchItem = "";
						
									// 한페이지에 나올 개수
									final int ROWS_PER_PAGE = 6;
						
									// 보여질 페이지 블록 개수
									final int PAGE_PER_BLOCK = 5;
						
									// 내 페이지의 총 게시물 개수 
									int totalRows = maindao.getTotalRows();
						
									// 총 페이지개수 구하기
									int totalPages = (int) Math.ceil((double) totalRows / ROWS_PER_PAGE);
						
									// 총 페이지블럭개수 구하기
									int totalBlocks = (int) Math.ceil((double) totalPages / PAGE_PER_BLOCK);
						
									// 페이지 번호 알아내기 + pno가 없을시에는 1페이지로 가기
									int pageNo = NumberUtil.StringToInt((request.getParameter("pno")), 1);
						
									// 페이지블럭 이동시 해당 페이지로 이동
									int currentBlock = (int) Math.ceil((double) pageNo / PAGE_PER_BLOCK);
						
									// 조회시 구간시작값과 구간 끝값을 알아내기
									int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
									int endIndex = pageNo * ROWS_PER_PAGE;
									
									DecimalFormat df = new DecimalFormat("###,###,###");
									
								%>
					      <div role="tabpanel" class="tab-pane fade in active" id="itemdetail" aria-labelledBy="item-tab">
							<!-- 페이징 처리 -->
								<div class="row">
									<%
										ArrayList<ItemVO> FindItemNewList = maindao.getItemNewPageList(beginIndex, endIndex);
						
										for (ItemVO item : FindItemNewList) {
											
											String dfPrice = df.format(item.getPrice());
									%>
									<div class="col-sm-4">
										<div class="w3-display-container w3-hover-opacity " style="width:100%">
										<div class="panel panel-default">
											<div class="panel-body">
												<a
													href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>">
													<%
													
														LocalDate today = LocalDate.now();
														
														Calendar cal = Calendar.getInstance();
														cal.setTime(item.getRegdate());
														
														LocalDate regdate = LocalDate.of(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
														
														Period period = Period.between(regdate, today);
														int dayPeriod = period.getDays();
														
													%>
													<%
														if (dayPeriod <=5) {
													%>
													<span class="w3-tag w3-red">New</span>
													<%} %>
													<span class="w3-tag w3-white"> </span>
													<img src="itemImage/<%=item.getSrc()%>" width ="100%" height="400px"/>
												</a>
												<br />
												<br />
												<p style="text-align:center"><font size="3">
												<a href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>"><strong><%=item.getName()%></strong></a>
												</font></p>
												<p style="text-align:center "><font size="2" color="blue">
													<%=dfPrice %> won
												</font></p>
											</div>
										</div>
										</div>
									</div>
									<%
										}
									%>
								</div>
							
							</div>
					      <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
					      	<div class="row">
									<%
										ArrayList<ItemVO> FindItemBestList = maindao.getItemBestPageList(beginIndex, endIndex);
						
										for (ItemVO item : FindItemBestList) {
											 
										String dfPrice = df.format(item.getPrice());
									%>
									<div class="col-sm-4">
										<div class="w3-display-container w3-hover-opacity " style="width:100%">
										<div class="panel panel-default">
											<div class="panel-body">
												<a
													href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>">
													<span class="w3-tag w3-red">Best</span>
													<span class="w3-tag w3-white"> </span>
													<img src="itemImage/<%=item.getSrc()%>" width="100%" height="400px"/>
												</a>
												<br />
												<br />
												<p style="text-align:center"><font size="3">
												<a href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>"><strong><%=item.getName()%></strong></a>
												</font></p>
												<p style="text-align:center "><font size="2" color="blue">
													<%=dfPrice %> won
													</font>
												</p>
											</div>
										</div>
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
					      </div>
					      </div>

					         
					</div>
	<%@include file="footer.jsp"%>
</body>
<script>

jQuery(document).ready(function($) {
    $(".scroll").click(function(event){            
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 2000);
    });
});



var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 9000);    
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace("w3-white","");
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</html>