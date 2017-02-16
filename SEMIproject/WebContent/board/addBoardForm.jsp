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
			<p>
				Write <small style="font-size: 18px;"> | Write</small>
			</p>
		</div>
		<div class="panel">
			<form action="/board/upload.do" method="post"
				onsubmit="return formCheck()" enctype="multipart/form-data">
				<input type="hidden" name="pno"	value="<%=request.getParameter("pno")%>" /> 
				<input type="hidden" id="tno" name="tno" value="<%=request.getParameter("tno")%>" />
				<input type="hidden" name="ino" value="<%=request.getParameter("ino")%>" />
				<%
					if (tno == 6) {
				%>
				<input type="hidden" name="board-password" value="0" /> 
				<input type="hidden" name="secret" value="n" />
				<%
					}
				%>


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
									<%
										if (request.getParameter("tno").equals("1")) {
									%>
									<option value="1">교환/반품 문의드립니다.</option>
									<%}%>
									<%
										if (request.getParameter("tno").equals("2")) {
									%>
									<option value="2">배송전 변경 요청 문의드립니다.</option>
									<%}%>
									<%
										if (request.getParameter("tno").equals("3")) {
									%>
									<option value="3">상품 문의드립니다.</option>
									<%}%>
									<%
										if (request.getParameter("tno").equals("4")) {
									%>
									<option value="4">기타 문의드립니다.</option>
									<%}%>
									<%
										if (request.getParameter("tno").equals("6")) {
									%>
									<option value="6">구매 후기입니다.</option>
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
						<%
							if (tno > 4) {
						%>
						<tr>
							<th>Mark</th>
							<td>
								<div class="rating-wrapper">
									<input type="radio" class="rating-input" id="rating-input-1-5"
										name="rating-input-1" value="5" /> <label
										for="rating-input-1-5" class="rating-star"></label> <input
										type="radio" class="rating-input" id="rating-input-1-4"
										name="rating-input-1" value="4" /> <label
										for="rating-input-1-4" class="rating-star"></label> <input
										type="radio" class="rating-input" id="rating-input-1-3"
										name="rating-input-1" value="3" checked /> <label
										for="rating-input-1-3" class="rating-star"></label> <input
										type="radio" class="rating-input" id="rating-input-1-2"
										name="rating-input-1" value="2" /> <label
										for="rating-input-1-2" class="rating-star"></label> <input
										type="radio" class="rating-input" id="rating-input-1-1"
										name="rating-input-1" value="1" /> <label
										for="rating-input-1-1" class="rating-star"></label>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<tbody>
						<tr>
							<th>UCC URL</th>
							<td><input type="text" style="width: 200px;" id="uccUrl"
								name="uccUrl" /></td>
						</tr>
						<tr>
							<th>ImgFile1</th>
							<td><input type="file" name="boardFileName1"
								id="boardFileName-1" onchange="fileExcheck(event);" /></td>
						</tr>
						<tr>
							<th>ImgFile2</th>
							<td><input type="file" name="boardFileName2"
								id="boardFileName-2" onchange="fileExcheck(event);" /></td>
						</tr>
						<tr>
							<th>ImgFile3</th>
							<td><input type="file" name="boardFileName3"
								id="boardFileName-3" onchange="fileExcheck(event);" /></td>
						</tr>
						<tr>
							<th>ImgFile4</th>
							<td><input type="file" name="boardFileName4"
								id="boardFileName-4" onchange="fileExcheck(event);" /></td>
						</tr>
						<tr>
							<th>ImgFile5</th>
							<td><input type="file" name="boardFileName5"
								id="boardFileName-5" onchange="fileExcheck(event);" /></td>
						</tr>
						<%
							if (tno != 6) {
						%>
						<tr>
							<th>Password</th>
							<td><input type="text" name="boardPwd" id="board-password"
								style="width: 30%;" /></td>
						</tr>
						<tr>
							<th>Open / Secret</th>
							<td><input type="radio" name="secret" value="n"
								id="board-open" onchange="chageSecret(event);" /> <label
								for="board-open">Open</label> <input type="radio" name="secret"
								value="y" id="board-close" onchange="chageSecret(event);"
								checked="checked" /> <label for="board-close">Secret</label></td>
						</tr>
						<%
							}
						%>
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


	// 비밀글 onchange Event
	function chageSecret(e) {
		var inputEL = document.getElementById("board-password");
		if (e.target.value == 'y') {
			inputEL.removeAttribute("disabled");
			inputEL.disalbed = false;
		} else if (e.target.value == 'n') {
			inputEL.value = "";
			inputEL.setAttribute("disabled", "disabled");
			inputEL.disalbed = true;
		}

	}

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


		var pwdEL = document.getElementById("board-password");
		var pwd = pwdEL.value.trim();
		if (pwd.length > 11) {
			alert('비밀번호는 10자 이하로 입력해주세요.');
			pwdEL.focus();
			return false;
		}

		if (pwd == "" && document.getElementById("board-close").checked) {
			alert('비밀글은 비밀번호를 입력해주세요.');
			pwdEL.focus();
			return false;
		}


		var uccUrlEL = document.getElementById("uccUrl");
		var uccUrl = uccUrlEL.value.trim();

		if (uccUrl.length > 100) {
			alert('UCC URL은 100자를 넘을 수 없습니다.');
			uccUrlEL.focus();
			return false;
		}

		return true;
	}

	function fileExcheck(e) {
		if (e.target.value) {
			var dot = e.target.value.lastIndexOf(".");
			var exit = e.target.value.substring(dot).toLowerCase();
			if (exit != ".jpg" && exit != ".JPEG" && exit != ".png") {
				alert('이미지 파일은 .jpg / .JPEG / .png 파일만 가능합니다.');
				e.target.focus();
				e.target.value = "";
			}
		}
		var files = new Array(5);
		var filesName = new Array(5);
		filesName[0] = document.getElementById("boardFileName-1").value;
		filesName[1] = document.getElementById("boardFileName-2").value;
		filesName[2] = document.getElementById("boardFileName-3").value;
		filesName[3] = document.getElementById("boardFileName-4").value;
		filesName[4] = document.getElementById("boardFileName-5").value;

		for (var i = 0; i < 5; i++) {
			if (!i == 0 && !filesName[i] == "") {
				if (filesName[0] == filesName[i]) {
					alert('중복된 파일 이름은 사용할 수 없습니다.');
					e.target.value = "";
					return;
				}
			}
		}
		for (var i = 0; i < 5; i++) {
			if (!i == 1 && !filesName[i] == "") {
				if (filesName[1] == filesName[i]) {
					alert('중복된 파일 이름은 사용할 수 없습니다.');
					e.target.value = "";
					return;
				}
			}
		}
		for (var i = 0; i < 5; i++) {
			if (!i == 2 && !filesName[i] == "") {
				if (filesName[2] == filesName[i]) {
					alert('중복된 파일 이름은 사용할 수 없습니다.');
					e.target.value = "";
					return;
				}
			}
		}
		for (var i = 0; i < 5; i++) {
			if (!i == 3 && !filesName[i] == "") {
				if (filesName[3] == filesName[i]) {
					alert('중복된 파일 이름은 사용할 수 없습니다.');
					e.target.value = "";
					return;
				}
			}
		}
		for (var i = 0; i < 5; i++) {
			if (!i == 4 && !filesName[i] == "") {
				if (filesName[4] == filesName[i]) {
					alert('중복된 파일 이름은 사용할 수 없습니다.');
					e.target.value = "";
					return;
				}
			}
		}

	}
</script>
</html>