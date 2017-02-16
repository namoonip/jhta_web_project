<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemVO"%>
<%@page import="dao.SearchDAO"%>
<%@page import="util.NumberUtil"%>
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
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">

.ellipsis {
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  width:220px;
  overflow:hidden;
}

</style>
</head>
	<%@include file="/nav.jsp"%>
<body>

	<%
		request.setCharacterEncoding("utf-8");

		String searchItem = request.getParameter("searchItem");
	%>

	<div class="container">
		<div class="row">
			<div class="alert alert-success" role="alert">
				<h3>
					상품명 <strong><%=searchItem%></strong> 의 검색 결과입니다.
				</h3>
			</div>

			<%
				SearchDAO searchDAO = new SearchDAO();

				// 한페이지에 나올 개수
				final int ROWS_PER_PAGE = 12;

				// 보여질 페이지 블록 개수
				final int PAGE_PER_BLOCK = 10;

				// 내 페이지의 총 게시물 개수 
				int totalRows = 0;
				totalRows = searchDAO.getFindItemRows(searchItem);
				
				if (totalRows == 0) {
			%>
			 <div class="row">
				<div class="col-sm-3">
					<div class="panel panel-default">
						<div class="panel-body">
							검색결과가 존재하지 않습니다.	
						</div>
					</div>
				</div>
			 </div>
				<%@include file="/footer.jsp"%>
			<%
				return;
				}
				
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

				ArrayList<ItemVO> FindItemViewList = searchDAO.getFindItemForPaging(beginIndex, endIndex, searchItem);

				for (ItemVO item : FindItemViewList) {
			%>
			<div class="col-sm-3">
				<div class="panel panel-default">
					<div class="panel-heading"><p class="ellipsis"><%=item.getName()%></p></div>
					<div class="panel-body">
						<a href="/thumbnail/thumbdetail.jsp?ino=<%=item.getItemNo()%>&pno=<%=pageNo%>&groupno=<%=item.getGroupNo()%>">
							<img src="/itemImage/<%=item.getSrc()%>" width="100%" height="400px" />
						</a>
					</div>
				</div>
			</div>
			<%
				}
			%>

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
					<li><a
						href="/search/search.jsp?searchItem=<%=searchItem %>&pno=<%=pageNo - 1%>">&laquo;</a></li>
					<%
						}
					%>

					<%
						for (int index = beginPage; index <= endPage; index++) {
							if (index == pageNo) {
					%>
					<li><a class="w3-gray"
						href="/search/search.jsp?searchItem=<%=searchItem %>&pno=<%=index%>"><%=index%></a></li>
					<%
						} else {
					%>
					<li><a href="/search/search.jsp?searchItem=<%=searchItem %>&pno=<%=index%>"><%=index%></a></li>
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
						href="/search/search.jsp?searchItem=<%=searchItem %>&pno=<%=pageNo + 1%>">&raquo;</a></li>
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