<%@page import="util.PageNationUtil"%>
<%@page import="util.NumberUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
BoardDAO dao = new BoardDAO();

// 등록된 총 게시판 갯수 조회
int totalRows = 0;
String tNo = request.getParameter("tno");
String pno = request.getParameter("pno");
int tno = NumberUtil.StringToInt(tNo, 1);
if(tNo != null) {
	tno = Integer.parseInt(tNo);
	totalRows = dao.getTotalRows(tno);
}
// 검색됬을 때 넘어올 파라미터값
String op1Value = request.getParameter("option1");
String op2Value = request.getParameter("option2");
String searchInput = request.getParameter("searchInput");
int searchDate = 1;
if("op1-w".equals(op1Value)) {
	searchDate = 7;
} else if ("op1-m".equals(op1Value)) {
	searchDate = 31;
} else if ("op1-y".equals(op1Value)) {
	searchDate = 365;
} else if ("op1-a".equals(op1Value)) {
	searchDate = 99999;
}

// 등록된 총 페이지 갯수 계산하기
final int ROWS_PER_PAGE = 10;
int totalPages = (int) Math.ceil((double) totalRows / ROWS_PER_PAGE);

// 페이지 번호 알아내기
int pageNo = NumberUtil.StringToInt(pno, 1);

// 조회시 구간 시작 값과 구간 끝값 알아내기
int beginIndex = (pageNo-1) * ROWS_PER_PAGE + 1;
int endIndex = pageNo * ROWS_PER_PAGE;
int lastPage = totalPages; 

