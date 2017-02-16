<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>글 작성</title>
</head>
<body>
<%@ include file="common/header.jsp" %>
<%
	String type = request.getParameter("type");
%>
	<div class="container">
		<form action="blogregister.jsp" method="post"
			onsubmit="return formcheck()">
			<div class="row">
				<%
					if ("new".equals(type)) {
				%>
				<input type="hidden" name="type" value="new" />
				<%
					} else {
				%>
				<input type="hidden" name="type" value="re" /> <input type="hidden"
					name="gno" value="<%=request.getParameter("gno")%>" />
				<%
					}
				%>
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-success">
						<div class="panel-heading" style="font-size: 20px;">
							<strong>글 작성</strong>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label for="">제목</label> <input type="text" name="title"
									id="blog-title" class="form-control" />
							</div>
							<div class="form-group">
								<label for="">작성자</label> <input type="text" name="writer"
									id="blog-writer" class="form-control" />
							</div>
							<div class="form-group">
								<label for="">내용</label>
								<textarea name="contents" id="blog-contents" cols="30" rows="5"
									class="form-control"></textarea>
							</div>
							<label for="">비밀번호(숫자 4자리) <input type="password"
								name="pwd" id="blog-pwd" class="form-control" /></label>
						</div>
						<div class="panel-footer form-group pull-right">						
							<button class="btn btn-success" type="submit">등록</button>
							<a href="list.jsp" class="btn btn-danger">취소</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
function formcheck() {
	var titleEL = document.getElementById("blog-title");
	console.log(titleEL);
	var title = titleEL.value.trim();
	if(title=="") {
		alert('제목을 입력하세요');
		titleEL.focus();
		return false;
	}
	
	var writerEL = document.getElementById("blog-writer");
	var writer = writerEL.value.trim();
	if(writer=="") {
		alert("작성자를 입력하세요");
		writerEL.focus();
		return false;
	}
	
	var contentsEL = document.getElementById("blog-contents");
	var contents = contentsEL.value.trim();
	if(contents=="") {
		alert("내용을 입력하세요");
		contentsEL.focus();
		return false;
	}
	
	var pwdEL = document.getElementById("blog-pwd");
	var pwd = pwdEL.value.trim();
	if(pwd=="") {
		alert("패스워드를 입력하세요");
		pwdEL.focus();
		return false;
	}
	
	var pwdPattern = /[0-9]{4,4}/;
	if (!pwdPattern.test(pwd)) {
		alert("4자리 숫자만 가능합니다.");
		pwdEL.focus();
		return false;
	}
	
	return true;
}
</script>
</html>