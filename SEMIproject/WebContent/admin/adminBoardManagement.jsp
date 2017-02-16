<%@page import="util.NumberUtil"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.AdminOnlyDAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 추가한 CSS -->
<link rel="stylesheet" href="/css/style.css">

</head>

<!-- 모든유저가 보는 네비바 -->
<%@include file="/nav.jsp"%>

<!-- Admin의 네비바 -->
<%@include file="adminNav.jsp"%>

<body>

	<!-- LogingCheck And Admin Check -->
	<%
		if (session == null) {
			response.sendRedirect("/main.jsp?err");
			return;
		}
		request.setCharacterEncoding("utf-8");

		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");

		if (!"admin".equals(user.getId())) {
			response.sendRedirect("/main.jsp?YourNotManager!");
			return;
		}
	%>

	<div class="container">

		<div class="row" id="naviTarget">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>
							<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							전체 글 목록
						</h3>
					</div>
					<div class="panel-body">
						<a class="btn pull-right"
							href="/admin/adminBoardManagementWrite.jsp"> <span
							class="glyphicon glyphicon-comment" aria-hidden="true"></span>
							게시글 작성
						</a>
						<a class="btn pull-right"
							href="/admin/adminBoardSendMail.jsp"> <span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							메일 보내기
						</a>
						<table class="table">
							<tr>
								<td>글번호</td>
								<td>카테고리</td>
								<td>제목</td>
								<td>글쓴이</td>
								<td>등록일</td>
								<td></td>
							</tr>
							<%
								AdminOnlyDAO adminDAO = new AdminOnlyDAO();

								// 한페이지에 나올 개수
								final int ROWS_PER_PAGE = 20;

								// 보여질 페이지 블록 개수
								final int PAGE_PER_BLOCK = 5;

								// 내 페이지의 총 게시물 개수 
								int totalRows = adminDAO.getTotalBoardRows();

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

								ArrayList<BoardVO> BoardViewList = adminDAO.getBoardListForPaging(beginIndex, endIndex);

								for (BoardVO board : BoardViewList) {
							%>
							<tr>
								<td><%=board.getBoardNo()%></td>
								<td><%=board.getBoardCategory()%></td>
								<td><%=board.getBoardTitle()%></td>
								<td><%=board.getUserName()%></td>
								<td><%=board.getSimpleDate()%></td>
								<td><a class="w3-btn w3-hover-pink pull-right"
									href="/admin/process/adminBoardManagementDelete.jsp?BoardDelNo=<%=board.getBoardNo()%>&pno=<%=pageNo%>">
										<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
										글 삭제
								</a></td>
							</tr>
							<%
								}
							%>
						</table>

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
								<li><a
									href="/admin/adminBoardManagement.jsp?pno=<%=pageNo - 1%>#naviTarget">&laquo;</a></li>
								<%
									}
								%>

								<%
									for (int index = beginPage; index <= endPage; index++) {
										if (index == pageNo) {
								%>
								<li><a class="w3-gray" 
									href="/admin/adminBoardManagement.jsp?pno=<%=index%>#naviTarget"><%=index%></a></li>
								<%
									} else {
								%>
								<li><a
									href="/admin/adminBoardManagement.jsp?pno=<%=index%>#naviTarget"><%=index%></a></li>
								<%
									}
								%>
								<%
									}
								%>

								<%
									if (pageNo < totalPages) {
								%>
								<li><a
									href="/admin/adminBoardManagement.jsp?pno=<%=pageNo + 1%>#naviTarget">&raquo;</a></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>