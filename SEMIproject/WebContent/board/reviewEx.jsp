<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.NumberUtil"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Example</title>
</head>
<body>
<%
// 해당 아이템 번호를 ino로 받고 페이지 번호를 pno로 받는다
String iNo = request.getParameter("ino");
String pNo = request.getParameter("pno");
int ino = NumberUtil.StringToInt(iNo, 1);
int pno = NumberUtil.StringToInt(pNo, 1);

// tno = 6은 구매번호가 게시판 6번 타입에 저장되기 때문에 6번을 사용한다
int tno = 6;
if(iNo != null) {
	ino = Integer.parseInt(iNo);
}
// 아래는 바디에 해당
%>
<div class="container">
<div style="padding : 30px;">
		<table class="table table-bordered" style="margin: auto;">
				<colgroup>
					<col width="70px;"/>
					<col width="135px;" />
					<col width="135px;" />
					<col width="*;" />
					<col width="100px;" />
					<col width="84px;" />
					<col width="100px;" />
					<col width="55px;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" id="no">번호</th>
						<th scope="col" id="category">카테고리</th>
						<th scope="col" id="category">상품정보</th>
						<th scope="col" id="title">제목</th>
						<th scope="col" id="title">평점</th>						
						<th scope="col" id="writer">작성자</th>
						<th scope="col" id="regdate">작성일</th>
						<th scope="col" id="readcount">조회</th>
					</tr>
				</thead>
				<tbody style="height: 40px;">
				<% 
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> boardList = boardDAO.getAllBoardByItemNo(ino);
				for (BoardVO vo : boardList) { %> 
					<tr>
						<td style="text-align: center;"><%=vo.getBoardNo() %></td>
						<td style="text-align: center;"><%=vo.getBoardCategory() %></td>
						<td style="text-align: center;"></td>
						<td><a href="/board/boardDetail.jsp?bno=<%=vo.getBoardNo()%>&tno=<%=vo.getBoardType() %>&pno=<%=pno%>">
							<%=vo.getBoardTitle() %>
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							</a>
						</td>
						<td style="text-align: center;">
							<%if(vo.getBoardSatis() == 5.0) // 아래는 평점(별표) 출력문입니다.
							{%> 
								  <input type="radio" class="rating-input" id="rating-input-1-5" checked disabled/>
								  <label for="rating-input-1-5" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-4" disabled/>
								  <label for="rating-input-1-4" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-3" disabled/>
								  <label for="rating-input-1-3" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
								  <label for="rating-input-1-2" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
								  <label for="rating-input-1-1" class="rating-star"></label>
							<%} else if(vo.getBoardSatis() == 4.0) {%> 
								  <input type="radio" class="rating-input" id="rating-input-1-4" checked disabled/>
								  <label for="rating-input-1-4" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-3" disabled/>
								  <label for="rating-input-1-3" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
								  <label for="rating-input-1-2" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
								  <label for="rating-input-1-1" class="rating-star"></label>
							<%} else if(vo.getBoardSatis() == 3.0) {%> 
								  <input type="radio" class="rating-input" id="rating-input-1-3" checked disabled/>
								  <label for="rating-input-1-3" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-2" disabled/>
								  <label for="rating-input-1-2" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
								  <label for="rating-input-1-1" class="rating-star"></label>
							<%} else if(vo.getBoardSatis() == 2.0) {%> 
								  <input type="radio" class="rating-input" id="rating-input-1-2" checked disabled/>
								  <label for="rating-input-1-2" class="rating-star"></label>
								  <input type="radio" class="rating-input" id="rating-input-1-1" disabled/>
								  <label for="rating-input-1-1" class="rating-star"></label>
							<%} else if(vo.getBoardSatis() == 1.0) {%> 
								  <input type="radio" class="rating-input" id="rating-input-1-1" checked disabled/>
								  <label for="rating-input-1-1" class="rating-star"></label>
							<%}%>
						</td>
						<td style="text-align: center;"><%=vo.getUserName() %></td>
						<td style="text-align: center;"><%=vo.getSimpleDate() %></td>
						<td style="text-align: center;"><%=vo.getBoardReadCount() %></td>
					</tr>
				<%}%>
				</tbody>
			</table>
			<div class="pull-right" style="padding-top: 10px;">
				<a href="/board/addBoardForm.jsp?tno=6&pno=<%=pno %>" class="button"><strong>Add Write</strong></a>
			</div>	
		</div>	
	</div>
</body>
</html>