// 요청한 페이지에 해당하는 일정 조회하기
ArrayList <BoardVO> boardList = new ArrayList<BoardVO>();
if(op1Value == null) {
	if("6".equals(tNo)) {
		boardList = dao.getBoardListForPaging(beginIndex, endIndex, tno);
	} else {
		boardList = dao.getBoardQnAListForPaging(beginIndex, endIndex, tno);	
	}
} else {
	//title, writer, contents
	String title = "";
	String writer = "";
	String contents = "";
	String product = "";
	if("op2-title".equals(op2Value)) {
		title = searchInput;
		boardList = dao.getSearchBoardTitleResult(tno, searchDate, title, beginIndex, endIndex);
	} else if ("op2-writer".equals(op2Value)) {
		writer = searchInput;
		boardList = dao.getSearchBoardWriterResult(tno, searchDate, writer, beginIndex, endIndex);	
	} else if ("op2-contents".equals(op2Value)) {
		contents = searchInput;
		boardList = dao.getSearchBoardContentsResult(tno, searchDate, contents, beginIndex, endIndex);
	} else if ("op2-product".equals(op2Value)) {
		product = searchInput;
		boardList = dao.getSearchBoardProductResult(tno, searchDate, product, beginIndex, endIndex);
	}
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.reply {
	padding-left : 25px !important;
}
.tableTh1 {
	border: 2px solid;
	border-color: #dddddd;
	background-color: white;
	text-align: center;
	margin : auto;
}
.tableTh2 {
	border: 2px solid;
	border-color: #dddddd;
	background-color: white;
	text-align: left;
}
.rating-wrapper {
  overflow: hidden;
  display: inline-block;
}

.rating-input {
  position: absolute;
  left: 0;
  top: -50px;
}

.rating-star:hover,
.rating-star:hover ~ .rating-star {
  background-position: 0 0;
}

.rating-wrapper:hover .rating-star:hover,
.rating-wrapper:hover .rating-star:hover ~ .rating-star,
.rating-input:checked ~ .rating-star {
  background-position: 0 0;
}

.rating-star,
.rating-wrapper:hover .rating-star {
  float: left;
  display: block;
  width: 16px;
  height: 16px;
  background: url('http://css-stars.com/wp-content/uploads/2013/12/stars.png') 0 -16px;
}

.button {
    background-color: #e7e7e7;
    border: none;
    color: black;
    padding: 10px 13px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
}
.button:hover {
	background-color: #282828;
	color: white;
}

.button:active {
  background-color: #555555;
  box-shadow: 0 5px #e7e7e7;
  transform: translateY(4px);
}
</style>
</head>
<body>
<%@include file="../../nav.jsp"%>
<%  String err = request.getParameter("err");
if (err != null) { %>
	<script type="text/javascript"> alert('권한이 없습니다. 고객센터를 이용해주세요 010-1234-5678');</script>
<%}%>
<div class="container">
	<div style="padding-bottom: 60px; padding-top: 30px; text-align: center;">
	<h3><%if(tno == 1)  { %>
		교환/반품요청
	<%} else if (tno == 2) { %> 
		배송전 변경
	<%} else if (tno == 3) { %> 
		상품 문의
	<%} else if (tno == 4) { %> 
		기타 문의
	<%} else if (tno == 5) { %>
		공지사항 
	<%} else if (tno == 6) { %> 
		구매 후기
	<%} else if (tno == 10) {%>
		F &amp; A
	<%} %>
	</h3><br />	
	<%if(tno < 4 || tno == 6) {%>
	<p>	해당 게시판의 특성과 맞지 않는 게시물, <br />
		또한 관련성 없는 비방성의 글들은 임의로 삭제됩니다
	</p>
	<%} %>
	</div>
	<div style="padding : 30px;">
		<table class="table table-bordered" style="margin: auto;">
				<colgroup>
					<col width="70px;"/>
					<col width="140px;" />
					<%if(tno == 6) {%>
					<col width="135px;" />
					<% }%>
					<col width="*;" />
					<%if(tno == 6) {%>
					<col width="100px;" />
					<% }%>
					<col width="84px;" />
					<col width="100px;" />
					<col width="55px;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="tableTh1" id="no" >번호</th>
						<th scope="col" class="tableTh1" id="category">카테고리</th>
						<%if(tno == 6) {%>
						<th scope="col" class="tableTh1" id="category">상품</th>
						<% }%>
						<th scope="col" class="tableTh1" id="title">제목</th>
						<%if(tno == 6) {%>
						<th scope="col" class="tableTh1" id="title">평점</th>						
						<% }%>
						<th scope="col" class="tableTh1" id="writer">작성자</th>
						<th scope="col" class="tableTh1" id="regdate">작성일</th>
						<th scope="col" class="tableTh1" id="readcount">조회</th>
					</tr>
				</thead>
				<tbody style="height: 40px;">
				<%  for (BoardVO vo : boardList) { %> 
					<tr>
						<td style="text-align: center;"><%=vo.getBoardNo() %></td>
						<td style="text-align: center;"><%=vo.getBoardCategory() %></td>
						<%if(tno == 6) {%>
						<td style="text-align: center;">
							<div class="w3-dropdown-hover">
								<a href="/thumbnail/thumbdetail.jsp?ino=<%=vo.getBoardItemNo()%>&groupno=<%=vo.getBoardItemGroupNo()%>&pno=1">
										<img align="top" style="width:50px;" border="0" src="/itemImage/<%=vo.getBoardItemSrc() %>" alt="img" /><br /><font size="1px;"><%=vo.getBoardItemInfo() %></font>								
								</a>
									<div class="w3-dropdown-content" style="width:100px;">
										<img align="top" border="0" src="/itemImage/<%=vo.getBoardItemSrc() %>" alt="img" />
									</div>
							</div>
						</td>
						<% }%>
						<td class="<%= vo.getBoardNo() != vo.getBoardGroupNo() ? "reply" : ""%>">
						<%if(vo.getBoardNo() != vo.getBoardGroupNo()) {%> <i class="material-icons">&#xE5DA;</i> [re]<%}%>
							<a href="<%= vo.getSecret().equals("y") ? "/board/product/secret.jsp?bno="+vo.getBoardNo()+"&tno="+vo.getBoardType()+"&pno="+pageNo : "/board/boardDetail.jsp?bno="+vo.getBoardNo()+"&tno="+vo.getBoardType()+"&pno="+pageNo%>">
							<%=vo.getBoardTitle()%>
							<%if(vo.getSecret().equals("y") ) {
								%> <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> <% }
							int nullCount = 0; 
							boolean isAllFileNull = false;
							if (vo.getBoardFileName1() == null) { nullCount++;}
							if (vo.getBoardFileName2() == null) { nullCount++;}
							if (vo.getBoardFileName3() == null) { nullCount++;}
							if (vo.getBoardFileName4() == null) { nullCount++;}
							if (vo.getBoardFileName5() == null) { nullCount++;}
							if (nullCount == 5) {isAllFileNull = true;}
							if(!isAllFileNull) {%>
								<i class="material-icons">perm_media</i><%}if(isLogined) {if(_user.getNo() == 0 && tno < 5 ) { %>
								<i class="material-icons"><a href="/board/addBoardReviewForm.jsp?pno=<%=pno %>&tno=<%=tNo %>&gno=<%=vo.getBoardNo()%>&uno=<%=vo.getBoardUserNo()%>&bno=<%=vo.getBoardNo()%>">add_alert</a></i>	
								<%}								
							}%>
							</a>
						</td>
						<%if(tno == 6) {%>
						<td style="text-align: center;">
							<%if(vo.getBoardSatis() == 5.0) {%> 
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
						<% }%>
						<td style="text-align: center;"><%=vo.getUserName() %></td>
						<td style="text-align: center;"><%=vo.getSimpleDate() %></td>
						<td style="text-align: center;"><%=vo.getBoardReadCount() %></td>
					</tr>
				<%}%>
				</tbody>
			</table>
			<%if(tno < 5) {%>
			<div class="pull-right" style="padding-top: 10px;" >
				<a href="/board/addBoardForm.jsp?tno=<%=tno %>&pno=<%=pageNo %>&ino=2302" class="button"><strong>Add Write</strong></a>
			</div>
			<%}%>
			<div style="padding-top: 60px;" class="text-center form-group">
				<form action="/board/product/productBoard.jsp">
				<input type="hidden" name="tno" value="<%=tno%>"/>
				<input type="hidden" name="pno" value="1"/>
					<select class="w3-select w3-border" name="option1" style="width: 14%; height: 37px;">
						<option value="op1-w">one Weekend</option>
						<option value="op1-m">a Month</option>
						<option value="op1-y">a Year</option>
						<option value="op1-a">All Day</option>
					</select>
					<select class="w3-select w3-border" name="option2" style="width: 10%; height: 37px;">
						<option value="op2-product">Product</option>
						<option value="op2-writer">Writer</option>
						<option value="op2-title">Title</option>
						<option value="op2-contents">Contents</option>
					</select>
					<input type="text" name="searchInput" style="width: 30%; height: 30px;"/>
					<button type="submit" class="w3-btn" style="background-color: gray; height:30px; width:70px;">Search</button>	
				</form>
			</div>
		</div>
		
		<%//페이지 네이션 %>
		<div class="text-center" style="padding-top: 20px;">
			<ul class="w3-pagination">
			<%
			String hide1 = "";
			if(request.getParameter("pno") != null) {
				int hideNo = Integer.parseInt(request.getParameter("pno"));
				if (hideNo < 6) {
					hide1 = "hide";
				}
			}
			int firstNo = 1;
			if(request.getParameter("fno") != null) {
				firstNo = Integer.parseInt(request.getParameter("fno"));
			} else {
				hide1 = "hide";
			}
			PageNationUtil pagenationUtil = new PageNationUtil();
			int beforePage = pagenationUtil.getBeforePage(pageNo);
			%>
				<li class="<%=hide1 %>">
			      <a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=1" aria-label="Previous">
			        <span aria-hidden="true" class="glyphicon glyphicon-backward"></span>
			      </a>
			    </li>
			    <li class="<%=hide1 %>">
			    	<a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=beforePage%>&fno=<%=beforePage-4%>">
			    		<span class="glyphicon glyphicon-menu-left"></span>
			    	</a>
			    </li>
			<%
			String hide3 = "";
			int forCount = 4;
			String hide4 = "";
			firstNo = pagenationUtil.getFirstPage(firstNo, pageNo);
			for (int index=firstNo; index <= firstNo+forCount; index++) {
				if(index > lastPage) {
					hide3 = "hide";
				}
				if(lastPage < 6) {
					forCount = 4;
					hide4 = "hide";
				}
				if (index == pageNo) { %>
				<li class="w3-gray <%=hide3%>"><a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=index%>&fno=<%=firstNo %>" class="w3-gray"><%=index%></a></li>
				<%} else {%>
				<li class="<%=hide3 %>"><a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=index%>&fno=<%=firstNo %>"><%=index%></a></li>
				<%}
			}
				int nextPage = pagenationUtil.getNextPage(pageNo, lastPage);
			%>
			 	<li class="<%=hide4%>">
			 		<a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=nextPage%>&fno=<%=firstNo+5 %>">
			 			<span class="glyphicon glyphicon-menu-right">
			 			</span>
			 		</a>
			 	</li>
				<li class="<%=hide4%>">
			      <a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=lastPage%>" aria-label="Next">
			        <span aria-hidden="true" class="glyphicon glyphicon-forward"></span>
			      </a>
			    </li>
			</ul>
		</div>
</div>
<%@include file="../../footer.jsp" %>
</body>
<script type="text/javascript">
function bigImg(x) {
    x.style.height = "75px";
    x.style.width = "110px";
}

function normalImg(x) {
    x.style.height = "45px";
    x.style.width = "70px";
}
</script>
</html>