<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.MD5"%>
<%@page import="util.NumberUtil"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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

.listbutton {
  display: inline-block;
  border-radius: 4px;
  background-color: #f1f1f1;
  border: 1;
  color: #999999;
  text-align: center;
  font-size: 18px;
  padding: 5px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.listbutton span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.listbutton span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.listbutton:hover span {
  padding-right: 25px;
}

.listbutton:hover span:after {
  opacity: 1;
  right: 0;
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
	background-color: #555555;
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
<%
	request.setCharacterEncoding("utf-8");

	String tNo = request.getParameter("tno");
	String pno = request.getParameter("pno");
	String bNo = request.getParameter("bno");
	int tno = NumberUtil.StringToInt(tNo, 1);
	int bno = 1;
	if(tNo != null && bNo !=null) {
		tno = Integer.parseInt(tNo);
		bno = Integer.parseInt(bNo);
	}
	int pageNo = NumberUtil.StringToInt(pno, 1);

	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.getBoardDetailByNo(bno);
	String getPwd = request.getParameter("boardPwd");
	if(!isLogined) {
		response.sendRedirect("/board/product/secret.jsp?tno="+tNo+"&pno="+pno+"&bno="+bNo+"&err=deny");
		return;
	}
	if(getPwd != null) {	
		String getPwdChange = MD5.hash(getPwd);
		if(!vo.getBoardPwd().equals(getPwdChange) && (_user.getNo()!=0)) {
			response.sendRedirect("/board/product/secret.jsp?tno="+tNo+"&pno="+pno+"&bno="+bNo+"&err=deny");
			return;
		}
	}

	Cookie[] cookies = request.getCookies();
	Cookie viewCookie = null;
	if(cookies != null && cookies.length > 0) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("VIEWCOOKIE"+bNo)) {
				viewCookie = cookies[i];
			}
		}
	}
	// 뷰쿠기가 없을 때 readcount 증가
	if(viewCookie == null) {
		dao.addBoardReadCount(bno);
		Cookie newCookie = new Cookie("VIEWCOOKIE"+bNo, "|"+bNo+"|");
		newCookie.setMaxAge(20*60);
		response.addCookie(newCookie);
	} else {
		String value = viewCookie.getValue();
		if (value.indexOf("|"+bNo+"|") < 0) {
			value = value + "|" + bNo + "|";
			viewCookie.setValue(value);
			response.addCookie(viewCookie);
		}
	}

