<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.Period"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.thumbnailDAO"%>
<%@page import="util.PageNationUtil"%>
<%@page import="util.NumberUtil"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%
	int categoryNo = Integer.parseInt(request.getParameter("cartNo"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>CC</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>
<body onload="priceCommaCheck()">
<%@include file="/nav.jsp"%>
<%
	thumbnailDAO dao = new thumbnailDAO();
	
	int kindItem = 0;
	kindItem = categoryNo;
	
	final int ROWS_PER_PAGE = 12;

	// 보여질 페이지 블록 개수
	final int PAGE_PER_BLOCK = 5;

	// 내 페이지의 총 게시물 개수 
	int totalRows = dao.getTotalRows(kindItem);

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
	
%>
<div class="container">

	<div class="row">
			<%
				ArrayList<ItemVO> FindItemViewList = dao.getItemTotalPageList(categoryNo, beginIndex, endIndex);
				
				DecimalFormat df = new DecimalFormat("###,###,###");	
			
				for (ItemVO item : FindItemViewList) {
					
				String dfPrice = df.format(item.getPrice());
			%>
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<a
							href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>">
							<%
							if(item.getCount() == 0) {
							%>
							  <span class="w3-tag w3-disabled"><strong>Sold out</strong></span>
							<%
							} 
							%>
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
							 <span class="w3-tag w3-red"><strong>New</strong></span>
							<%
								}
							%>
							
							<span class="w3-tag w3-white"> </span>
							
							<img src="/itemImage/<%=item.getSrc()%>"width="100%" height="380px" class="w3-hover-opacity"/>
						</a>
					</div>
					<div  style="text-align:center "><font size="3">
						<a href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>"><strong><%=item.getName()%></strong></a></font>
						<p style="text-align:center "><font size="2" color="blue" id="price">
							<%=dfPrice %> 
							won 
						</font>
						</p>
						
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="text-center">
					<ul class="w3-pagination">

						<%
							int beginPage = (currentBlock - 1) * PAGE_PER_BLOCK + 1;
							int endPage = currentBlock * PAGE_PER_BLOCK;

							if (currentBlock == totalBlocks) {
								endPage = totalPages;
							}
						%>

						<%
							if (pageNo > 1) {
						%>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=<%=categoryNo %>&pno=<%=pageNo - 5%>"
							>&laquo;</a></li>
						<%
							}
						%>

						<%
							for (int index = beginPage; index <= endPage; index++) {
								if (index == pageNo) {
						%>
						<li><a
							href="/thumbnail/thumbnailkind.jsp?cartNo=<%=categoryNo %>&pno=<%=index%>" class="w3-gray"><%=index%></a></li>
						<%
							}else{
						%>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=<%=categoryNo %>&pno=<%=index%>"><%=index%></a></li>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (pageNo < totalPages) {
						%>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=<%=categoryNo %>&pno=<%=pageNo + 5%>">&raquo;</a></li>
						<%
						
						%>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>	
<%@include file="/footer.jsp"%>

</body>
</html>