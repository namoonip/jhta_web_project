<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
.button5:hover {
	background-color: #555555;
	color: white;
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

.rating-star:hover, .rating-star:hover ~ .rating-star {
	background-position: 0 0;
}

.rating-wrapper:hover .rating-star:hover, .rating-wrapper:hover .rating-star:hover 
	 ~ .rating-star, .rating-input:checked ~ .rating-star {
	background-position: 0 0;
}

.rating-star, .rating-wrapper:hover .rating-star {
	float: right;
	display: block;
	width: 16px;
	height: 16px;
	background:
		url('http://css-stars.com/wp-content/uploads/2013/12/stars.png') 0
		-16px;
}
</style>
<body>
	<%@include file="../nav.jsp"%>
	<%
		if (!isLogined) {
			response.sendRedirect("/member/view/loginForm.jsp?err=deny");
			return;
		}
		int tno = 1;
		if (request.getParameter("tno") != null) {
			tno = Integer.parseInt(request.getParameter("tno"));
		}
	%>
	<div class="container">
		<div class="titlearea">
			<p>	Admin Writer <small style="font-size: 18px;"> | Admin Writer</small> </p>
		</div>
		<div class="panel">
			<form action="/board/addBoardReviewProcess.jsp" method="post" onsubmit="return formCheck()">
				<input type="hidden" name="pno"	value="1" /> 
				<input type="hidden" id="tno" name="tno" value="<%=request.getParameter("tno")%>" />
				<input type="hidden" name="ino" value="<%=request.getParameter("ino")%>" />
				<input type="hidden" name="gno" value="<%=request.getParameter("gno")%>"/>
				<input type="hidden" name="uno" value="<%=request.getParameter("uno")%>"/>
				<input type="hidden" name="bno" value="<%=request.getParameter("bno") %>" />
				<table class="table">
					<colgroup>
						<col width="18%" />
						<col width="*" />
					</colgroup>
					<thead>
					<tr style="text-align: center;">
							<th
								style="background-color: #fbf9fa; width: 100px; text-align: center;">Category</th>
							<th><select name="boardType" id="" class="form-control">
									<%if (request.getParameter("tno").equals("1")) {
									%>
									<option value="1">교환/반품 문의 답변입니다</option>
									<%}%>
									<%if (request.getParameter("tno").equals("2")) {
									%>
									<option value="2">배송전 변경 요청 문의 답변입니다</option>
									<%}%>
									<%if (request.getParameter("tno").equals("3")) {
									%>
									<option value="3">상품 문의 답변입니다</option>
									<%}%>
									<%if (request.getParameter("tno").equals("4")) {
									%>
									<option value="4">기타 문의 답변입니다</option>
									<%}%>
									<%if (request.getParameter("tno").equals("6")) {
									%>
									<option value="6">구매 후기 답변입니다</option>
									<%}%>
							</select></th>
						</tr>
						<tr style="text-align: center;">
							<th
								style="background-color: #fbf9fa; width: 100px; text-align: center;">Contents</th>
							<th><input type="text" class="form-control"
								name="boardTitle" id="board-Title" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2"><textarea name="boardContents"
									id="board-contents" cols="auto" rows="12"
									style="width: 100%; resize: none;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="pull-right" style="padding: 30px;">
					<button type="submit" class="w3-btn w3-gray w3-hover-black"
						style="background-color: #4a5164;">Add</button>
					<a
						href="/board/product/productBoard.jsp?tno=<%=request.getParameter("tno")%>&pno=<%=request.getParameter("pno")%>"
						class="w3-btn w3-gray w3-hover-black">Cancel</a>
				</div>
				<div class="footer"></div>
			</form>
		</div>
	</div>
	<%@include file="../../footer.jsp"%>
</body>
<script type="text/javascript">

	function formCheck() {
		var titleEL = document.getElementById("board-Title");
		var title = titleEL.value.trim();
		if (title == "") {
			alert('제목을 입력하세요.');
			titleEL.focus();
			return false;
		}

		var contentsEL = document.getElementById("board-contents");
		var contents = contentsEL.value.trim();
		if (contents == "") {
			alert('내용을 입력하세요.');
			contentsEL.focus();
			return false;
		}

		return true;
	}
</script>
</html>