String err = request.getParameter("err");
if(err!=null) { %>
	<script type="text/javascript">alert('등록자가 아닙니다. 접근할 수 없습니다.')</script>
	<%}%>
	<div class="container" style="padding-bottom: 180;">
	<div class="row">
		<form action="/board/product/editBoardDetail.jsp" method="post"
			onsubmit="return editCheck();">
			<input type="hidden" name="tno" value="<%=tNo %>" /> <input
				type="hidden" name="boardPwd" value="<%=getPwd%>" /> <input
				type="hidden" name="pno" value="<%=pno %>" /> <input type="hidden"
				name="bno" value="<%=bNo %>" />
			<div
				style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
				<h1>
					<%if(tno == 1)  { %>
					교환/반품요청
					<%} else if (tno == 2) { %>
					배송전 변경
					<%} else if (tno == 3) { %>
					상품 문의
					<%} else if (tno == 4) { %>
					기타 문의
					<%} else if (tno == 6) { %>
					Review<%}%>
				</h1>
				<br />
			</div>
			<br /> <small class="pull-right">조회수 : <%=vo.getBoardReadCount() %></small>
			<div style="width: auto;">
				<table class="table table-default"
					style="border: 2px solid; border-color: #dddddd;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th class="tableTh1">Title</th>
							<td class="tableTh2"><%=vo.getBoardTitle()%></td>
						</tr>
						<tr>
							<th class="tableTh1">Writer</th>
							<td class="tableTh2"><%=vo.getUserName() %></td>
						</tr>
						<tr>
							<th class="tableTh1">Date</th>
							<td class="tableTh2"><%=vo.getSimpleDate() %></td>
						</tr>
						<tr>
							<th class="tableTh1">Category</th>
							<td class="tableTh2"><%=vo.getBoardCategory() %></td>
						</tr>
						<%if(tno == 6) {%> 
						<tr>
							<th class="tableTh1">Mark</th>
							<td class="tableTh2">
								<%if(vo.getBoardSatis() == 5.0) {%> <input
								type="radio" class="rating-input" id="rating-input-1-5"
								name="rating-input-1" checked disabled /> <label
								for="rating-input-1-5" class="rating-star"></label> <input
								type="radio" class="rating-input" id="rating-input-1-4"
								name="rating-input-2" disabled /> <label for="rating-input-1-4"
								class="rating-star"></label> <input type="radio"
								class="rating-input" id="rating-input-1-3" name="rating-input-3"
								disabled /> <label for="rating-input-1-3" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-2"
								name="rating-input-4" disabled /> <label for="rating-input-1-2"
								class="rating-star"></label> <input type="radio"
								class="rating-input" id="rating-input-1-1" name="rating-input-5"
								disabled /> <label for="rating-input-1-1" class="rating-star"></label>
								<%} else if(vo.getBoardSatis() == 4.0) {%> <input type="radio"
								class="rating-input" id="rating-input-1-4" name="rating-input-2"
								checked disabled /> <label for="rating-input-1-4"
								class="rating-star"></label> <input type="radio"
								class="rating-input" id="rating-input-1-3" name="rating-input-3"
								disabled /> <label for="rating-input-1-3" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-2"
								name="rating-input-4" disabled /> <label for="rating-input-1-2"
								class="rating-star"></label> <input type="radio"
								class="rating-input" id="rating-input-1-1" name="rating-input-5"
								disabled /> <label for="rating-input-1-1" class="rating-star"></label>
								<%} else if(vo.getBoardSatis() == 3.0) {%> <input type="radio"
								class="rating-input" id="rating-input-1-3" name="rating-input-3"
								checked disabled /> <label for="rating-input-1-3"
								class="rating-star"></label> <input type="radio"
								class="rating-input" id="rating-input-1-2" name="rating-input-4"
								disabled /> <label for="rating-input-1-2" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-1"
								name="rating-input-5" disabled /> <label for="rating-input-1-1"
								class="rating-star"></label> <%} else if(vo.getBoardSatis() == 2.0) {%>
								<input type="radio" class="rating-input" id="rating-input-1-2"
								name="rating-input-4" checked disabled /> <label
								for="rating-input-1-2" class="rating-star"></label> <input
								type="radio" class="rating-input" id="rating-input-1-1"
								name="rating-input-5" disabled /> <label for="rating-input-1-1"
								class="rating-star"></label> <%} else if(vo.getBoardSatis() == 1.0) {%>
								<input type="radio" class="rating-input" id="rating-input-1-1"
								name="rating-input-5" checked disabled /> <label
								for="rating-input-1-1" class="rating-star"></label> <%}%> <%}%>
							</td>
						</tr>
						<tr>
							<th class="tableTh1">Contents</th>
							<td class="tableTh2"><%=vo.getBoardContents().replace("\n", "<br/>") %></td>
						</tr>
						<% ArrayList<String> fileList = dao.getAllFileList(vo);
						boolean isNull = false;
						int nullCount = 0;
						for(String fileCheck : fileList) {
							if(fileCheck == null) {
								nullCount++;
							}
						}
						if(nullCount == 5) {
							isNull = true;
						}
						if(!isNull) {
							%> 
							<tr>
								<th class="tableTh1">Picture</th>
								<td class="tableTh2">
									<div class="row" style="padding-left: 10px;">
							<%	for(int i=0; i<fileList.size(); i++) {
									if(fileList.get(i) != null){%>
									<img src="/itemImage/upload/<%=fileList.get(i) %>" alt="img" class="w3-opacity w3-hover-opacity-off"
											height="120px" style="width:19.3%; cursor:none;  border : 3px solid black;"
											onclick="document.getElementById('modal0<%=i %>').style.display='block'"/>
							<%		}
								}
							%>
									</div>
								</td>
							</tr>
						<%}%>
					</tbody>
				</table>
			</div>
			<% if(_user==null) {%>
			<div style="padding-bottom: 10px;">
				<a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=pno %>"
					class="listbutton" style="vertical-align:middle"><span>List</span></a>
			</div>
			<%}
			if(_user!=null) {
				if(vo.getBoardUserNo() == _user.getNo() || _user.getNo() == 0) {%>		
				
				<a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=pno %>"
					class="listbutton" style="vertical-align:middle"><span>List</span></a>	
				<div class="pull-right">
				<p>
				<button type="submit" class="button" 
						onmouseover="style.backgroundColor='#282828'"
						onmouseout="style.backgroundColor='#f1f1f1'">Edit</button>
				<a href="/board/product/deleteBoard.jsp?tno=<%=tno %>&bno=<%=bNo %>"
						class="button"
						onmouseover="style.backgroundColor='#282828'"
						onmouseout="style.backgroundColor='#f1f1f1'" >Delete</a>
				</p>
				</div>

			<%}
			}%>
		</form>
		</div>
		<div class="row">
			<div>
				<table class="w3-table">
					<colgroup>
						<col width="15%"/>
						<col width="*"/>
						<col width="10%"/>
						<col width="10%"/>
					</colgroup>
					<tbody>
					<% 
					ReviewDAO reviewDAO = new ReviewDAO();
					ArrayList<ReviewVO> reviewList = reviewDAO.getAllBoardListByBoardNo(Integer.parseInt(bNo));
					if(!reviewList.isEmpty()) {
						for (ReviewVO review : reviewList) { %> 
						<tr>
							<th class="tableTh1" style="text-align: center;"><%=review.getReviewUserName() %></th>
							<td class="tableTh2"><%=review.getReviewContents().replace("\n", "<br/>")%>
								<input type="hidden" id="reviewTr" value="<%=review.getReviewNo()%>"/>
								<%if(_user.getNo() == review.getReviewUserNo()) { %>
								<a onclick="deleteReview();">
									<i class="material-icons">delete_forever</i>
								</a>
								<%}%>
							</td>
							<th class="tableTh1" style="text-align: center;"><%=review.getSimpleDateFormat() %></th>
							<th class="tableTh1" style="text-align: center;">
								<a href="/board/product/addReviewLikeProcess.jsp?rno=<%=review.getReviewNo()%>&bno=<%=bNo %>&tno=<%=tNo%>&pno=<%=pno%>"><span class="glyphicon glyphicon-thumbs-up">
								</span></a><br /><%=review.getReviewLike() %>
							</th>
						</tr>
						<% }
					}%>
					</tbody>
				</table>
			</div>
			<form action="/board/product/addReviewProcess.jsp" method="post" onsubmit="return commentCheck();">
				<input type="hidden" name="tno" value="<%=tNo %>"/>
				<input type="hidden" name="pno" value="<%=pno %>" />
				<input type="hidden" name="bno" value="<%=bNo %>" />
				<div class="input-group" style="padding-top: 15px;">
					<textarea name="reviewContents" class="form-control" id="rewview" cols="auto" rows="5" style="width : 100%; resize:none;"></textarea>
					<span class="input-group-btn"><button type="submit" class="btn btn-default" style="width: 116px; height: 114px; background-color: white;"><strong>Comment</strong></button></span>
				</div>
			</form>
		</div>		
	</div>
	<%@include file="../../footer.jsp"%>		
	<%
	if (fileList.size() != 0) {
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i) != null) {%>			
				<div id="modal0<%=i %>" class="w3-modal" onclick="this.style.display='none'">
				    <span class="w3-closebtn w3-hover-red w3-container w3-padding-16 w3-display-topright">&times;</span>
				    <div class="w3-modal-content w3-animate-zoom">
				      <img src="/itemImage/upload/<%=fileList.get(i) %>" style="width:100%">
				    </div>
				</div>
			<%}
		}
	 } %>
</body>
<script type="text/javascript">
	function commentCheck() {
		var commentEL = document.getElementById('rewview');
		var comment = commentEL.value;
		
		if(comment=="") {
			alert('내용을 입력하세요.');
			commentEL.focus();
			return false;
		}
		return true;
	}

	function deleteReview() {
 		var reviewTrEL = document.getElementById('reviewTr');
 		var reviewTr = reviewTrEL.value;
 		var reviewBody = document.getElementById('reviewTr').parentElement.parentElement.parentElement;
 		var xhr = new XMLHttpRequest();
 		
 		xhr.onreadystatechange = function() {
 			if(xhr.readyState == 4 && xhr.status == 200) {
 				var data = xhr.responseText.trim();
 				console.log(data);
 				if(data == "Y") {
 					document.getElementById('reviewTr').parentElement.parentElement.parentElement.removeChild(document.getElementById('reviewTr').parentElement.parentElement);
 				} else {
 					alert('삭제할 수 없습니다.');
 				}
 			}
 		}
 		xhr.open("GET", "/board/product/deleteReviewProcess.jsp?rno=" + reviewTr);
 		
 		xhr.send(null);
 	}
</script>
</html>