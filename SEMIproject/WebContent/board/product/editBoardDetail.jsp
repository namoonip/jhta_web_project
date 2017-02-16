<%@page import="java.util.ArrayList"%>
<%@page import="util.MD5"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
// 파라미터 방어 코드
String tNo = request.getParameter("tno");
String pno = request.getParameter("pno");
String bno = request.getParameter("bno");
int tno = 1;
if(tNo != null) {
	tno = Integer.parseInt(tNo);
} else {
	response.sendRedirect("/member/view/loginForm.jsp?err=deny");
	return;
}
int pageNo = NumberUtil.StringToInt(pno, 1);

BoardDAO dao = new BoardDAO();
BoardVO vo = dao.getBoardDetailByNo(Integer.parseInt(bno));
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

#textareaCont {
   width: 100%;
   resize: none;
   padding-bottom: 0.2em;
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
  float: right;
  display: block;
  width: 16px;
  height: 16px;
  background: url('http://css-stars.com/wp-content/uploads/2013/12/stars.png') 0 -16px;
}
</style>
</head>
<body>
<%@include file="../../nav.jsp"%>
<%
if(!isLogined) {
	response.sendRedirect("/member/view/loginForm.jsp?err=deny");
	return;
}
if(_user.getNo() != vo.getBoardUserNo() && _user.getNo() != 0) {
	response.sendRedirect("/board/boardDetail.jsp?tno="+tno+"&pno="+pno+"&bno="+bno+"&err=deny");
	return;
}
%>
	<div class="container">
		<form action="/board/product/editBoardProcess.jsp" method="post">
		<input type="hidden" name="tno" value="<%=tNo %>"/>
		<input type="hidden" name="pno" value="<%=pno %>"/>
		<input type="hidden" name="bno" value="<%=bno %>"/>
			<div style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
				<h5><%if(tno == 1)  { %>
					교환/반품요청
				<%} else if (tno == 2) { %> 
					배송전 변경
				<%} else if (tno == 3) { %> 
					상품 문의
				<%} else if (tno == 4) { %> 
					기타 문의
				<%} else if (tno == 6) { %> 
					Review<%}%></h5>
				<p><strong style="font-size: 15px;">/</strong><br />
						문의사항
				</p><br />
			</div>
			<br />
			<div style="width: auto;">
				<table class="table table-default" style="border: 1px solid; border-color: #dddddd;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th class="tableTh1">Title</th>
						<td class="tableTh2"><input type="text" value="<%=vo.getBoardTitle()%>" name="boardTitle" id="boardTitle"/></td>
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
						<td class="tableTh2">
							<select name="boardType" id="board-Type" class="form-control">
						<%if(tno < 5) { %>
								<option value="1">교환/반품 문의드립니다.</option>
								<option value="2">배송전 변경 요청 문의드립니다.</option>
								<option value="3">상품 문의드립니다.</option>
								<option value="4">기타 문의드립니다.</option>
						<% } else { %>
								<option value="6">상품 후기입니다.</option>
						<%}%>
							</select>
						</td>
					</tr>
					<%if(tno == 6) {%> 
					<tr>
						<th class="tableTh1">평점</th>
						<td class="tableTh2">
						<div class="rating-wrapper">
						  <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1" value="5"/>
						  <label for="rating-input-1-5" class="rating-star"></label>
						  <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1" value="4"/>
						  <label for="rating-input-1-4" class="rating-star"></label>
						  <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1" value="3" checked/>
						  <label for="rating-input-1-3" class="rating-star"></label>
						  <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1" value="2"/>
						  <label for="rating-input-1-2" class="rating-star"></label>
						  <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1" value="1"/>
						  <label for="rating-input-1-1" class="rating-star"></label>
						</div>
						</td>
					</tr>
					<% }%>
					<tr>
						<th class="tableTh1">Contents</th>
						<td class="tableTh2"><textarea name="boardContents" id="textareaCont" cols="30" rows="10"><%=vo.getBoardContents()%></textarea></td>
					</tr>
					<%ArrayList<String> fileList = dao.getAllFileList(vo); 
						int[] count = new int[5];
						int searchCount = 1;%>
						<tr>
							<th class="tableTh1">Picture</th>
							<td class="tableTh2"> 주의! 파일을 클릭하면 삭제됩니다! <br />
							<div class="w3-layout-container">
								<div class="row" style="padding-left: 10px;">
						<%for(String fileName : fileList) {
								if(fileName != null){%>
								<img src="/itemImage/upload/<%=fileName %>" alt="img" class="w3-opacity w3-hover-opacity-off"
										height="120px" style="width:19.3%;cursor:no-drop; border : 3px solid black;" id="<%=fileName %>"
										onclick="deleteFile(event)"/>
								<input type="hidden" id="board-No" value="<%=bno%>"/>
									<% searchCount++;
									}
								}
							%>
								</div>
							</div>
						</td>
				</table>
			</div>
				<a href="/board/product/productBoard.jsp?tno=<%=tno %>&pno=<%=pno %>" class="listbutton" style="vertical-align:middle"><span>List</span></a>
			<div class="pull-right">
				<button type="submit" class="button" onmouseover="style.backgroundColor='#282828'"
						onmouseout="style.backgroundColor='#f1f1f1'">Edit</button>
				<a href="/board/product/deleteBoard.jsp?tno=<%=tno %>&bno=<%=bno %>&tno=<%=tno %>" class="button" onmouseover="style.backgroundColor='#282828'"
						onmouseout="style.backgroundColor='#f1f1f1'">Delete</a>
			</div>
		</form>
	</div>
<%@include file="../../footer.jsp" %>
</body>
<script type="text/javascript">
	function deleteFile(e) {
		var fileId = e.target.id;
		var boardNo = document.getElementById('board-No').value;
		var fileParent = document.getElementById(e.target.id).parentElement;
		if(fileId) {
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText.trim();
					fileParent.removeChild(document.getElementById(data));						
				}
			}
			xhr.open("GET", "deleteFileNameProcess.jsp?fileNo="+ fileId +"&bno=" + boardNo);
			
			xhr.send(null);
		}
	}

 function contentsCheck(){
	 var contentsEL = document.getElementById("contents");
	 var contens = contentsEL.value.trim();
	 if (contens=="") {
		alert("내용을 입력하세요.");
		return false;
	 }
	 
	 var titleEL = document.getElementById("boardTitle");
	 var title = titleEL.value.trim();
	 if (title=="") {
		 alert("제목을 입력하세요.");
		 return false;
	 }
	 return true;
 }
 
 var TypeEL = document.getElementById("board-Type").options.length;
 for (var i=0; i<=TypeEL; i++) {
	 if(i === <%=tno-1%>) {
		 document.getElementById("board-Type").options[i].setAttribute("selected", "selected");
	 }
 }
</script>
</html>